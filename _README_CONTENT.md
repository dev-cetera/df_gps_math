## Summary

A package that provides some math functions for global (GPS) positions.

## Example

```dart
final gpsMath = GPSMath();

// Approx. position for Hobart, Tasmania.
const hobart = (lat: -42.8821, lng: 147.3272, alt: 0.0);

// Approx. position for Pretoria, South Africa.
const pretoria = (lat: -25.7479, lng: 28.2293, alt: 0.0);

// Calculate the distance between Hobart and Pretoria.
final distance = gpsMath.calculateHavershire3DDistance(
pos1: hobart,
pos2: pretoria,
unit: DistanceUnit.KILOMETRES,
radius: CelestialRadius.EARTH,
);

print('Hobart -> Pretoria = ${distance.round()} km');
```