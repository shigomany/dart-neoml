part of 'classification_probability.dart';

mixin _NativeClassificationProbability {
  static ffi.DynamicLibrary get _lib => Libraries.instance.neoML;

  static Instance init(double value) {
    final constructor =
        _lib.lookupFunction<ConstructorFFI1<ffi.Double>, Constructor1<double>>(
      _CClassificationProbabilityFunctions.init,
    );

    return constructor(value);
  }

  double _getValue(Instance instance) {
    final func = _lib.lookupFunction<NativeClassCallbackFn0<ffi.Double>,
        ClassCallbackFn0<double>>(
      _CClassificationProbabilityFunctions.getValue,
    );

    return func(instance);
  }

  void _setValue(Instance instance, double value) {
    final func = _lib.lookupFunction<
        NativeClassCallbackFn1<ffi.Double, ffi.Void>,
        ClassCallbackFn1<double, void>>(
      _CClassificationProbabilityFunctions.setValue,
    );

    return func(instance, value);
  }
}
