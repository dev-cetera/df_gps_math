# DF GPS Math

Dart & Flutter Packages by DevCetra.com & contributors.

[![pub package](https://img.shields.io/pub/v/df_gps_math.svg)](https://pub.dev/packages/df_gps_math)

## Summary

A package that provides some math functions for global (GPS) positions. For a full feature set, please refer to the [API reference](https://pub.dev/documentation/df_gps_math/) for more information.

## Usage Example

```dart
final gpsMath = GPSMath().instance;

// Approximate position for Hobart, Australia.
final hobart = (lat: -42.8821, lng: 147.3272, alt: 0.0);

// Approximate position for Pretoria, South Africa.
final pretoria = (lat: -25.7479, lng: 28.2293, alt: 0.0);

// Calculate the approximate distance between Hobart and Pretoria.
final distance = gpsMath.calculateHavershire3DDistance(
pos1: hobart,
pos2: pretoria,
unit: DistanceUnit.KILOMETRES,
radius: CelestialRadius.EARTH,
);

print('Hobart -> Pretoria = ${distance.round()} km');
```

Please refer to the [API reference](https://pub.dev/documentation/df_gps_math/) for more information.

## Installation

Use this package as a dependency by adding it to your `pubspec.yaml` file (see [here](https://pub.dev/packages/df_gps_math/install)).

## Contributing and Discussions

This is an open-source project, and contributions are welcome from everyone, regardless of experience level. Contributing to projects is a great way to learn, share knowledge, and showcase your skills to the community. Join the discussions to ask questions, report bugs, suggest features, share ideas, or find out how you can contribute.

### Join GitHub Discussions:

💬 https://github.com/robmllze/df_gps_math/discussions/

### Join Reddit Discussions:

💬 https://www.reddit.com/r/df_gps_math/

### Chief Maintainer:

📧 Email _Robert Mollentze_ at robmllze@gmail.com

## License

This project is released under the MIT License. See [LICENSE](https://raw.githubusercontent.com/robmllze/df_gps_math/main/LICENSE) for more information.
