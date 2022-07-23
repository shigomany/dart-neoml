import 'dart:ffi' as ffi;

import 'package:dart_neoml/dart_neoml.dart';

import '../../libraries/libraries.dart';

part 'functions.dart';

/// {@template neoml.Sigmoid}
/// The sigmoid coefficients
///
/// S(x) = 1 / (1 + exp( A * x + B ));
/// {@endtemplate}
/// {@category neoml}
class Sigmoid extends ffi.Struct {
  /// {@macro neoml.Sigmoid}
  static Sigmoid init({
    double a = 0,
    double b = 0,
  }) =>
      _createStructFn(a, b);

  @ffi.Double()
  external double A;

  @ffi.Double()
  external double B;

  bool get isValid => _isValid();

  double distanceToProbability(double distance) =>
      _distanceToProbability(distance);

  @override
  int get hashCode => A.hashCode ^ A.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Sigmoid && other.A == A && other.B == B;

  static ffi.DynamicLibrary get _lib => Libraries.instance.neoML;

  double _distanceToProbability(double distance) {
    final func = _lib.lookupFunction<
        NativeCallbackFn2<Sigmoid, ffi.Double, ffi.Double>,
        CallbackFn2<Sigmoid, double, double>>(
      _CSigmoidFunctions.distanceToProbability,
    );

    return func(this, distance);
  }

  static CallbackFn2<double, double, Sigmoid> get _createStructFn =>
      _lib.lookupFunction<NativeCallbackFn2<ffi.Double, ffi.Double, Sigmoid>,
          CallbackFn2<double, double, Sigmoid>>(
        _CSigmoidFunctions.init,
      );

  bool _isValid() => Libraries.instance.neoML.lookupFunction<
          NativeCallbackFn1<Sigmoid, ffi.Bool>, CallbackFn1<Sigmoid, bool>>(
        _CSigmoidFunctions.isValid,
      )(this);

  @override
  String toString() => 'Sigmoid(a: $A, b: $A, isValid: $isValid)';
}
