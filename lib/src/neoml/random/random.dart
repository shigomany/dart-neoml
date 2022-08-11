import 'dart:ffi' as ffi;

import '../../functions/functions.dart';
import '../../libraries/libraries.dart';

part 'functions.dart';

/// {@template neoml.Random}
/// The class to generate random values
///
/// It uses the complementary-multiply-with-carry algorithm
///
/// C lag-1024, multiplier(a) = 108798, initial carry(c) = 12345678
/// {@endtemplate}
/// {@category neoml}
class Random {
  final Instance _instance;

  /// {@template neoml.Random.constructor}
  /// Creates Random instance with start [seed] =
  /// {@endtemplate}
  /// `195948557`
  Random({
    int seed = 195948557,
  }) : _instance = _initSeed(seed);

  /// {@macro neoml.Random.constructor}
  /// DateTime.now().microsecondsSinceEpoch
  Random.timebased()
      : _instance =
            _initSeed(DateTime.now().microsecondsSinceEpoch % 195948557);

  static Instance _initSeed(int seed) {
    final constructor = Libraries.instance.neoML
        .lookupFunction<ConstructorFFI1<ffi.UnsignedInt>, Constructor1<int>>(
      _CRandomFunctinos.init,
    );

    return constructor(seed);
  }

  /// Resets to the starting state
  void reset(int seed) => Libraries.instance.neoML.lookupFunction<
      NativeClassCallbackFn1<ffi.UnsignedInt, ffi.Void>,
      ClassCallbackFn1<int, void>>(_CRandomFunctinos.reset)(_instance, seed);

  /// Returns a double value from a uniform distribution in ([min], [max]) range.
  /// ([min] is not included in the half - interval segment)
  ///
  /// If [min] == [max], min is returned
  double uniform({
    required double min,
    required double max,
  }) =>
      Libraries.instance.neoML.lookupFunction<
          NativeClassCallbackFn2<ffi.Double, ffi.Double, ffi.Double>,
          ClassCallbackFn2<double, double, double>>(_CRandomFunctinos.uniform)(
        _instance,
        min,
        max,
      );

  /// Returns an int value from a uniform distribution in segment ([min], [max]) range.
  ///
  /// Note that max return value is possible!
  ///
  /// If [min] == [max], min is returned
  int uniformInt({
    required int min,
    required int max,
  }) =>
      Libraries.instance.neoML.lookupFunction<
          NativeClassCallbackFn2<ffi.Int32, ffi.Int32, ffi.Int32>,
          ClassCallbackFn2<int, int, int>>(_CRandomFunctinos.uniformInt)(
        _instance,
        min,
        max,
      );

  /// Returns a double value from a normal distribution N([mean], [sigma])
  double normal({
    required double mean,
    required double sigma,
  }) =>
      Libraries.instance.neoML.lookupFunction<
          NativeClassCallbackFn2<ffi.Double, ffi.Double, ffi.Double>,
          ClassCallbackFn2<double, double, double>>(_CRandomFunctinos.normal)(
        _instance,
        mean,
        sigma,
      );
}
