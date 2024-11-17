// Autogenerated from Pigeon (v22.6.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import, no_leading_underscores_for_local_identifiers
part of mapbox_maps_flutter;

enum NavigationCameraState {
  IDLE,
  TRANSITION_TO_FOLLOWING,
  FOLLOWING,
  TRANSITION_TO_OVERVIEW,
  OVERVIEW,
}

enum RouteProgressState {
  INITIALIZED,
  TRACKING,
  COMPLETE,
  OFF_ROUTE,
  UNCERTAIN,
}

enum RoadObjectLocationType {
  GANTRY,
  OPEN_LR_LINE,
  OPEN_LR_POINT,
  POINT,
  POLYGON,
  POLYLINE,
  ROUTE_ALERT,
  SUBGRAPH,
}

class RoadObject {
  RoadObject({
    this.id,
    this.objectType,
    this.length,
    this.provider,
    this.isUrban,
  });

  String? id;

  RoadObjectLocationType? objectType;

  double? length;

  String? provider;

  bool? isUrban;

  Object encode() {
    return <Object?>[
      id,
      objectType,
      length,
      provider,
      isUrban,
    ];
  }

  static RoadObject decode(Object result) {
    result as List<Object?>;
    return RoadObject(
      id: result[0] as String?,
      objectType: result[1] as RoadObjectLocationType?,
      length: result[2] as double?,
      provider: result[3] as String?,
      isUrban: result[4] as bool?,
    );
  }
}

class RoadObjectDistanceInfo {
  RoadObjectDistanceInfo({
    this.distanceToStart,
  });

  double? distanceToStart;

  Object encode() {
    return <Object?>[
      distanceToStart,
    ];
  }

  static RoadObjectDistanceInfo decode(Object result) {
    result as List<Object?>;
    return RoadObjectDistanceInfo(
      distanceToStart: result[0] as double?,
    );
  }
}

class UpcomingRoadObject {
  UpcomingRoadObject({
    this.roadObject,
    this.distanceToStart,
    this.distanceInfo,
  });

  RoadObject? roadObject;

  double? distanceToStart;

  RoadObjectDistanceInfo? distanceInfo;

  Object encode() {
    return <Object?>[
      roadObject,
      distanceToStart,
      distanceInfo,
    ];
  }

  static UpcomingRoadObject decode(Object result) {
    result as List<Object?>;
    return UpcomingRoadObject(
      roadObject: result[0] as RoadObject?,
      distanceToStart: result[1] as double?,
      distanceInfo: result[2] as RoadObjectDistanceInfo?,
    );
  }
}

class RouteProgress {
  RouteProgress({
    this.bannerInstructionsJson,
    this.voiceInstructionsJson,
    this.currentState,
    this.inTunnel,
    this.distanceRemaining,
    this.distanceTraveled,
    this.durationRemaining,
    this.fractionTraveled,
    this.remainingWaypoints,
    this.upcomingRoadObjects,
    this.stale,
    this.routeAlternativeId,
    this.currentRouteGeometryIndex,
    this.inParkingAisle,
  });

  String? bannerInstructionsJson;

  String? voiceInstructionsJson;

  RouteProgressState? currentState;

  bool? inTunnel;

  double? distanceRemaining;

  double? distanceTraveled;

  double? durationRemaining;

  double? fractionTraveled;

  int? remainingWaypoints;

  List<UpcomingRoadObject>? upcomingRoadObjects;

  bool? stale;

  String? routeAlternativeId;

  int? currentRouteGeometryIndex;

  bool? inParkingAisle;

  Object encode() {
    return <Object?>[
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
    ];
  }

  static RouteProgress decode(Object result) {
    result as List<Object?>;
    return RouteProgress(
      bannerInstructionsJson: result[0] as String?,
      voiceInstructionsJson: result[1] as String?,
      currentState: result[2] as RouteProgressState?,
      inTunnel: result[3] as bool?,
      distanceRemaining: result[4] as double?,
      distanceTraveled: result[5] as double?,
      durationRemaining: result[6] as double?,
      fractionTraveled: result[7] as double?,
      remainingWaypoints: result[8] as int?,
      upcomingRoadObjects:
          (result[9] as List<Object?>?)?.cast<UpcomingRoadObject>(),
      stale: result[10] as bool?,
      routeAlternativeId: result[11] as String?,
      currentRouteGeometryIndex: result[12] as int?,
      inParkingAisle: result[13] as bool?,
    );
  }
}

class NavigationLocation {
  NavigationLocation({
    this.latitude,
    this.longitude,
    this.timestamp,
    this.monotonicTimestamp,
    this.altitude,
    this.horizontalAccuracy,
    this.verticalAccuracy,
    this.speed,
    this.speedAccuracy,
    this.bearing,
    this.bearingAccuracy,
    this.floor,
    this.source,
  });

  double? latitude;

  double? longitude;

  int? timestamp;

  int? monotonicTimestamp;

  double? altitude;

  double? horizontalAccuracy;

  double? verticalAccuracy;

  double? speed;

  double? speedAccuracy;

  double? bearing;

  double? bearingAccuracy;

  int? floor;

  String? source;

  Object encode() {
    return <Object?>[
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
    ];
  }

  static NavigationLocation decode(Object result) {
    result as List<Object?>;
    return NavigationLocation(
      latitude: result[0] as double?,
      longitude: result[1] as double?,
      timestamp: result[2] as int?,
      monotonicTimestamp: result[3] as int?,
      altitude: result[4] as double?,
      horizontalAccuracy: result[5] as double?,
      verticalAccuracy: result[6] as double?,
      speed: result[7] as double?,
      speedAccuracy: result[8] as double?,
      bearing: result[9] as double?,
      bearingAccuracy: result[10] as double?,
      floor: result[11] as int?,
      source: result[12] as String?,
    );
  }
}

class Navigation_PigeonCodec extends StandardMessageCodec {
  const Navigation_PigeonCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is int) {
      buffer.putUint8(4);
      buffer.putInt64(value);
    } else if (value is Point) {
      buffer.putUint8(151);
      writeValue(buffer, value.encode());
    } else if (value is Feature) {
      buffer.putUint8(152);
      writeValue(buffer, value.encode());
    } else if (value is NavigationLocation) {
      buffer.putUint8(191);
      writeValue(buffer, value.encode());
    } else if (value is RouteProgressState) {
      buffer.putUint8(192);
      writeValue(buffer, value.index);
    } else if (value is RoadObjectLocationType) {
      buffer.putUint8(193);
      writeValue(buffer, value.index);
    } else if (value is RoadObject) {
      buffer.putUint8(194);
      writeValue(buffer, value.encode());
    } else if (value is RoadObjectDistanceInfo) {
      buffer.putUint8(195);
      writeValue(buffer, value.encode());
    } else if (value is UpcomingRoadObject) {
      buffer.putUint8(196);
      writeValue(buffer, value.encode());
    } else if (value is RouteProgress) {
      buffer.putUint8(197);
      writeValue(buffer, value.encode());
    } else if (value is NavigationCameraState) {
      buffer.putUint8(198);
      writeValue(buffer, value.index);
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 151:
        return Point.decode(readValue(buffer)!);
      case 152:
        return Feature.decode(readValue(buffer)!);
      case 191:
        return NavigationLocation.decode(readValue(buffer)!);
      case 192:
        final int? value = readValue(buffer) as int?;
        return value == null ? null : RouteProgressState.values[value];
      case 193:
        final int? value = readValue(buffer) as int?;
        return value == null ? null : RoadObjectLocationType.values[value];
      case 194:
        return RoadObject.decode(readValue(buffer)!);
      case 195:
        return RoadObjectDistanceInfo.decode(readValue(buffer)!);
      case 196:
        return UpcomingRoadObject.decode(readValue(buffer)!);
      case 197:
        return RouteProgress.decode(readValue(buffer)!);
      case 198:
        final int? value = readValue(buffer) as int?;
        return value == null ? null : NavigationCameraState.values[value];
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

abstract class NavigationListener {
  static const MessageCodec<Object?> pigeonChannelCodec =
      Navigation_PigeonCodec();

  void onNavigationRouteReady();

  void onNavigationRouteFailed();

  void onNavigationRouteCancelled();

  void onNavigationRouteRendered();

  void onNewLocation(NavigationLocation location);

  void onRouteProgress(RouteProgress routeProgress);

  void onNavigationCameraStateChanged(NavigationCameraState state);

  static void setUp(
    NavigationListener? api, {
    BinaryMessenger? binaryMessenger,
    String messageChannelSuffix = '',
  }) {
    messageChannelSuffix =
        messageChannelSuffix.isNotEmpty ? '.$messageChannelSuffix' : '';
    {
      final BasicMessageChannel<
          Object?> pigeonVar_channel = BasicMessageChannel<
              Object?>(
          'dev.flutter.pigeon.mapbox_maps_flutter.NavigationListener.onNavigationRouteReady$messageChannelSuffix',
          pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        pigeonVar_channel.setMessageHandler(null);
      } else {
        pigeonVar_channel.setMessageHandler((Object? message) async {
          try {
            api.onNavigationRouteReady();
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          } catch (e) {
            return wrapResponse(
                error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
    {
      final BasicMessageChannel<
          Object?> pigeonVar_channel = BasicMessageChannel<
              Object?>(
          'dev.flutter.pigeon.mapbox_maps_flutter.NavigationListener.onNavigationRouteFailed$messageChannelSuffix',
          pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        pigeonVar_channel.setMessageHandler(null);
      } else {
        pigeonVar_channel.setMessageHandler((Object? message) async {
          try {
            api.onNavigationRouteFailed();
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          } catch (e) {
            return wrapResponse(
                error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
    {
      final BasicMessageChannel<
          Object?> pigeonVar_channel = BasicMessageChannel<
              Object?>(
          'dev.flutter.pigeon.mapbox_maps_flutter.NavigationListener.onNavigationRouteCancelled$messageChannelSuffix',
          pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        pigeonVar_channel.setMessageHandler(null);
      } else {
        pigeonVar_channel.setMessageHandler((Object? message) async {
          try {
            api.onNavigationRouteCancelled();
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          } catch (e) {
            return wrapResponse(
                error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
    {
      final BasicMessageChannel<
          Object?> pigeonVar_channel = BasicMessageChannel<
              Object?>(
          'dev.flutter.pigeon.mapbox_maps_flutter.NavigationListener.onNavigationRouteRendered$messageChannelSuffix',
          pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        pigeonVar_channel.setMessageHandler(null);
      } else {
        pigeonVar_channel.setMessageHandler((Object? message) async {
          try {
            api.onNavigationRouteRendered();
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          } catch (e) {
            return wrapResponse(
                error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
    {
      final BasicMessageChannel<
          Object?> pigeonVar_channel = BasicMessageChannel<
              Object?>(
          'dev.flutter.pigeon.mapbox_maps_flutter.NavigationListener.onNewLocation$messageChannelSuffix',
          pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        pigeonVar_channel.setMessageHandler(null);
      } else {
        pigeonVar_channel.setMessageHandler((Object? message) async {
          assert(message != null,
              'Argument for dev.flutter.pigeon.mapbox_maps_flutter.NavigationListener.onNewLocation was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final NavigationLocation? arg_location =
              (args[0] as NavigationLocation?);
          assert(arg_location != null,
              'Argument for dev.flutter.pigeon.mapbox_maps_flutter.NavigationListener.onNewLocation was null, expected non-null NavigationLocation.');
          try {
            api.onNewLocation(arg_location!);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          } catch (e) {
            return wrapResponse(
                error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
    {
      final BasicMessageChannel<
          Object?> pigeonVar_channel = BasicMessageChannel<
              Object?>(
          'dev.flutter.pigeon.mapbox_maps_flutter.NavigationListener.onRouteProgress$messageChannelSuffix',
          pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        pigeonVar_channel.setMessageHandler(null);
      } else {
        pigeonVar_channel.setMessageHandler((Object? message) async {
          assert(message != null,
              'Argument for dev.flutter.pigeon.mapbox_maps_flutter.NavigationListener.onRouteProgress was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final RouteProgress? arg_routeProgress = (args[0] as RouteProgress?);
          assert(arg_routeProgress != null,
              'Argument for dev.flutter.pigeon.mapbox_maps_flutter.NavigationListener.onRouteProgress was null, expected non-null RouteProgress.');
          try {
            api.onRouteProgress(arg_routeProgress!);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          } catch (e) {
            return wrapResponse(
                error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
    {
      final BasicMessageChannel<
          Object?> pigeonVar_channel = BasicMessageChannel<
              Object?>(
          'dev.flutter.pigeon.mapbox_maps_flutter.NavigationListener.onNavigationCameraStateChanged$messageChannelSuffix',
          pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        pigeonVar_channel.setMessageHandler(null);
      } else {
        pigeonVar_channel.setMessageHandler((Object? message) async {
          assert(message != null,
              'Argument for dev.flutter.pigeon.mapbox_maps_flutter.NavigationListener.onNavigationCameraStateChanged was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final NavigationCameraState? arg_state =
              (args[0] as NavigationCameraState?);
          assert(arg_state != null,
              'Argument for dev.flutter.pigeon.mapbox_maps_flutter.NavigationListener.onNavigationCameraStateChanged was null, expected non-null NavigationCameraState.');
          try {
            api.onNavigationCameraStateChanged(arg_state!);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          } catch (e) {
            return wrapResponse(
                error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
  }
}

class NavigationInterface {
  /// Constructor for [NavigationInterface].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  NavigationInterface(
      {BinaryMessenger? binaryMessenger, String messageChannelSuffix = ''})
      : pigeonVar_binaryMessenger = binaryMessenger,
        pigeonVar_messageChannelSuffix =
            messageChannelSuffix.isNotEmpty ? '.$messageChannelSuffix' : '';
  final BinaryMessenger? pigeonVar_binaryMessenger;

  static const MessageCodec<Object?> pigeonChannelCodec =
      Navigation_PigeonCodec();

  final String pigeonVar_messageChannelSuffix;

  Future<void> setRoute(List<Point> waypoints) async {
    final String pigeonVar_channelName =
        'dev.flutter.pigeon.mapbox_maps_flutter.NavigationInterface.setRoute$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel =
        BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(<Object?>[waypoints]) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> stopTripSession() async {
    final String pigeonVar_channelName =
        'dev.flutter.pigeon.mapbox_maps_flutter.NavigationInterface.stopTripSession$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel =
        BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(null) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> startTripSession(bool withForegroundService) async {
    final String pigeonVar_channelName =
        'dev.flutter.pigeon.mapbox_maps_flutter.NavigationInterface.startTripSession$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel =
        BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final List<Object?>? pigeonVar_replyList = await pigeonVar_channel
        .send(<Object?>[withForegroundService]) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> requestNavigationCameraToFollowing() async {
    final String pigeonVar_channelName =
        'dev.flutter.pigeon.mapbox_maps_flutter.NavigationInterface.requestNavigationCameraToFollowing$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel =
        BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(null) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> requestNavigationCameraToOverview() async {
    final String pigeonVar_channelName =
        'dev.flutter.pigeon.mapbox_maps_flutter.NavigationInterface.requestNavigationCameraToOverview$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel =
        BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(null) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<NavigationLocation?> lastLocation() async {
    final String pigeonVar_channelName =
        'dev.flutter.pigeon.mapbox_maps_flutter.NavigationInterface.lastLocation$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel =
        BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(null) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return (pigeonVar_replyList[0] as NavigationLocation?);
    }
  }
}