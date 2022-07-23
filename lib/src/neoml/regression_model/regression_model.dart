import 'dart:ffi' as ffi;
import 'package:dart_neoml/src/neoml/float_vector_desc/float_vector_desc.dart';

import 'package:dart_neoml/dart_neoml.dart';
import 'package:dart_neoml/src/common/base.dart';
import 'package:meta/meta.dart';

import '../../libraries/libraries.dart';

part 'functions.dart';
part 'native_regression_model.dart';

/// Regression model for a function that returns a number
/// {@category neoml}
class RegressionModel with _NativeRegressionModel implements ClassInstance {
  @internal
  RegressionModel.fromInstance(Instance instance) : _instance = instance;

  final Instance _instance;

  @override
  Instance get instance => _instance;

  /// {@template neoml.RegressionModel.predict}
  /// Predicts the function value on a vector
  /// {@endtemplate}
  double predictList(List<double> data) => _predictList(_instance, data);

  /// {@macro neoml.RegressionModel.predict}
  double predictVector(IFloatVector vector) =>
      _predictVector(_instance, vector);

  /// {@macro neoml.RegressionModel.predict}
  double predictDesc(FloatVectorDesc desc) => _predictDesc(_instance, desc);
}
