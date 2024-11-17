// Autogenerated from Pigeon (v22.6.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon
@file:Suppress("UNCHECKED_CAST", "ArrayInDataClass")

package com.mapbox.maps.mapbox_maps.pigeons

import android.util.Log
import com.mapbox.maps.mapbox_maps.mapping.turf.FeatureDecoder
import com.mapbox.maps.mapbox_maps.mapping.turf.PointDecoder
import com.mapbox.maps.mapbox_maps.mapping.turf.toList
import io.flutter.plugin.common.BasicMessageChannel
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MessageCodec
import io.flutter.plugin.common.StandardMessageCodec
import java.io.ByteArrayOutputStream
import java.nio.ByteBuffer

import com.mapbox.geojson.Feature
import com.mapbox.geojson.Point
import com.mapbox.maps.mapbox_maps.mapping.turf.*

private fun wrapResult(result: Any?): List<Any?> {
  return listOf(result)
}

private fun wrapError(exception: Throwable): List<Any?> {
  return if (exception is FlutterError) {
    listOf(
      exception.code,
      exception.message,
      exception.details
    )
  } else {
    listOf(
      exception.javaClass.simpleName,
      exception.toString(),
      "Cause: " + exception.cause + ", Stacktrace: " + Log.getStackTraceString(exception)
    )
  }
}

private fun createConnectionError(channelName: String): FlutterError {
  return FlutterError("channel-error",  "Unable to establish connection on channel: '$channelName'.", "")}

enum class NavigationCameraState(val raw: Int) {
  IDLE(0),
  TRANSITION_TO_FOLLOWING(1),
  FOLLOWING(2),
  TRANSITION_TO_OVERVIEW(3),
  OVERVIEW(4);

  companion object {
    fun ofRaw(raw: Int): NavigationCameraState? {
      return values().firstOrNull { it.raw == raw }
    }
  }
}

enum class RouteProgressState(val raw: Int) {
  INITIALIZED(0),
  TRACKING(1),
  COMPLETE(2),
  OFF_ROUTE(3),
  UNCERTAIN(4);

  companion object {
    fun ofRaw(raw: Int): RouteProgressState? {
      return values().firstOrNull { it.raw == raw }
    }
  }
}

enum class RoadObjectLocationType(val raw: Int) {
  GANTRY(0),
  OPEN_LR_LINE(1),
  OPEN_LR_POINT(2),
  POINT(3),
  POLYGON(4),
  POLYLINE(5),
  ROUTE_ALERT(6),
  SUBGRAPH(7);

  companion object {
    fun ofRaw(raw: Int): RoadObjectLocationType? {
      return values().firstOrNull { it.raw == raw }
    }
  }
}

/** Generated class from Pigeon that represents data sent in messages. */
data class NavigationLocation (
  val latitude: Double? = null,
  val longitude: Double? = null,
  val timestamp: Long? = null,
  val monotonicTimestamp: Long? = null,
  val altitude: Double? = null,
  val horizontalAccuracy: Double? = null,
  val verticalAccuracy: Double? = null,
  val speed: Double? = null,
  val speedAccuracy: Double? = null,
  val bearing: Double? = null,
  val bearingAccuracy: Double? = null,
  val floor: Long? = null,
  val source: String? = null
)
 {
  companion object {
    fun fromList(pigeonVar_list: List<Any?>): NavigationLocation {
      val latitude = pigeonVar_list[0] as Double?
      val longitude = pigeonVar_list[1] as Double?
      val timestamp = pigeonVar_list[2] as Long?
      val monotonicTimestamp = pigeonVar_list[3] as Long?
      val altitude = pigeonVar_list[4] as Double?
      val horizontalAccuracy = pigeonVar_list[5] as Double?
      val verticalAccuracy = pigeonVar_list[6] as Double?
      val speed = pigeonVar_list[7] as Double?
      val speedAccuracy = pigeonVar_list[8] as Double?
      val bearing = pigeonVar_list[9] as Double?
      val bearingAccuracy = pigeonVar_list[10] as Double?
      val floor = pigeonVar_list[11] as Long?
      val source = pigeonVar_list[12] as String?
      return NavigationLocation(latitude, longitude, timestamp, monotonicTimestamp, altitude, horizontalAccuracy, verticalAccuracy, speed, speedAccuracy, bearing, bearingAccuracy, floor, source)
    }
  }
  fun toList(): List<Any?> {
    return listOf(
      latitude,
      longitude,
      timestamp,
      monotonicTimestamp,
      altitude,
      horizontalAccuracy,
      verticalAccuracy,
      speed,
      speedAccuracy,
      bearing,
      bearingAccuracy,
      floor,
      source,
    )
  }
}

/** Generated class from Pigeon that represents data sent in messages. */
data class RoadObject (
  val id: String? = null,
  val objectType: RoadObjectLocationType? = null,
  val length: Double? = null,
  val provider: String? = null,
  val isUrban: Boolean? = null
)
 {
  companion object {
    fun fromList(pigeonVar_list: List<Any?>): RoadObject {
      val id = pigeonVar_list[0] as String?
      val objectType = pigeonVar_list[1] as RoadObjectLocationType?
      val length = pigeonVar_list[2] as Double?
      val provider = pigeonVar_list[3] as String?
      val isUrban = pigeonVar_list[4] as Boolean?
      return RoadObject(id, objectType, length, provider, isUrban)
    }
  }
  fun toList(): List<Any?> {
    return listOf(
      id,
      objectType,
      length,
      provider,
      isUrban,
    )
  }
}

/** Generated class from Pigeon that represents data sent in messages. */
data class RoadObjectDistanceInfo (
  val distanceToStart: Double? = null
)
 {
  companion object {
    fun fromList(pigeonVar_list: List<Any?>): RoadObjectDistanceInfo {
      val distanceToStart = pigeonVar_list[0] as Double?
      return RoadObjectDistanceInfo(distanceToStart)
    }
  }
  fun toList(): List<Any?> {
    return listOf(
      distanceToStart,
    )
  }
}

/** Generated class from Pigeon that represents data sent in messages. */
data class UpcomingRoadObject (
  val roadObject: RoadObject? = null,
  val distanceToStart: Double? = null,
  val distanceInfo: RoadObjectDistanceInfo? = null
)
 {
  companion object {
    fun fromList(pigeonVar_list: List<Any?>): UpcomingRoadObject {
      val roadObject = pigeonVar_list[0] as RoadObject?
      val distanceToStart = pigeonVar_list[1] as Double?
      val distanceInfo = pigeonVar_list[2] as RoadObjectDistanceInfo?
      return UpcomingRoadObject(roadObject, distanceToStart, distanceInfo)
    }
  }
  fun toList(): List<Any?> {
    return listOf(
      roadObject,
      distanceToStart,
      distanceInfo,
    )
  }
}

/** Generated class from Pigeon that represents data sent in messages. */
data class RouteProgress (
  val bannerInstructionsJson: String? = null,
  val voiceInstructionsJson: String? = null,
  val currentState: RouteProgressState? = null,
  val inTunnel: Boolean? = null,
  val distanceRemaining: Double? = null,
  val distanceTraveled: Double? = null,
  val durationRemaining: Double? = null,
  val fractionTraveled: Double? = null,
  val remainingWaypoints: Long? = null,
  val upcomingRoadObjects: List<UpcomingRoadObject>? = null,
  val stale: Boolean? = null,
  val routeAlternativeId: String? = null,
  val currentRouteGeometryIndex: Long? = null,
  val inParkingAisle: Boolean? = null
)
 {
  companion object {
    fun fromList(pigeonVar_list: List<Any?>): RouteProgress {
      val bannerInstructionsJson = pigeonVar_list[0] as String?
      val voiceInstructionsJson = pigeonVar_list[1] as String?
      val currentState = pigeonVar_list[2] as RouteProgressState?
      val inTunnel = pigeonVar_list[3] as Boolean?
      val distanceRemaining = pigeonVar_list[4] as Double?
      val distanceTraveled = pigeonVar_list[5] as Double?
      val durationRemaining = pigeonVar_list[6] as Double?
      val fractionTraveled = pigeonVar_list[7] as Double?
      val remainingWaypoints = pigeonVar_list[8] as Long?
      val upcomingRoadObjects = pigeonVar_list[9] as List<UpcomingRoadObject>?
      val stale = pigeonVar_list[10] as Boolean?
      val routeAlternativeId = pigeonVar_list[11] as String?
      val currentRouteGeometryIndex = pigeonVar_list[12] as Long?
      val inParkingAisle = pigeonVar_list[13] as Boolean?
      return RouteProgress(bannerInstructionsJson, voiceInstructionsJson, currentState, inTunnel, distanceRemaining, distanceTraveled, durationRemaining, fractionTraveled, remainingWaypoints, upcomingRoadObjects, stale, routeAlternativeId, currentRouteGeometryIndex, inParkingAisle)
    }
  }
  fun toList(): List<Any?> {
    return listOf(
      bannerInstructionsJson,
      voiceInstructionsJson,
      currentState,
      inTunnel,
      distanceRemaining,
      distanceTraveled,
      durationRemaining,
      fractionTraveled,
      remainingWaypoints,
      upcomingRoadObjects,
      stale,
      routeAlternativeId,
      currentRouteGeometryIndex,
      inParkingAisle,
    )
  }
}
private open class NavigationMessagerPigeonCodec : StandardMessageCodec() {
  override fun readValueOfType(type: Byte, buffer: ByteBuffer): Any? {
    return when (type) {
      151.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          PointDecoder.fromList(it)
        }
      }
      152.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          FeatureDecoder.fromList(it)
        }
      }
      191.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          NavigationLocation.fromList(it)
        }
      }
      192.toByte() -> {
        return (readValue(buffer) as Long?)?.let {
          RouteProgressState.ofRaw(it.toInt())
        }
      }
      193.toByte() -> {
        return (readValue(buffer) as Long?)?.let {
          RoadObjectLocationType.ofRaw(it.toInt())
        }
      }
      194.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          RoadObject.fromList(it)
        }
      }
      195.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          RoadObjectDistanceInfo.fromList(it)
        }
      }
      196.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          UpcomingRoadObject.fromList(it)
        }
      }
      197.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          RouteProgress.fromList(it)
        }
      }
      198.toByte() -> {
        return (readValue(buffer) as Long?)?.let {
          NavigationCameraState.ofRaw(it.toInt())
        }
      }
      else -> super.readValueOfType(type, buffer)
    }
  }
  override fun writeValue(stream: ByteArrayOutputStream, value: Any?)   {
    when (value) {
      is Point -> {
        stream.write(151)
        writeValue(stream, value.toList())
      }
      is Feature -> {
        stream.write(152)
        writeValue(stream, value.toList())
      }
      is NavigationLocation -> {
        stream.write(191)
        writeValue(stream, value.toList())
      }
      is RouteProgressState -> {
        stream.write(192)
        writeValue(stream, value.raw)
      }
      is RoadObjectLocationType -> {
        stream.write(193)
        writeValue(stream, value.raw)
      }
      is RoadObject -> {
        stream.write(194)
        writeValue(stream, value.toList())
      }
      is RoadObjectDistanceInfo -> {
        stream.write(195)
        writeValue(stream, value.toList())
      }
      is UpcomingRoadObject -> {
        stream.write(196)
        writeValue(stream, value.toList())
      }
      is RouteProgress -> {
        stream.write(197)
        writeValue(stream, value.toList())
      }
      is NavigationCameraState -> {
        stream.write(198)
        writeValue(stream, value.raw)
      }
      else -> super.writeValue(stream, value)
    }
  }
}


/** Generated class from Pigeon that represents Flutter messages that can be called from Kotlin. */
class NavigationListener(private val binaryMessenger: BinaryMessenger, private val messageChannelSuffix: String = "") {
  companion object {
    /** The codec used by NavigationListener. */
    val codec: MessageCodec<Any?> by lazy {
      NavigationMessagerPigeonCodec()
    }
  }
  fun onNavigationRouteReady(callback: (Result<Unit>) -> Unit)
{
    val separatedMessageChannelSuffix = if (messageChannelSuffix.isNotEmpty()) ".$messageChannelSuffix" else ""
    val channelName = "dev.flutter.pigeon.mapbox_maps_flutter.NavigationListener.onNavigationRouteReady$separatedMessageChannelSuffix"
    val channel = BasicMessageChannel<Any?>(binaryMessenger, channelName, codec)
    channel.send(null) {
      if (it is List<*>) {
        if (it.size > 1) {
          callback(Result.failure(FlutterError(it[0] as String, it[1] as String, it[2] as String?)))
        } else {
          callback(Result.success(Unit))
        }
      } else {
        callback(Result.failure(createConnectionError(channelName)))
      } 
    }
  }
  fun onNavigationRouteFailed(callback: (Result<Unit>) -> Unit)
{
    val separatedMessageChannelSuffix = if (messageChannelSuffix.isNotEmpty()) ".$messageChannelSuffix" else ""
    val channelName = "dev.flutter.pigeon.mapbox_maps_flutter.NavigationListener.onNavigationRouteFailed$separatedMessageChannelSuffix"
    val channel = BasicMessageChannel<Any?>(binaryMessenger, channelName, codec)
    channel.send(null) {
      if (it is List<*>) {
        if (it.size > 1) {
          callback(Result.failure(FlutterError(it[0] as String, it[1] as String, it[2] as String?)))
        } else {
          callback(Result.success(Unit))
        }
      } else {
        callback(Result.failure(createConnectionError(channelName)))
      } 
    }
  }
  fun onNavigationRouteCancelled(callback: (Result<Unit>) -> Unit)
{
    val separatedMessageChannelSuffix = if (messageChannelSuffix.isNotEmpty()) ".$messageChannelSuffix" else ""
    val channelName = "dev.flutter.pigeon.mapbox_maps_flutter.NavigationListener.onNavigationRouteCancelled$separatedMessageChannelSuffix"
    val channel = BasicMessageChannel<Any?>(binaryMessenger, channelName, codec)
    channel.send(null) {
      if (it is List<*>) {
        if (it.size > 1) {
          callback(Result.failure(FlutterError(it[0] as String, it[1] as String, it[2] as String?)))
        } else {
          callback(Result.success(Unit))
        }
      } else {
        callback(Result.failure(createConnectionError(channelName)))
      } 
    }
  }
  fun onNavigationRouteRendered(callback: (Result<Unit>) -> Unit)
{
    val separatedMessageChannelSuffix = if (messageChannelSuffix.isNotEmpty()) ".$messageChannelSuffix" else ""
    val channelName = "dev.flutter.pigeon.mapbox_maps_flutter.NavigationListener.onNavigationRouteRendered$separatedMessageChannelSuffix"
    val channel = BasicMessageChannel<Any?>(binaryMessenger, channelName, codec)
    channel.send(null) {
      if (it is List<*>) {
        if (it.size > 1) {
          callback(Result.failure(FlutterError(it[0] as String, it[1] as String, it[2] as String?)))
        } else {
          callback(Result.success(Unit))
        }
      } else {
        callback(Result.failure(createConnectionError(channelName)))
      } 
    }
  }
  fun onNewLocation(locationArg: NavigationLocation, callback: (Result<Unit>) -> Unit)
{
    val separatedMessageChannelSuffix = if (messageChannelSuffix.isNotEmpty()) ".$messageChannelSuffix" else ""
    val channelName = "dev.flutter.pigeon.mapbox_maps_flutter.NavigationListener.onNewLocation$separatedMessageChannelSuffix"
    val channel = BasicMessageChannel<Any?>(binaryMessenger, channelName, codec)
    channel.send(listOf(locationArg)) {
      if (it is List<*>) {
        if (it.size > 1) {
          callback(Result.failure(FlutterError(it[0] as String, it[1] as String, it[2] as String?)))
        } else {
          callback(Result.success(Unit))
        }
      } else {
        callback(Result.failure(createConnectionError(channelName)))
      } 
    }
  }
  fun onRouteProgress(routeProgressArg: RouteProgress, callback: (Result<Unit>) -> Unit)
{
    val separatedMessageChannelSuffix = if (messageChannelSuffix.isNotEmpty()) ".$messageChannelSuffix" else ""
    val channelName = "dev.flutter.pigeon.mapbox_maps_flutter.NavigationListener.onRouteProgress$separatedMessageChannelSuffix"
    val channel = BasicMessageChannel<Any?>(binaryMessenger, channelName, codec)
    channel.send(listOf(routeProgressArg)) {
      if (it is List<*>) {
        if (it.size > 1) {
          callback(Result.failure(FlutterError(it[0] as String, it[1] as String, it[2] as String?)))
        } else {
          callback(Result.success(Unit))
        }
      } else {
        callback(Result.failure(createConnectionError(channelName)))
      } 
    }
  }
  fun onNavigationCameraStateChanged(stateArg: NavigationCameraState, callback: (Result<Unit>) -> Unit)
{
    val separatedMessageChannelSuffix = if (messageChannelSuffix.isNotEmpty()) ".$messageChannelSuffix" else ""
    val channelName = "dev.flutter.pigeon.mapbox_maps_flutter.NavigationListener.onNavigationCameraStateChanged$separatedMessageChannelSuffix"
    val channel = BasicMessageChannel<Any?>(binaryMessenger, channelName, codec)
    channel.send(listOf(stateArg)) {
      if (it is List<*>) {
        if (it.size > 1) {
          callback(Result.failure(FlutterError(it[0] as String, it[1] as String, it[2] as String?)))
        } else {
          callback(Result.success(Unit))
        }
      } else {
        callback(Result.failure(createConnectionError(channelName)))
      } 
    }
  }
}
/** Generated interface from Pigeon that represents a handler of messages from Flutter. */
interface NavigationInterface {
  fun setRoute(waypoints: List<Point>, callback: (Result<Unit>) -> Unit)
  fun stopTripSession(callback: (Result<Unit>) -> Unit)
  fun startTripSession(withForegroundService: Boolean, callback: (Result<Unit>) -> Unit)
  fun requestNavigationCameraToFollowing(callback: (Result<Unit>) -> Unit)
  fun requestNavigationCameraToOverview(callback: (Result<Unit>) -> Unit)
  fun lastLocation(callback: (Result<NavigationLocation?>) -> Unit)

  companion object {
    /** The codec used by NavigationInterface. */
    val codec: MessageCodec<Any?> by lazy {
      NavigationMessagerPigeonCodec()
    }
    /** Sets up an instance of `NavigationInterface` to handle messages through the `binaryMessenger`. */
    @JvmOverloads
    fun setUp(binaryMessenger: BinaryMessenger, api: NavigationInterface?, messageChannelSuffix: String = "") {
      val separatedMessageChannelSuffix = if (messageChannelSuffix.isNotEmpty()) ".$messageChannelSuffix" else ""
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.mapbox_maps_flutter.NavigationInterface.setRoute$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val waypointsArg = args[0] as List<Point>
            api.setRoute(waypointsArg) { result: Result<Unit> ->
              val error = result.exceptionOrNull()
              if (error != null) {
                reply.reply(wrapError(error))
              } else {
                reply.reply(wrapResult(null))
              }
            }
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.mapbox_maps_flutter.NavigationInterface.stopTripSession$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { _, reply ->
            api.stopTripSession{ result: Result<Unit> ->
              val error = result.exceptionOrNull()
              if (error != null) {
                reply.reply(wrapError(error))
              } else {
                reply.reply(wrapResult(null))
              }
            }
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.mapbox_maps_flutter.NavigationInterface.startTripSession$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val withForegroundServiceArg = args[0] as Boolean
            api.startTripSession(withForegroundServiceArg) { result: Result<Unit> ->
              val error = result.exceptionOrNull()
              if (error != null) {
                reply.reply(wrapError(error))
              } else {
                reply.reply(wrapResult(null))
              }
            }
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.mapbox_maps_flutter.NavigationInterface.requestNavigationCameraToFollowing$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { _, reply ->
            api.requestNavigationCameraToFollowing{ result: Result<Unit> ->
              val error = result.exceptionOrNull()
              if (error != null) {
                reply.reply(wrapError(error))
              } else {
                reply.reply(wrapResult(null))
              }
            }
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.mapbox_maps_flutter.NavigationInterface.requestNavigationCameraToOverview$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { _, reply ->
            api.requestNavigationCameraToOverview{ result: Result<Unit> ->
              val error = result.exceptionOrNull()
              if (error != null) {
                reply.reply(wrapError(error))
              } else {
                reply.reply(wrapResult(null))
              }
            }
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.mapbox_maps_flutter.NavigationInterface.lastLocation$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { _, reply ->
            api.lastLocation{ result: Result<NavigationLocation?> ->
              val error = result.exceptionOrNull()
              if (error != null) {
                reply.reply(wrapError(error))
              } else {
                val data = result.getOrNull()
                reply.reply(wrapResult(data))
              }
            }
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
    }
  }
}