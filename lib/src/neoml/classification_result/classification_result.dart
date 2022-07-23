import 'dart:ffi' as ffi;
import 'package:collection/collection.dart';
import 'package:dart_neoml/src/common/base.dart';

import 'package:dart_neoml/dart_neoml.dart';
import 'package:meta/meta.dart';

import '../../libraries/libraries.dart';

part 'functions.dart';
part 'native_classification_result.dart';

/// {@template neoml.ClassificationResult}
/// Classification result.
/// {@endtemplate}
/// {@category neoml}
class ClassificationResult
    with _NativeClassificationResult
    implements ClassInstance {
  final Instance _instance;

  @override
  Instance get instance => _instance;

  @internal
  ClassificationResult.fromInstance(Instance instance) : _instance = instance;

  /// The number of the class to which the input object is assigned
  int get preferredClass => _preferredClass(_instance);

  // The array of probabilities for the object to belong to each of the
  List<double> get probabilities => _getProbabilities(_instance);

  // The probability that the input object fits none of the classes
  double get exceptionProbability => _exceptionProbability(_instance);

  @override
  int get hashCode =>
      preferredClass.hashCode ^
      exceptionProbability.hashCode ^
      const DeepCollectionEquality().hash(probabilities);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClassificationResult &&
          other.preferredClass == preferredClass &&
          other.exceptionProbability == exceptionProbability &&
          const DeepCollectionEquality()
              .equals(other.probabilities, probabilities);

  @override
  String toString() => 'ClassificationResult(preferredClass: $preferredClass, '
      'exceptionProbability: $exceptionProbability, probabilities: $probabilities)';
}
