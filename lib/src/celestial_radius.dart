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

import 'distance_unit.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

enum CelestialRadius {
  //
  //
  //

  EARTH(6371e3),
  EARTH_MOON(1737.4e3),
  MARS(3389.5e3);

  //
  //
  //

  final double radius;

  //
  //
  //

  const CelestialRadius(this.radius);

  //
  //
  //

  double get inMetres => convert(DistanceUnit.METRES);
  double get inKilometres => convert(DistanceUnit.KILOMETRES);
  double get inMiles => convert(DistanceUnit.MILES);
  double get inNauticalMiles => convert(DistanceUnit.NAUTICAL_MILES);
  double get inFeet => convert(DistanceUnit.FEET);
  double get inYards => convert(DistanceUnit.YARDS);
  double get inAstronomicalUnits => convert(DistanceUnit.ASTRONOMICAL_UNITS);

  //
  //
  //

  double convert(DistanceUnit unit) => unit.conversion * radius;
}
