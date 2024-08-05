//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Dart/Flutter (DF) Packages by DevCetra.com & contributors. See LICENSE file
// in root directory.
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

  double get inMetres => this.convert(DistanceUnit.METRES);
  double get inKilometres => this.convert(DistanceUnit.KILOMETRES);
  double get inMiles => this.convert(DistanceUnit.MILES);
  double get inNauticalMiles => this.convert(DistanceUnit.NAUTICAL_MILES);
  double get inFeet => this.convert(DistanceUnit.FEET);
  double get inYards => this.convert(DistanceUnit.YARDS);
  double get inAstronomicalUnits => this.convert(DistanceUnit.ASTRONOMICAL_UNITS);

  //
  //
  //

  double convert(DistanceUnit unit) => unit.conversion * radius;
}
