import 'dart:ffi' as ffi;

import 'package:dart_neoml/dart_neoml.dart';
import 'package:dart_neoml/src/common/base.dart';
import 'package:meta/meta.dart';

import '../../libraries/libraries.dart';

part 'functions.dart';
part 'native_classification_probability.dart';

/// {@macro neoml.ClassificationProbability}
/// {@category neoml}
class ClassificationProbability
    with _NativeClassificationProbability
    implements ClassInstance {
  /// {@template neoml.ClassificationProbability}
  /// Classification probability.
  ///
  ///	The probability takes values from `0` to `1`
  /// {@endtemplate}
  ClassificationProbability(double value) {
    if (value < minValue || value > maxValue) {
      throw RangeError(
          'The value ($value) must be between $minValue and $maxValue');
    }
    _instance = _NativeClassificationProbability.init(value);
  }

  @internal
  ClassificationProbability.fromInstance(Instance instance)
      : _instance = instance;

  late final Instance _instance;

  @override
  Instance get instance => _instance;

  /// Get probability value
  double get value => _getValue(_instance);

  /// Set probability value
  set value(double value) => _setValue(_instance, value);

  /// Checks if the probability is valid
  bool get isValid => value <= maxValue && value >= minValue;

  static const double minValue = 0.0;

  static const double maxValue = 1.0;

  @override
  String toString() =>
      'ClassificationProbability(value: $value, isValid: $isValid)';
}
