//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Copyright © dev-cetera.com & contributors.
//
// The use of this source code is governed by an MIT-style license described in
// the LICENSE file located in this project's root directory.
//
// See: https://opensource.org/license/mit
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/src/_index.g.dart';

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
      return (lat: 0.0, lng: 0.0, alt: 0.0);
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
