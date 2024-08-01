//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Dart/Flutter (DF) Packages by DevCetra.com & contributors. See MIT LICENSE
// file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:df_gps_math/df_gps_math.dart';

void main() {
  final gpsMath = GPSMath().instance;

  // Approx. position for Hobart, Tasmania.
  final hobart = (lat: -42.8821, lng: 147.3272, alt: 0.0);

  // Approx. position for Pretoria, South Africa.
  final pretoria = (lat: -25.7479, lng: 28.2293, alt: 0.0);

  // Calculate the distance between Hobart and Pretoria.
  final distance = gpsMath.calculateHavershire3DDistance(
    pos1: hobart,
    pos2: pretoria,
    unit: DistanceUnit.KILOMETRES,
    radius: CelestialRadius.EARTH,
  );
  
  print('Hobart -> Pretoria = ${distance.round()} km');
}
