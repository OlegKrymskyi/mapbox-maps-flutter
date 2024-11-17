package com.mapbox.maps.mapbox_maps

import kotlinx.coroutines.launch
import android.annotation.SuppressLint
import android.content.Context
import android.content.res.Resources
import androidx.lifecycle.Lifecycle
import androidx.lifecycle.LifecycleOwner
import androidx.lifecycle.coroutineScope
import com.mapbox.maps.MapView
import com.mapbox.geojson.Point
import com.mapbox.common.location.Location
import com.mapbox.maps.EdgeInsets
import com.mapbox.maps.plugin.animation.camera
import com.mapbox.maps.plugin.locationcomponent.location
import com.mapbox.maps.mapbox_maps.pigeons.*
import com.mapbox.maps.mapbox_maps.mapping.*
import com.mapbox.navigation.base.extensions.applyDefaultNavigationOptions
import com.mapbox.navigation.base.route.NavigationRoute
import com.mapbox.navigation.base.route.NavigationRouterCallback
import com.mapbox.navigation.base.route.RouterFailure
import com.mapbox.navigation.base.route.RouterOrigin
import com.mapbox.navigation.core.MapboxNavigation
import com.mapbox.navigation.core.directions.session.RoutesObserver
import com.mapbox.navigation.core.lifecycle.MapboxNavigationApp
import com.mapbox.navigation.core.trip.session.LocationMatcherResult
import com.mapbox.navigation.core.trip.session.LocationObserver
import com.mapbox.navigation.core.trip.session.RouteProgressObserver
import com.mapbox.navigation.ui.maps.camera.NavigationCamera
import com.mapbox.navigation.ui.maps.camera.data.MapboxNavigationViewportDataSource
import com.mapbox.navigation.ui.maps.camera.lifecycle.NavigationBasicGesturesHandler
import com.mapbox.navigation.ui.maps.camera.transition.NavigationCameraTransitionOptions
import com.mapbox.navigation.ui.maps.location.NavigationLocationProvider
import com.mapbox.navigation.ui.maps.route.line.MapboxRouteLineApiExtensions.setNavigationRoutes
import com.mapbox.navigation.ui.maps.route.line.api.MapboxRouteLineApi
import com.mapbox.navigation.ui.maps.route.line.api.MapboxRouteLineView
import com.mapbox.navigation.ui.maps.route.line.model.MapboxRouteLineApiOptions
import com.mapbox.navigation.ui.maps.route.line.model.MapboxRouteLineViewOptions
import com.mapbox.api.directions.v5.models.RouteOptions
import com.mapbox.navigation.ui.maps.NavigationStyles
import com.mapbox.navigation.ui.maps.camera.state.NavigationCameraState
import io.flutter.plugin.common.BinaryMessenger

class NavigationController(
  private val context: Context,
  private val mapView: MapView,
  override val lifecycle: Lifecycle
) : NavigationInterface,
  LifecycleOwner {

  private var fltNavigationListener: NavigationListener? = null

  fun addListeners(messenger: BinaryMessenger, channelSuffix: String) {
    fltNavigationListener = NavigationListener(messenger, channelSuffix)
  }

  fun removeListeners() {
  }

  /**
   * Used to execute camera transitions based on the data generated by the [viewportDataSource].
   * This includes transitions from route overview to route following and continuously updating the camera as the location changes.
   */
  private val navigationCamera: NavigationCamera

  /**
   * Produces the camera frames based on the location and routing data for the [navigationCamera] to execute.
   */
  private lateinit var viewportDataSource: MapboxNavigationViewportDataSource

  private lateinit var navigationLocationProvider: NavigationLocationProvider

  /*
    * Below are generated camera padding values to ensure that the route fits well on screen while
    * other elements are overlaid on top of the map (including instruction view, buttons, etc.)
    */
  private val pixelDensity = Resources.getSystem().displayMetrics.density
  private val overviewPadding: EdgeInsets by lazy {
    EdgeInsets(
      140.0 * pixelDensity,
      40.0 * pixelDensity,
      120.0 * pixelDensity,
      40.0 * pixelDensity
    )
  }
  private val followingPadding: EdgeInsets by lazy {
    EdgeInsets(
      180.0 * pixelDensity,
      40.0 * pixelDensity,
      150.0 * pixelDensity,
      40.0 * pixelDensity
    )
  }

  /**
   * Generates updates for the [routeLineView] with the geometries and properties of the routes that should be drawn on the map.
   */
  private val routeLineApi: MapboxRouteLineApi

  /**
   * Draws route lines on the map based on the data from the [routeLineApi]
   */
  private val routeLineView: MapboxRouteLineView

  /**
   * Gets notified with location updates.
   *
   * Exposes raw updates coming directly from the location services
   * and the updates enhanced by the Navigation SDK (cleaned up and matched to the road).
   */
  private val locationObserver: LocationObserver

  /**
   * Gets notified with progress along the currently active route.
   */
  private val routeProgressObserver = RouteProgressObserver { routeProgress ->
    // update the camera position to account for the progressed fragment of the route
    viewportDataSource.onRouteProgressChanged(routeProgress)
    viewportDataSource.evaluate()

    this.fltNavigationListener?.onRouteProgress(routeProgress.toFLT()) {}
  }

  /**
   * Gets notified whenever the tracked routes change.
   *
   * A change can mean:
   * - routes get changed with [MapboxNavigation.setNavigationRoutes]
   * - routes annotations get refreshed (for example, congestion annotation that indicate the live traffic along the route)
   * - driver got off route and a reroute was executed
   */
  private val routesObserver: RoutesObserver

  private var mapboxNavigation: MapboxNavigation?

  private fun setNavigationRoutes(routes: List<NavigationRoute>) {
    // disable navigation camera
    navigationCamera.requestNavigationCameraToIdle()
    // set a route to receive route progress updates and provide a route reference
    // to the viewport data source (via RoutesObserver)
    mapboxNavigation?.setNavigationRoutes(routes)
    // enable the camera back
    navigationCamera.requestNavigationCameraToOverview()
  }

  init {
    val mapboxMap = this.mapView.mapboxMap

    this.navigationLocationProvider =
      this.mapView.location.getLocationProvider() as NavigationLocationProvider

    // initialize Navigation Camera
    viewportDataSource = MapboxNavigationViewportDataSource(mapboxMap)
    navigationCamera = NavigationCamera(
      mapboxMap,
      this.mapView.camera,
      viewportDataSource
    )
    // set the animations lifecycle listener to ensure the NavigationCamera stops
    // automatically following the user location when the map is interacted with
    this.mapView.camera.addCameraAnimationsLifecycleListener(
      NavigationBasicGesturesHandler(navigationCamera)
    )
    navigationCamera.registerNavigationCameraStateChangeObserver { navigationCameraState ->
      com.mapbox.maps.mapbox_maps.pigeons.NavigationCameraState.ofRaw(navigationCameraState.ordinal)
        ?.let {
          fltNavigationListener?.onNavigationCameraStateChanged(
            it
          ) {}
        }
    }
    // set the padding values depending to correctly frame maneuvers and the puck
    viewportDataSource.overviewPadding = overviewPadding
    viewportDataSource.followingPadding = followingPadding

    // initialize route line, the routeLineBelowLayerId is specified to place
    // the route line below road labels layer on the map
    // the value of this option will depend on the style that you are using
    // and under which layer the route line should be placed on the map layers stack
    val belowLayerId = if (mapView.mapboxMap.style?.styleLayerExists("road-label") == true) {
      "road-label"
    } else {
      "mapbox-location-indicator-layer"
    }

    val mapboxRouteLineOptions = MapboxRouteLineViewOptions.Builder(context)
      .routeLineBelowLayerId(belowLayerId)
      .build()
    routeLineApi = MapboxRouteLineApi(MapboxRouteLineApiOptions.Builder().build())
    routeLineView = MapboxRouteLineView(mapboxRouteLineOptions)

    locationObserver = object : LocationObserver {
      var firstLocationUpdateReceived = false

      override fun onNewRawLocation(rawLocation: Location) {
        // not handled
      }

      override fun onNewLocationMatcherResult(locationMatcherResult: LocationMatcherResult) {
        val enhancedLocation = locationMatcherResult.enhancedLocation
        // update location puck's position on the map
        navigationLocationProvider.changePosition(
          location = enhancedLocation,
          keyPoints = locationMatcherResult.keyPoints,
        )

        // update camera position to account for new location
        viewportDataSource.onLocationChanged(enhancedLocation)
        viewportDataSource.evaluate()

        fltNavigationListener?.onNewLocation(enhancedLocation.toFLT()) {}

        // if this is the first location update the activity has received,
        // it's best to immediately move the camera to the current user location
        if (!firstLocationUpdateReceived) {
          firstLocationUpdateReceived = true
          navigationCamera.requestNavigationCameraToOverview(
            stateTransitionOptions = NavigationCameraTransitionOptions.Builder()
              .maxDuration(0) // instant transition
              .build()
          )
        }
      }
    }

    routesObserver = RoutesObserver { routeUpdateResult ->
      lifecycle.coroutineScope.launch {
        if (routeUpdateResult.navigationRoutes.isNotEmpty()) {
          routeLineApi.setNavigationRoutes(
            newRoutes = routeUpdateResult.navigationRoutes,
          ).apply {
            if (mapView.mapboxMap.style != null) {
              routeLineView.renderRouteDrawData(
                mapView.mapboxMap.style!!,
                this
              )
            }
          }
          // update the camera position to account for the new route
          viewportDataSource.onRouteChanged(routeUpdateResult.navigationRoutes.first())
          viewportDataSource.evaluate()

          fltNavigationListener?.onNavigationRouteRendered() { }
        } else {
          routeLineApi.clearRouteLine { value ->
            routeLineView.renderClearRouteLineValue(
              mapView.mapboxMap.style!!,
              value
            )
          }
          // remove the route reference from camera position evaluations
          viewportDataSource.clearRouteData()
          viewportDataSource.evaluate()
        }
      }
    }

    MapboxNavigationApp.attach(this)
    mapboxNavigation = MapboxNavigationApp.current()

    mapboxNavigation!!.registerRoutesObserver(routesObserver)
    mapboxNavigation!!.registerLocationObserver(locationObserver)
    mapboxNavigation!!.registerRouteProgressObserver(routeProgressObserver)
  }

  fun dispose() {
    mapboxNavigation!!.stopTripSession()
    mapboxNavigation!!.unregisterRoutesObserver(routesObserver)
    mapboxNavigation!!.unregisterLocationObserver(locationObserver)
    mapboxNavigation!!.unregisterRouteProgressObserver(routeProgressObserver)
    routeLineApi.cancel()
    routeLineView.cancel()
  }

  @SuppressLint("MissingPermission")
  override fun setRoute(waypoints: List<Point>, callback: (Result<Unit>) -> Unit) {
    mapboxNavigation?.requestRoutes(
      RouteOptions.builder()
        .applyDefaultNavigationOptions()
        .alternatives(false)
        .coordinatesList(waypoints)
        .build(),

      object : NavigationRouterCallback {
        override fun onRoutesReady(
          routes: List<NavigationRoute>,
          @RouterOrigin routerOrigin: String
        ) {
          setNavigationRoutes(routes)
          fltNavigationListener?.onNavigationRouteReady() { }
        }

        override fun onFailure(
          reasons: List<RouterFailure>,
          routeOptions: RouteOptions
        ) {
          fltNavigationListener?.onNavigationRouteFailed() { }
        }

        override fun onCanceled(
          routeOptions: RouteOptions,
          @RouterOrigin routerOrigin: String
        ) {
          fltNavigationListener?.onNavigationRouteCancelled() { }
        }
      }
    )
    NavigationStyles.NAVIGATION_DAY_STYLE
    callback(Result.success(Unit))
  }

  override fun stopTripSession(callback: (Result<Unit>) -> Unit) {
    // disable navigation camera
    navigationCamera.requestNavigationCameraToIdle()
    mapboxNavigation?.stopTripSession()
    callback(Result.success(Unit))
  }

  @SuppressLint("MissingPermission")
  override fun startTripSession(withForegroundService: Boolean, callback: (Result<Unit>) -> Unit) {
    mapboxNavigation!!.startTripSession(withForegroundService)
    callback(Result.success(Unit))
  }

  override fun requestNavigationCameraToFollowing(callback: (Result<Unit>) -> Unit) {
    navigationCamera.requestNavigationCameraToFollowing()
    callback(Result.success(Unit))
  }

  override fun requestNavigationCameraToOverview(callback: (Result<Unit>) -> Unit) {
    navigationCamera.requestNavigationCameraToOverview()
    callback(Result.success(Unit))
  }

  override fun lastLocation(callback: (Result<NavigationLocation?>) -> Unit) {
    val point = this.navigationLocationProvider.lastLocation
    if (point == null) {
      callback.invoke(Result.success<NavigationLocation?>(null))
      return
    }

    callback.invoke(Result.success<NavigationLocation?>(point.toFLT()))
  }
}