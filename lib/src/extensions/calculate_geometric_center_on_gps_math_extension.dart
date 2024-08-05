//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Dart/Flutter (DF) Packages by DevCetra.com & contributors. See LICENSE file
// in root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/src/gps_math.dart';
import '/src/global_position.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

extension CalculateGeometricCentereGPSMathExtension on GPSMath {
  /// Calculates the geometric center of a set of locations.
  GlobalPosition calculateGeometricCenter(
    Set<GlobalPosition> locations,
  ) {
    if (locations.isEmpty) {
      return (
        alt: 0.0,
        lat: 0.0,
        lng: 0.0,
      );
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
