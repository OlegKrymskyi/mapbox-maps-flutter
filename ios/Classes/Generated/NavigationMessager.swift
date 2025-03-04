// Autogenerated from Pigeon (v22.6.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon

import Foundation
import Turf

#if os(iOS)
  import Flutter
#elseif os(macOS)
  import FlutterMacOS
#else
  #error("Unsupported platform.")
#endif

/// Error class for passing custom error details to Dart side.
final class NavigationMessagerError: Error {
  let code: String
  let message: String?
  let details: Any?

  init(code: String, message: String?, details: Any?) {
    self.code = code
    self.message = message
    self.details = details
  }

  var localizedDescription: String {
    return
      "NavigationMessagerError(code: \(code), message: \(message ?? "<nil>"), details: \(details ?? "<nil>")"
      }
}

private func wrapResult(_ result: Any?) -> [Any?] {
  return [result]
}

private func wrapError(_ error: Any) -> [Any?] {
  if let pigeonError = error as? NavigationMessagerError {
    return [
      pigeonError.code,
      pigeonError.message,
      pigeonError.details,
    ]
  }
  if let flutterError = error as? FlutterError {
    return [
      flutterError.code,
      flutterError.message,
      flutterError.details,
    ]
  }
  return [
    "\(error)",
    "\(type(of: error))",
    "Stacktrace: \(Thread.callStackSymbols)",
  ]
}

private func createConnectionError(withChannelName channelName: String) -> NavigationMessagerError {
  return NavigationMessagerError(code: "channel-error", message: "Unable to establish connection on channel: '\(channelName)'.", details: "")
}

private func isNullish(_ value: Any?) -> Bool {
  return value is NSNull || value == nil
}

private func nilOrValue<T>(_ value: Any?) -> T? {
  if value is NSNull { return nil }
  return value as! T?
}

enum RouteProgressState: Int {
  case iNITIALIZED = 0
  case tRACKING = 1
  case cOMPLETE = 2
  case oFFROUTE = 3
  case uNCERTAIN = 4
}

enum RoadObjectLocationType: Int {
  case gANTRY = 0
  case oPENLRLINE = 1
  case oPENLRPOINT = 2
  case pOINT = 3
  case pOLYGON = 4
  case pOLYLINE = 5
  case rOUTEALERT = 6
  case sUBGRAPH = 7
}

enum NavigationCameraState: Int {
  case iDLE = 0
  case tRANSITIONTOFOLLOWING = 1
  case fOLLOWING = 2
  case tRANSITIONTOOVERVIEW = 3
  case oVERVIEW = 4
}

/// Generated class from Pigeon that represents data sent in messages.
struct NavigationLocation {
  var latitude: Double? = nil
  var longitude: Double? = nil
  var timestamp: Int64? = nil
  var monotonicTimestamp: Int64? = nil
  var altitude: Double? = nil
  var horizontalAccuracy: Double? = nil
  var verticalAccuracy: Double? = nil
  var speed: Double? = nil
  var speedAccuracy: Double? = nil
  var bearing: Double? = nil
  var bearingAccuracy: Double? = nil
  var floor: Int64? = nil
  var source: String? = nil



  // swift-format-ignore: AlwaysUseLowerCamelCase
  static func fromList(_ pigeonVar_list: [Any?]) -> NavigationLocation? {
    let latitude: Double? = nilOrValue(pigeonVar_list[0])
    let longitude: Double? = nilOrValue(pigeonVar_list[1])
    let timestamp: Int64? = nilOrValue(pigeonVar_list[2])
    let monotonicTimestamp: Int64? = nilOrValue(pigeonVar_list[3])
    let altitude: Double? = nilOrValue(pigeonVar_list[4])
    let horizontalAccuracy: Double? = nilOrValue(pigeonVar_list[5])
    let verticalAccuracy: Double? = nilOrValue(pigeonVar_list[6])
    let speed: Double? = nilOrValue(pigeonVar_list[7])
    let speedAccuracy: Double? = nilOrValue(pigeonVar_list[8])
    let bearing: Double? = nilOrValue(pigeonVar_list[9])
    let bearingAccuracy: Double? = nilOrValue(pigeonVar_list[10])
    let floor: Int64? = nilOrValue(pigeonVar_list[11])
    let source: String? = nilOrValue(pigeonVar_list[12])

    return NavigationLocation(
      latitude: latitude,
      longitude: longitude,
      timestamp: timestamp,
      monotonicTimestamp: monotonicTimestamp,
      altitude: altitude,
      horizontalAccuracy: horizontalAccuracy,
      verticalAccuracy: verticalAccuracy,
      speed: speed,
      speedAccuracy: speedAccuracy,
      bearing: bearing,
      bearingAccuracy: bearingAccuracy,
      floor: floor,
      source: source
    )
  }
  func toList() -> [Any?] {
    return [
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
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct RoadObject {
  var id: String? = nil
  var objectType: RoadObjectLocationType? = nil
  var length: Double? = nil
  var provider: String? = nil
  var isUrban: Bool? = nil



  // swift-format-ignore: AlwaysUseLowerCamelCase
  static func fromList(_ pigeonVar_list: [Any?]) -> RoadObject? {
    let id: String? = nilOrValue(pigeonVar_list[0])
    let objectType: RoadObjectLocationType? = nilOrValue(pigeonVar_list[1])
    let length: Double? = nilOrValue(pigeonVar_list[2])
    let provider: String? = nilOrValue(pigeonVar_list[3])
    let isUrban: Bool? = nilOrValue(pigeonVar_list[4])

    return RoadObject(
      id: id,
      objectType: objectType,
      length: length,
      provider: provider,
      isUrban: isUrban
    )
  }
  func toList() -> [Any?] {
    return [
      id,
      objectType,
      length,
      provider,
      isUrban,
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct RoadObjectDistanceInfo {
  var distanceToStart: Double? = nil



  // swift-format-ignore: AlwaysUseLowerCamelCase
  static func fromList(_ pigeonVar_list: [Any?]) -> RoadObjectDistanceInfo? {
    let distanceToStart: Double? = nilOrValue(pigeonVar_list[0])

    return RoadObjectDistanceInfo(
      distanceToStart: distanceToStart
    )
  }
  func toList() -> [Any?] {
    return [
      distanceToStart
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct UpcomingRoadObject {
  var roadObject: RoadObject? = nil
  var distanceToStart: Double? = nil
  var distanceInfo: RoadObjectDistanceInfo? = nil



  // swift-format-ignore: AlwaysUseLowerCamelCase
  static func fromList(_ pigeonVar_list: [Any?]) -> UpcomingRoadObject? {
    let roadObject: RoadObject? = nilOrValue(pigeonVar_list[0])
    let distanceToStart: Double? = nilOrValue(pigeonVar_list[1])
    let distanceInfo: RoadObjectDistanceInfo? = nilOrValue(pigeonVar_list[2])

    return UpcomingRoadObject(
      roadObject: roadObject,
      distanceToStart: distanceToStart,
      distanceInfo: distanceInfo
    )
  }
  func toList() -> [Any?] {
    return [
      roadObject,
      distanceToStart,
      distanceInfo,
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct RouteProgress {
  var navigationRouteJson: String? = nil
  var bannerInstructionsJson: String? = nil
  var voiceInstructionsJson: String? = nil
  var currentState: RouteProgressState? = nil
  var inTunnel: Bool? = nil
  var distanceRemaining: Double? = nil
  var distanceTraveled: Double? = nil
  var durationRemaining: Double? = nil
  var fractionTraveled: Double? = nil
  var remainingWaypoints: Int64? = nil
  var upcomingRoadObjects: [UpcomingRoadObject]? = nil
  var stale: Bool? = nil
  var routeAlternativeId: String? = nil
  var currentRouteGeometryIndex: Int64? = nil
  var inParkingAisle: Bool? = nil



  // swift-format-ignore: AlwaysUseLowerCamelCase
  static func fromList(_ pigeonVar_list: [Any?]) -> RouteProgress? {
    let navigationRouteJson: String? = nilOrValue(pigeonVar_list[0])
    let bannerInstructionsJson: String? = nilOrValue(pigeonVar_list[1])
    let voiceInstructionsJson: String? = nilOrValue(pigeonVar_list[2])
    let currentState: RouteProgressState? = nilOrValue(pigeonVar_list[3])
    let inTunnel: Bool? = nilOrValue(pigeonVar_list[4])
    let distanceRemaining: Double? = nilOrValue(pigeonVar_list[5])
    let distanceTraveled: Double? = nilOrValue(pigeonVar_list[6])
    let durationRemaining: Double? = nilOrValue(pigeonVar_list[7])
    let fractionTraveled: Double? = nilOrValue(pigeonVar_list[8])
    let remainingWaypoints: Int64? = nilOrValue(pigeonVar_list[9])
    let upcomingRoadObjects: [UpcomingRoadObject]? = nilOrValue(pigeonVar_list[10])
    let stale: Bool? = nilOrValue(pigeonVar_list[11])
    let routeAlternativeId: String? = nilOrValue(pigeonVar_list[12])
    let currentRouteGeometryIndex: Int64? = nilOrValue(pigeonVar_list[13])
    let inParkingAisle: Bool? = nilOrValue(pigeonVar_list[14])

    return RouteProgress(
      navigationRouteJson: navigationRouteJson,
      bannerInstructionsJson: bannerInstructionsJson,
      voiceInstructionsJson: voiceInstructionsJson,
      currentState: currentState,
      inTunnel: inTunnel,
      distanceRemaining: distanceRemaining,
      distanceTraveled: distanceTraveled,
      durationRemaining: durationRemaining,
      fractionTraveled: fractionTraveled,
      remainingWaypoints: remainingWaypoints,
      upcomingRoadObjects: upcomingRoadObjects,
      stale: stale,
      routeAlternativeId: routeAlternativeId,
      currentRouteGeometryIndex: currentRouteGeometryIndex,
      inParkingAisle: inParkingAisle
    )
  }
  func toList() -> [Any?] {
    return [
      navigationRouteJson,
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
    ]
  }
}

struct Waypoint {
  var point: Point? = nil
  var name: String? = nil
    // swift-format-ignore: AlwaysUseLowerCamelCase
  static func fromList(_ pigeonVar_list: [Any?]) -> Waypoint? {
    let point: Point? = nilOrValue(pigeonVar_list[0])
    let name: String? = nilOrValue(pigeonVar_list[1])
    
    return Waypoint(
      point: point,
      name: name
    )
  }
  func toList() -> [Any?] {
    return [
      point,
      name
    ]
  }
}

struct RouteOptions {
    var waypoints: [Waypoint]? = nil
    var steps: Bool? = nil
    var alternatives: Bool? = nil
    var coordinates: [Point]? = nil
    var voiceInstructions: Bool? = nil
    
    // swift-format-ignore: AlwaysUseLowerCamelCase
    static func fromList(_ pigeonVar_list: [Any?]) -> RouteOptions? {
    let waypoints: [Waypoint]? = nilOrValue(pigeonVar_list[0])
    let steps: Bool? = nilOrValue(pigeonVar_list[1])
    let alternatives: Bool? = nilOrValue(pigeonVar_list[2])
        let coordinates: [Point]? = nilOrValue(pigeonVar_list[3])
    let voiceInstructions: Bool? = nilOrValue(pigeonVar_list[4])
    
    return RouteOptions(
        waypoints: waypoints,
        steps: steps,
        alternatives:alternatives,
        coordinates:coordinates,
        voiceInstructions:voiceInstructions
    )
  }
  func toList() -> [Any?] {
    return [
        waypoints,
        steps,
        alternatives,
        coordinates,
        voiceInstructions
    ]
  }
}


private class NavigationMessagerPigeonCodecReader: FlutterStandardReader {
  override func readValue(ofType type: UInt8) -> Any? {
    switch type {
      case 151:
        return Point.fromList(self.readValue() as! [Any?])
      case 152:
        return Feature.fromList(self.readValue() as! [Any?])
      case 191:
        return NavigationLocation.fromList(self.readValue() as! [Any?])      
      case 192:
        let enumResultAsInt: Int? = nilOrValue(self.readValue() as! Int?)
        if let enumResultAsInt = enumResultAsInt {
          return RouteProgressState(rawValue: enumResultAsInt)
        }
        return nil
      case 193:
        let enumResultAsInt: Int? = nilOrValue(self.readValue() as! Int?)
        if let enumResultAsInt = enumResultAsInt {
          return RoadObjectLocationType(rawValue: enumResultAsInt)
        }
        return nil
      case 194:
        return RoadObject.fromList(self.readValue() as! [Any?])
      case 195:
        return RoadObjectDistanceInfo.fromList(self.readValue() as! [Any?])
      case 196:
        return UpcomingRoadObject.fromList(self.readValue() as! [Any?])
      case 197:
        return RouteProgress.fromList(self.readValue() as! [Any?])
      case 198:
        let enumResultAsInt: Int? = nilOrValue(self.readValue() as! Int?)
        if let enumResultAsInt = enumResultAsInt {
          return NavigationCameraState(rawValue: enumResultAsInt)
        }
        return nil
      case 199:
        return Waypoint.fromList(self.readValue() as! [Any?])
      case 200:
        return RouteOptions.fromList(self.readValue() as! [Any?])
      default:
        return super.readValue(ofType: type)
    }
  }
}

private class NavigationMessagerPigeonCodecWriter: FlutterStandardWriter {
  override func writeValue(_ value: Any) {
    if let value = value as? Point {
      super.writeByte(151)
      super.writeValue(value.toList())
    } else if let value = value as? Feature {
      super.writeByte(152)
      super.writeValue(value.toList())
    } else if let value = value as? NavigationLocation {
      super.writeByte(191)
      super.writeValue(value.toList())
    } else if let value = value as? RouteProgressState {
      super.writeByte(192)
      super.writeValue(value.rawValue)
    } else if let value = value as? RoadObjectLocationType {
      super.writeByte(193)
      super.writeValue(value.rawValue)
    } else if let value = value as? RoadObject {
      super.writeByte(194)
      super.writeValue(value.toList())
    } else if let value = value as? RoadObjectDistanceInfo {
      super.writeByte(195)
      super.writeValue(value.toList())
    } else if let value = value as? UpcomingRoadObject {
      super.writeByte(196)
      super.writeValue(value.toList())
    } else if let value = value as? RouteProgress {
      super.writeByte(197)
      super.writeValue(value.toList())
    } else if let value = value as? NavigationCameraState {
      super.writeByte(198)
      super.writeValue(value.rawValue)
    } else if let value = value as? Waypoint {
      super.writeByte(199)
      super.writeValue(value.toList())
    } else if let value = value as? RouteOptions {
      super.writeByte(200)
      super.writeValue(value.toList())
    } else {
      super.writeValue(value)
    }
  }
}

private class NavigationMessagerPigeonCodecReaderWriter: FlutterStandardReaderWriter {
  override func reader(with data: Data) -> FlutterStandardReader {
    return NavigationMessagerPigeonCodecReader(data: data)
  }

  override func writer(with data: NSMutableData) -> FlutterStandardWriter {
    return NavigationMessagerPigeonCodecWriter(data: data)
  }
}

class NavigationMessagerPigeonCodec: FlutterStandardMessageCodec, @unchecked Sendable {
  static let shared = NavigationMessagerPigeonCodec(readerWriter: NavigationMessagerPigeonCodecReaderWriter())
}


/// Generated protocol from Pigeon that represents Flutter messages that can be called from Swift.
protocol NavigationListenerProtocol {
  func onNavigationRouteReady(completion: @escaping (Result<Void, NavigationMessagerError>) -> Void)
  func onNavigationRouteFailed(completion: @escaping (Result<Void, NavigationMessagerError>) -> Void)
  func onNavigationRouteCancelled(completion: @escaping (Result<Void, NavigationMessagerError>) -> Void)
  func onNavigationRouteRendered(completion: @escaping (Result<Void, NavigationMessagerError>) -> Void)
  func onNewLocation(location locationArg: NavigationLocation, completion: @escaping (Result<Void, NavigationMessagerError>) -> Void)
  func onRouteProgress(routeProgress routeProgressArg: RouteProgress, completion: @escaping (Result<Void, NavigationMessagerError>) -> Void)
  func onNavigationCameraStateChanged(state stateArg: NavigationCameraState, completion: @escaping (Result<Void, NavigationMessagerError>) -> Void)
}
class NavigationListener: NavigationListenerProtocol {
  private let binaryMessenger: FlutterBinaryMessenger
  private let messageChannelSuffix: String
  init(binaryMessenger: FlutterBinaryMessenger, messageChannelSuffix: String = "") {
    self.binaryMessenger = binaryMessenger
    self.messageChannelSuffix = messageChannelSuffix.count > 0 ? ".\(messageChannelSuffix)" : ""
  }
  var codec: NavigationMessagerPigeonCodec {
    return NavigationMessagerPigeonCodec.shared
  }
  func onNavigationRouteReady(completion: @escaping (Result<Void, NavigationMessagerError>) -> Void) {
    let channelName: String = "dev.flutter.pigeon.mapbox_maps_flutter.NavigationListener.onNavigationRouteReady\(messageChannelSuffix)"
    let channel = FlutterBasicMessageChannel(name: channelName, binaryMessenger: binaryMessenger, codec: codec)
    channel.sendMessage(nil) { response in
      guard let listResponse = response as? [Any?] else {
        completion(.failure(createConnectionError(withChannelName: channelName)))
        return
      }
      if listResponse.count > 1 {
        let code: String = listResponse[0] as! String
        let message: String? = nilOrValue(listResponse[1])
        let details: String? = nilOrValue(listResponse[2])
        completion(.failure(NavigationMessagerError(code: code, message: message, details: details)))
      } else {
        completion(.success(Void()))
      }
    }
  }
  func onNavigationRouteFailed(completion: @escaping (Result<Void, NavigationMessagerError>) -> Void) {
    let channelName: String = "dev.flutter.pigeon.mapbox_maps_flutter.NavigationListener.onNavigationRouteFailed\(messageChannelSuffix)"
    let channel = FlutterBasicMessageChannel(name: channelName, binaryMessenger: binaryMessenger, codec: codec)
    channel.sendMessage(nil) { response in
      guard let listResponse = response as? [Any?] else {
        completion(.failure(createConnectionError(withChannelName: channelName)))
        return
      }
      if listResponse.count > 1 {
        let code: String = listResponse[0] as! String
        let message: String? = nilOrValue(listResponse[1])
        let details: String? = nilOrValue(listResponse[2])
        completion(.failure(NavigationMessagerError(code: code, message: message, details: details)))
      } else {
        completion(.success(Void()))
      }
    }
  }
  func onNavigationRouteCancelled(completion: @escaping (Result<Void, NavigationMessagerError>) -> Void) {
    let channelName: String = "dev.flutter.pigeon.mapbox_maps_flutter.NavigationListener.onNavigationRouteCancelled\(messageChannelSuffix)"
    let channel = FlutterBasicMessageChannel(name: channelName, binaryMessenger: binaryMessenger, codec: codec)
    channel.sendMessage(nil) { response in
      guard let listResponse = response as? [Any?] else {
        completion(.failure(createConnectionError(withChannelName: channelName)))
        return
      }
      if listResponse.count > 1 {
        let code: String = listResponse[0] as! String
        let message: String? = nilOrValue(listResponse[1])
        let details: String? = nilOrValue(listResponse[2])
        completion(.failure(NavigationMessagerError(code: code, message: message, details: details)))
      } else {
        completion(.success(Void()))
      }
    }
  }
  func onNavigationRouteRendered(completion: @escaping (Result<Void, NavigationMessagerError>) -> Void) {
    let channelName: String = "dev.flutter.pigeon.mapbox_maps_flutter.NavigationListener.onNavigationRouteRendered\(messageChannelSuffix)"
    let channel = FlutterBasicMessageChannel(name: channelName, binaryMessenger: binaryMessenger, codec: codec)
    channel.sendMessage(nil) { response in
      guard let listResponse = response as? [Any?] else {
        completion(.failure(createConnectionError(withChannelName: channelName)))
        return
      }
      if listResponse.count > 1 {
        let code: String = listResponse[0] as! String
        let message: String? = nilOrValue(listResponse[1])
        let details: String? = nilOrValue(listResponse[2])
        completion(.failure(NavigationMessagerError(code: code, message: message, details: details)))
      } else {
        completion(.success(Void()))
      }
    }
  }
  func onNewLocation(location locationArg: NavigationLocation, completion: @escaping (Result<Void, NavigationMessagerError>) -> Void) {
    let channelName: String = "dev.flutter.pigeon.mapbox_maps_flutter.NavigationListener.onNewLocation\(messageChannelSuffix)"
    let channel = FlutterBasicMessageChannel(name: channelName, binaryMessenger: binaryMessenger, codec: codec)
    channel.sendMessage([locationArg] as [Any?]) { response in
      guard let listResponse = response as? [Any?] else {
        completion(.failure(createConnectionError(withChannelName: channelName)))
        return
      }
      if listResponse.count > 1 {
        let code: String = listResponse[0] as! String
        let message: String? = nilOrValue(listResponse[1])
        let details: String? = nilOrValue(listResponse[2])
        completion(.failure(NavigationMessagerError(code: code, message: message, details: details)))
      } else {
        completion(.success(Void()))
      }
    }
  }
  func onRouteProgress(routeProgress routeProgressArg: RouteProgress, completion: @escaping (Result<Void, NavigationMessagerError>) -> Void) {
    let channelName: String = "dev.flutter.pigeon.mapbox_maps_flutter.NavigationListener.onRouteProgress\(messageChannelSuffix)"
    let channel = FlutterBasicMessageChannel(name: channelName, binaryMessenger: binaryMessenger, codec: codec)
    channel.sendMessage([routeProgressArg] as [Any?]) { response in
      guard let listResponse = response as? [Any?] else {
        completion(.failure(createConnectionError(withChannelName: channelName)))
        return
      }
      if listResponse.count > 1 {
        let code: String = listResponse[0] as! String
        let message: String? = nilOrValue(listResponse[1])
        let details: String? = nilOrValue(listResponse[2])
        completion(.failure(NavigationMessagerError(code: code, message: message, details: details)))
      } else {
        completion(.success(Void()))
      }
    }
  }
  func onNavigationCameraStateChanged(state stateArg: NavigationCameraState, completion: @escaping (Result<Void, NavigationMessagerError>) -> Void) {
    let channelName: String = "dev.flutter.pigeon.mapbox_maps_flutter.NavigationListener.onNavigationCameraStateChanged\(messageChannelSuffix)"
    let channel = FlutterBasicMessageChannel(name: channelName, binaryMessenger: binaryMessenger, codec: codec)
    channel.sendMessage([stateArg] as [Any?]) { response in
      guard let listResponse = response as? [Any?] else {
        completion(.failure(createConnectionError(withChannelName: channelName)))
        return
      }
      if listResponse.count > 1 {
        let code: String = listResponse[0] as! String
        let message: String? = nilOrValue(listResponse[1])
        let details: String? = nilOrValue(listResponse[2])
        completion(.failure(NavigationMessagerError(code: code, message: message, details: details)))
      } else {
        completion(.success(Void()))
      }
    }
  }
}
/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol NavigationInterface {
  func setRoute(options: RouteOptions, completion: @escaping (Result<Void, Error>) -> Void)
  func stopTripSession(completion: @escaping (Result<Void, Error>) -> Void)
  func startTripSession(withForegroundService: Bool, completion: @escaping (Result<Void, Error>) -> Void)
  func requestNavigationCameraToFollowing(completion: @escaping (Result<Void, Error>) -> Void)
  func requestNavigationCameraToOverview(completion: @escaping (Result<Void, Error>) -> Void)
  func lastLocation(completion: @escaping (Result<NavigationLocation?, Error>) -> Void)
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class NavigationInterfaceSetup {
  static var codec: FlutterStandardMessageCodec { NavigationMessagerPigeonCodec.shared }
  /// Sets up an instance of `NavigationInterface` to handle messages through the `binaryMessenger`.
  static func setUp(binaryMessenger: FlutterBinaryMessenger, api: NavigationInterface?, messageChannelSuffix: String = "") {
    let channelSuffix = messageChannelSuffix.count > 0 ? ".\(messageChannelSuffix)" : ""
    let setRouteChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.mapbox_maps_flutter.NavigationInterface.setRoute\(channelSuffix)", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      setRouteChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let routeOptionsArg = args[0] as! RouteOptions
        api.setRoute(options: routeOptionsArg) { result in
          switch result {
          case .success:
            reply(wrapResult(nil))
          case .failure(let error):
            reply(wrapError(error))
          }
        }
      }
    } else {
      setRouteChannel.setMessageHandler(nil)
    }
    let stopTripSessionChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.mapbox_maps_flutter.NavigationInterface.stopTripSession\(channelSuffix)", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      stopTripSessionChannel.setMessageHandler { _, reply in
        api.stopTripSession { result in
          switch result {
          case .success:
            reply(wrapResult(nil))
          case .failure(let error):
            reply(wrapError(error))
          }
        }
      }
    } else {
      stopTripSessionChannel.setMessageHandler(nil)
    }
    let startTripSessionChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.mapbox_maps_flutter.NavigationInterface.startTripSession\(channelSuffix)", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      startTripSessionChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let withForegroundServiceArg = args[0] as! Bool
        api.startTripSession(withForegroundService: withForegroundServiceArg) { result in
          switch result {
          case .success:
            reply(wrapResult(nil))
          case .failure(let error):
            reply(wrapError(error))
          }
        }
      }
    } else {
      startTripSessionChannel.setMessageHandler(nil)
    }
    let requestNavigationCameraToFollowingChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.mapbox_maps_flutter.NavigationInterface.requestNavigationCameraToFollowing\(channelSuffix)", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      requestNavigationCameraToFollowingChannel.setMessageHandler { _, reply in
        api.requestNavigationCameraToFollowing { result in
          switch result {
          case .success:
            reply(wrapResult(nil))
          case .failure(let error):
            reply(wrapError(error))
          }
        }
      }
    } else {
      requestNavigationCameraToFollowingChannel.setMessageHandler(nil)
    }
    let requestNavigationCameraToOverviewChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.mapbox_maps_flutter.NavigationInterface.requestNavigationCameraToOverview\(channelSuffix)", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      requestNavigationCameraToOverviewChannel.setMessageHandler { _, reply in
        api.requestNavigationCameraToOverview { result in
          switch result {
          case .success:
            reply(wrapResult(nil))
          case .failure(let error):
            reply(wrapError(error))
          }
        }
      }
    } else {
      requestNavigationCameraToOverviewChannel.setMessageHandler(nil)
    }
    let lastLocationChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.mapbox_maps_flutter.NavigationInterface.lastLocation\(channelSuffix)", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      lastLocationChannel.setMessageHandler { _, reply in
        api.lastLocation { result in
          switch result {
          case .success(let res):
            reply(wrapResult(res))
          case .failure(let error):
            reply(wrapError(error))
          }
        }
      }
    } else {
      lastLocationChannel.setMessageHandler(nil)
    }
  }
}
