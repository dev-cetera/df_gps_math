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

import '/src/gps_math.dart';
import '/src/global_position.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

extension CalculateGeometricCentereGPSMathExtension on GPSMath {
  /// Calculates the geometric center of a set of locations.
  GlobalPosition calculateGeometricCenter(Set<GlobalPosition> locations) {
    if (locations.isEmpty) {
      return (alt: 0.0, lat: 0.0, lng: 0.0);
    }
    var sumLat = 0.0;
    var sumLng = 0.0;
    for (final marker in locations) {
      sumLat += marker.lat;
      sumLng += marker.lng;
    }
    return (
      lat: sumLat / locations.length,
      lng: sumLng / locations.length,
      alt: 0.0,
    );
  }
}
