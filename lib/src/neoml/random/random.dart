import 'dart:ffi' as ffi;
import 'package:dart_neoml/src/functions/functions.dart';
import 'package:dart_neoml/src/libraries/libraries.dart';

part 'functions.dart';

/// {@template neoml.random.Random}
/// The class to generate random values
///
/// It uses the complementary-multiply-with-carry algorithm
///
/// C lag-1024, multiplier(a) = 108798, initial carry(c) = 12345678
/// {@endtemplate}
class Random {
  final Instance _instance;

  /// {@macro neoml.random.Random}
  Random({
    int seed = 195948557,
  }) : _instance = _initSeed(seed);

  /// {@macro neoml.random.Random}
  ///
  /// The default value is taken from [DateTime.now]
  Random.timebased()
      : _instance =
            _initSeed(DateTime.now().microsecondsSinceEpoch % 195948557);

  static ffi.Pointer<ffi.Void> _initSeed(int seed) {
    final constructor = Libraries.instance.neoML
        .lookupFunction<ConstructorFFI1<ffi.UnsignedInt>, Constructor1<int>>(
      CRandomFunctinos.init,
    );

    return constructor(seed);
  }

  /// Resets to the starting state
  void reset(int seed) => Libraries.instance.neoML.lookupFunction<
      CallbackFFI1<ffi.UnsignedInt, ffi.Void>,
      Callback1<int, void>>(CRandomFunctinos.reset)(_instance, seed);

  /// Returns a double value from a uniform distribution in ([min], [max]) range.
  /// ([min] is not included in the half - interval segment)
  ///
  /// If [min] == [max], min is returned
  double uniform({
    required double min,
    required double max,
  }) =>
      Libraries.instance.neoML.lookupFunction<
          CallbackFFI2<ffi.Double, ffi.Double, ffi.Double>,
          Callback2<double, double, double>>(CRandomFunctinos.uniform)(
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
          CallbackFFI2<ffi.Int32, ffi.Int32, ffi.Int32>,
          Callback2<int, int, int>>(CRandomFunctinos.uniformInt)(
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
          CallbackFFI2<ffi.Double, ffi.Double, ffi.Double>,
          Callback2<double, double, double>>(CRandomFunctinos.normal)(
        _instance,
        mean,
        sigma,
      );
}
