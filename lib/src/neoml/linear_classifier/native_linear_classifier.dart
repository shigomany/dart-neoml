part of 'linear_classifier.dart';

typedef _NativeConstructor = ConstructorFFI9<ffi.Int32, ffi.Int32, ffi.Int32,
    ffi.Int32, Sigmoid, ffi.Double, ffi.Bool, ffi.Float, ffi.Int32>;

typedef _DartConstructor
    = Constructor9<int, int, int, int, Sigmoid, double, bool, double, int>;

mixin _NativeLinearClassifier {
  static ffi.DynamicLibrary get _lib => Libraries.instance.neoML;

  static Instance init({
    required LossFunction loss,
    required MultiClassMode multiClassMode,
    required Sigmoid sigmoid,
    required int errorWeight,
    required int maxIterations,
    required double tolerance,
    required bool normalizeError,
    required double l1,
    required int threadCount,
  }) {
    final constructor =
        _lib.lookupFunction<_NativeConstructor, _DartConstructor>(
      _CLinearClassifierFunctions.init,
    );

    return constructor(
      loss.value,
      multiClassMode.value,
      errorWeight,
      maxIterations,
      sigmoid,
      tolerance,
      normalizeError,
      l1,
      threadCount,
    );
  }

  double _getValue(Instance instance) {
    final func = _lib.lookupFunction<NativeClassCallbackFn0<ffi.Double>,
        ClassCallbackFn0<double>>(
      _CLinearClassifierFunctions.getValue,
    );

    return func(instance);
  }

  void _setValue(Instance instance, double value) {
    final func = _lib.lookupFunction<
        NativeClassCallbackFn1<ffi.Double, ffi.Void>,
        ClassCallbackFn1<double, void>>(
      _CLinearClassifierFunctions.setValue,
    );

    return func(instance, value);
  }
}
