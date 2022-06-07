import 'dart:ffi' as ffi;

import 'package:dart_neoml/dart_neoml.dart';

import '../../libraries/libraries.dart';

part 'functions.dart';

/// {@template neoml.machine_learning.Sigmoid}
/// The sigmoid coefficients
///
/// S(x) = 1 / 1 + exp( A * x + B );
/// {@endtemplate}
/// {@category neoml}
class Sigmoid extends ffi.Struct {
  /// {@macro neoml.machine_learning.Sigmoid}
  static Sigmoid init({
    double a = 0,
    double b = 0,
  }) =>
      _createStructFn(a, b);

  @ffi.Double()
  external double a;

  @ffi.Double()
  external double b;

  bool get isValid => Libraries.instance.neoML
          .lookupFunction<NativeCallbackFn1<Sigmoid, ffi.Bool>, CallbackFn1<Sigmoid, bool>>(
        _CSigmoidFunctions.isValid,
      )(this);

  double distanceToProbability(double distance) {
    final func = Libraries.instance.neoML.lookupFunction<
        NativeCallbackFn2<Sigmoid, ffi.Double, ffi.Double>, CallbackFn2<Sigmoid, double, double>>(
      _CSigmoidFunctions.distanceToProbability,
    );

    return func(this, distance);
  }

  static CallbackFn2<double, double, Sigmoid> get _createStructFn =>
      Libraries.instance.neoML.lookupFunction<NativeCallbackFn2<ffi.Double, ffi.Double, Sigmoid>,
          CallbackFn2<double, double, Sigmoid>>(
        _CSigmoidFunctions.init,
      );

  @override
  int get hashCode => a.hashCode ^ b.hashCode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is Sigmoid && other.a == a && other.b == b;
  }

  @override
  String toString() {
    return 'Sigmoid(a: $a, b: $b)';
  }
}
