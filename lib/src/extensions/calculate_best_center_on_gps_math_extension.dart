//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Dart/Flutter (DF) Packages by DevCetra.com & contributors. See MIT LICENSE
// file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/src/distance_unit.dart';
import '/src/gps_math.dart';
import '/src/global_position.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

extension CalculateBestCentereGPSMathExtension on GPSMath {
  /// Calculates the best center for a set of [locations]. This is the geometric
  /// center unless the distance to the closest marker is greater than the
  /// [threshold], then the closest marker is used. The [distanceUnit] is the unit of
  /// the threshold.
  GlobalPosition calculateBestCenter({
    required Set<GlobalPosition> locations,
    required double threshold,
    required DistanceUnit distanceUnit,
  }) {
    if (locations.isEmpty) {
      return (
        lat: 0.0,
        lng: 0.0,
        alt: 0.0,
      );
    }
    var center = calculateGeometricCenter(locations);
    var closestMarker = locations.first;
    var minDistance = calculateHavershire3DDistance(
      pos1: center,
      pos2: closestMarker,
      unit: distanceUnit,
    );
    for (final marker in locations.skip(1)) {
      final distance = calculateHavershire3DDistance(
        pos1: center,
        pos2: marker,
        unit: distanceUnit,
      );
      if (distance < minDistance) {
        closestMarker = marker;
        minDistance = distance;
      }
    }
    if (minDistance > threshold) {
      center = closestMarker;
    }
    return center;
  }
}
