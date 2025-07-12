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

import 'dart:math';

import '/src/gps_math.dart';
import '/src/celestial_radius.dart';
import '/src/distance_unit.dart';
import '/src/global_position.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

extension CalculateHavershire3DDistanceGPSMathExtension on GPSMath {
  /// Calculate the distance between two locations using the Haversine formula
  /// and optionally the elevation difference.
  ///
  /// The Haversine formula calculates the shortest distance between two points
  /// on a sphere.
  ///
  /// The formula is:
  ///
  /// ```txt
  /// a = sin²(Δlat/2) + cos(lat1) * cos(lat2) * sin²(Δlon/2)
  /// c = 2 * atan2(√a, √(1−a))
  /// d = r * c
  /// ```
  ///
  /// The alt is factored in by taking the square root of the sum of the
  /// square of the flat distance and the square of the alt difference.
  ///
  /// **Parameters:**
  ///
  /// - `location1` - The first location.
  /// - `location2` - The second location.
  /// - `unit` - The unit of distance to return. Default is `LocationPackageDistanceUnit.METRES`.
  /// - `radius` - The radius of the sphere. Default is `LocationPackageSphereRadius.EARTH`.
  double calculateHavershire3DDistance({
    required GlobalPosition pos1,
    required GlobalPosition pos2,
    DistanceUnit unit = DistanceUnit.METRES,
    CelestialRadius radius = CelestialRadius.EARTH,
  }) {
    final lat1 = pos1.lat;
    final lon1 = pos1.lng;
    final alt1 = pos1.alt;
    final lat2 = pos2.lat;
    final lon2 = pos2.lng;
    final alt2 = pos2.alt;
    final r = radius.radius;

    // Convert lat and lng from degrees to radians.
    final radLat1 = lat1 * pi / 180;
    final radLat2 = lat2 * pi / 180;
    final deltaLat = (lat2 - lat1) * pi / 180;
    final deltaLon = (lon2 - lon1) * pi / 180;

    // Calculate the horizontal distance using the Haversine formula.
    final a = sin(deltaLat / 2) * sin(deltaLat / 2) +
        cos(radLat1) * cos(radLat2) * sin(deltaLon / 2) * sin(deltaLon / 2);
    final c = 2 * atan2(sqrt(a), sqrt(1 - a));
    final d = r * c;

    // Calculate the difference in alt.
    final deltaAlt = alt2 - alt1;

    // Calculate the total 3D distance.
    final d3d = sqrt(d * d + deltaAlt * deltaAlt);

    // Convert the distance based on the requested unit.
    return d3d * unit.conversion;
  }
}
