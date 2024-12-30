import Combine
import CoreLocation
import MapboxDirections
import MapboxNavigationCore

@MainActor
final class NavigationController: ObservableObject, NavigationInterface {
    let predictiveCacheManager: PredictiveCacheManager?

    @Published private(set) var isInActiveNavigation: Bool = false
    @Published private(set) var currentPreviewRoutes: NavigationRoutes?
    @Published private(set) var activeNavigationRoutes: NavigationRoutes?
    @Published private(set) var routeProgress: RouteProgress?
    @Published private(set) var currentLocation: CLLocation?
    @Published var cameraState: NavigationCameraState = .idle
    @Published var profileIdentifier: ProfileIdentifier = .automobileAvoidingTraffic
    @Published var shouldRequestMapMatching = false

    private var waypoints: [Waypoint] = []
    private let core: MapboxNavigation

    private var cancelables: Set<AnyCancelable> = []
    private var onNavigationListener: NavigationListener?    
    private let mapView: MapView

    init(withMapView mapView: MapView) {
        self.mapView = mapView

        let config = CoreConfig(
            credentials: .init(), // You can pass a custom token if you need to,
            locationSource: .live
        )
        let navigationProvider = MapboxNavigationProvider(coreConfig: config)
        self.core = navigationProvider.mapboxNavigation
        self.predictiveCacheManager = navigationProvider.predictiveCacheManager
        self.observeNavigation()
    }

    private func observeNavigation() {
        core.tripSession().session
            .map {
                if case .activeGuidance = $0.state { return true }
                return false
            }
            .removeDuplicates()
            .assign(to: &$isInActiveNavigation)

        core.navigation().routeProgress
            .map { $0?.routeProgress }
            .assign(to: &$routeProgress)

        core.tripSession().navigationRoutes
            .assign(to: &$activeNavigationRoutes)

        core.navigation().locationMatching
            .map { $0.enhancedLocation }
            .assign(to: &$currentLocation)
    }

    func startFreeDrive() {
        core.tripSession().startFreeDrive()
    }

    func cancelPreview() {
        waypoints = []
        currentPreviewRoutes = nil
        cameraState = .following
    }

    func startActiveNavigation() {
        guard let previewRoutes = currentPreviewRoutes else { return }
        core.tripSession().startActiveGuidance(with: previewRoutes, startLegIndex: 0)
        cameraState = .following
        currentPreviewRoutes = nil
        waypoints = []
    }

    func stopActiveNavigation() {
        core.tripSession().startFreeDrive()
        cameraState = .following
    }

    func requestRoutes(points: [Point]) async throws {

        waypoints.append(Waypoint(coordinate: mapPoint.coordinate, name: mapPoint.name))

        let provider = core.routingProvider()
        if shouldRequestMapMatching {
            let mapMatchingOptions = NavigationMatchOptions(
                waypoints: optionsWaypoints,
                profileIdentifier: profileIdentifier
            )
            let previewRoutes = try await provider.calculateRoutes(options: mapMatchingOptions).value
            currentPreviewRoutes = previewRoutes
        } else {
            let routeOptions = NavigationRouteOptions(
                waypoints: optionsWaypoints,
                profileIdentifier: profileIdentifier
            )
            let previewRoutes = try await provider.calculateRoutes(options: routeOptions).value
            currentPreviewRoutes = previewRoutes
        }
        cameraState = .idle
    }

    func addListeners(messenger: SuffixBinaryMessenger) {
        removeListeners()
        onNavigationListener = NavigationListener(binaryMessenger: messenger.messenger, messageChannelSuffix: messenger.suffix)        
    }

    func removeListeners() {
        cancelables = []
    }

    func setRoute(waypoints: [Point], completion: @escaping (Result<Void, Error>) -> Void) {
        self.requestRoutes(waypoints)
    }

    func stopTripSession(completion: @escaping (Result<Void, Error>) -> Void) {
        core.tripSession()
    }

    func startTripSession(withForegroundService: Bool, completion: @escaping (Result<Void, Error>) -> Void) {

    }

    func requestNavigationCameraToFollowing(completion: @escaping (Result<Void, Error>) -> Void) {

    }

    func requestNavigationCameraToOverview(completion: @escaping (Result<Void, Error>) -> Void) {

    }

    func lastLocation(completion: @escaping (Result<NavigationLocation?, Error>) -> Void) {

    }
}
