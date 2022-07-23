import 'dart:ffi' as ffi;

import 'package:dart_neoml/dart_neoml.dart';
import 'package:dart_neoml/src/common/base.dart';
import 'package:meta/meta.dart';

import '../../libraries/libraries.dart';

part 'functions.dart';
part 'native_linear_classifier.dart';

/// the loss function to be optimized. binomial refers to deviance (= logistic regression) for classification with probabilistic outputs.
enum LossFunction {
  squaredHinge(0),
  binomial(1),
  smoothedHinge(2);

  const LossFunction(this.value);

  final int value;
}

enum MultiClassMode {
  oneVsAll(1),
  oneVsOne(2);

  const MultiClassMode(this.value);

  final int value;
}

/// {@macro neoml.LinearClassifier}
/// {@category neoml}
class LinearClassifier with _NativeLinearClassifier implements ClassInstance {
  /// {@template neoml.LinearClassifier}
  /// Linear classifier.
  ///
  ///	Descirption
  /// {@endtemplate}
  LinearClassifier({
    MultiClassMode multiClassMode = MultiClassMode.oneVsAll,
    LossFunction loss = LossFunction.binomial,
    Sigmoid? sigmoid,
    int errorWeight = 1,
    int maxIterations = 1000,
    double tolerance = -1.0,
    bool normalizeError = false,
    double l1 = 0.0,
    int threadCount = 1,
  }) {
    if (threadCount <= 0) {
      throw ArgumentError('The `threadCount` must be >= 1');
    }
    if (maxIterations <= 0) {
      throw ArgumentError('The `maxIterations` must be >= 1');
    }
    if (errorWeight <= 0) {
      throw ArgumentError('The `errorWeight` must be >= 1');
    }

    _instance = _NativeLinearClassifier.init(
      loss: loss,
      multiClassMode: multiClassMode,
      sigmoid: sigmoid ?? Sigmoid.init(),
      errorWeight: errorWeight,
      tolerance: tolerance,
      maxIterations: maxIterations,
      normalizeError: normalizeError,
      l1: l1,
      threadCount: threadCount,
    );
  }

  @internal
  LinearClassifier.fromInstance(Instance instance) : _instance = instance;

  late final Instance _instance;

  @override
  Instance get instance => _instance;

  double get value => _getValue(_instance);

  set value(double value) => _setValue(_instance, value);

  @override
  String toString() => 'LinearClassifier(value: $value)';
}
