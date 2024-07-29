import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  StreamSubscription<Position>? _positionStreamSubscription;
  Position? _lastPosition;
  final List<Position> _positions = [];
  void Function(List<Position>)? onPositionUpdate;

  void startTracking(int distanceFilter) {
    final LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: distanceFilter,
    );

    _positionStreamSubscription =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position position) {
      if (_lastPosition == null ||
          _calculateDistance(_lastPosition!, position) > distanceFilter) {
        _positions.add(position);
        if (onPositionUpdate != null) {
          onPositionUpdate!(_positions);
        }
        _lastPosition = position;
        if (kDebugMode) {
          print('Point saved: $position');
        }
      }
    });
  }

  void stopTracking() {
    _positionStreamSubscription?.cancel();
    _positionStreamSubscription = null;
  }

  List<Position> getPositions() {
    return _positions;
  }

  double _calculateDistance(Position point1, Position point2) {
    return Geolocator.distanceBetween(
      point1.latitude,
      point1.longitude,
      point2.latitude,
      point2.longitude,
    );
  }
}
