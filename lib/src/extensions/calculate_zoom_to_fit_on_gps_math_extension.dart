//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Copyright Ⓒ Robert Mollentze
//
// Licensing details can be found in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'dart:math';

import '/src/gps_math.dart';
import '/src/global_position.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

extension CalculateZoomToFitGPSMathExtension on GPSMath {
  /// Calculates the zoom level to fit all the [locations] on a map. The [factor]
  /// is a multiplier to adjust the zoom level. The [minZoom] and [maxZoom] are
  /// the minimum and maximum zoom levels to clamp the result.
  double calculateZoomToFit(
    Iterable<GlobalPosition> locations, {
    double factor = 1.0,
    double minZoom = 10.0,
    double maxZoom = 20.0,
  }) {
    if (locations.isEmpty) {
      return 10.0;
    }
    var minLat = locations.first.lat;
    var maxLat = locations.first.lat;
    var minLng = locations.first.lng;
    var maxLng = locations.first.lng;
    for (final marker in locations) {
      if (marker.lat < minLat) minLat = marker.lat;
      if (marker.lat > maxLat) maxLat = marker.lat;
      if (marker.lng < minLng) minLng = marker.lng;
      if (marker.lng > maxLng) maxLng = marker.lng;
    }
    final lngDelta = maxLng - minLng;
    // Estimate zoom level based on lng span.
    final estimate = max(0.0, 1.0 - log(lngDelta) / log(2.0) + (log(360) / log(2.0)) - 1);
    // Apply the factor and clamp the zoom level.
    final zoom = max(minZoom, min(maxZoom, estimate)) * factor;
    return zoom;
  }
}
