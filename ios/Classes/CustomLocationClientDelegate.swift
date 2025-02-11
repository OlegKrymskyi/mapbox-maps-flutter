import Combine
import CoreLocation
import MapboxNavigationCore

final class CustomLocationClient
{
    private let delegate = CustomLocationClientDelegate()
    
    func sendCurrentLocation() {
        delegate.sendCurrentLocation()
    }
    
    func sendCurrentHeading() {
        delegate.sendCurrentHeading()
    }
    
    func startUpdatingLocation() {
        delegate.startUpdatingLocation()
    }
    
    func stopUpdatingLocation() {
        delegate.stopUpdatingLocation()
    }

    func startUpdatingHeading() {
        delegate.startUpdatingHeading()
    }

    func stopUpdatingHeading() {
        delegate.stopUpdatingHeading()
    }
    
    public func getClient() -> LocationClient {
        return LocationClient(
            locations: delegate.locations,
            headings: delegate.headings,
            startUpdatingLocation: { self.delegate.startUpdatingLocation() },
            stopUpdatingLocation: { self.delegate.stopUpdatingLocation() },
            startUpdatingHeading: { self.delegate.startUpdatingHeading() },
            stopUpdatingHeading: { self.delegate.stopUpdatingHeading() }
        )
    }
}

final class CustomLocationClientDelegate: NSObject, CLLocationManagerDelegate {

    private let manager = CLLocationManager()
    private let locationsSubject = PassthroughSubject<CLLocation, Never>()
    private let headingSubject = PassthroughSubject<CLHeading, Never>()

    var locations: AnyPublisher<CLLocation, Never> {
        locationsSubject.eraseToAnyPublisher()
    }

    var headings: AnyPublisher<CLHeading, Never> {
        headingSubject.eraseToAnyPublisher()
    }

    override init() {
        super.init()
        assert(Thread.isMainThread) // CLLocationManager has to be created on the main thread
        manager.requestWhenInUseAuthorization()

        if Bundle.main.backgroundModes.contains("location") {
            manager.allowsBackgroundLocationUpdates = true
        }
        manager.delegate = self
        
        manager.startUpdatingLocation()
    }

    func startUpdatingLocation() {
        manager.startUpdatingLocation()
    }

    func stopUpdatingLocation() {
        manager.stopUpdatingLocation()
    }

    func startUpdatingHeading() {
        manager.startUpdatingHeading()
    }

    func stopUpdatingHeading() {
        manager.stopUpdatingHeading()
    }
    
    func sendCurrentLocation() {
        if(manager.location != nil){
            locationsSubject.send(manager.location!)
        }
    }
    
    func sendCurrentHeading() {
        if(manager.heading != nil){
            headingSubject.send(manager.heading!)
        }
    }

    nonisolated func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationsSubject.send(location)
        }
    }

    nonisolated func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        headingSubject.send(newHeading)
    }
}
