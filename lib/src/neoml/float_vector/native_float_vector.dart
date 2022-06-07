part of 'float_vector.dart';

mixin _NativeFloatVector {
  static ffi.DynamicLibrary get _lib => Libraries.instance.neoML;

  static Instance _fromSpareVector(int size, SparseFloatVector vector) {
    final constructor =
        _lib.lookupFunction<ConstructorFFI2<ffi.Int32, Instance>, Constructor2<int, Instance>>(
      _CFloatVectorFunctions.fromSparseVector,
    );

    return constructor(size, vector.instance);
  }

  static Instance _fromVectorDesc(int size, FloatVectorDesc desc) {
    final constructor = _lib.lookupFunction<ConstructorFFI2<ffi.Int32, FloatVectorDesc>,
        Constructor2<int, FloatVectorDesc>>(
      _CFloatVectorFunctions.fromVectorDesc,
    );

    return constructor(size, desc);
  }

  static Instance _fromList(Iterable<double> values) {
    final desc = FloatVectorDesc.fromVector(values.toList());

    return _fromVectorDesc(values.length, desc);
  }

  static Instance _init(int size, double value) {
    final constructor =
        _lib.lookupFunction<ConstructorFFI2<ffi.Int32, ffi.Float>, Constructor2<int, double>>(
      _CFloatVectorFunctions.init,
    );

    return constructor(size, value);
  }

  bool _isNull(Instance instance) {
    final func = _lib.lookupFunction<NativeClassCallbackFn0<ffi.Bool>, ClassCallbackFn0<bool>>(
      _CFloatVectorFunctions.isNull,
    );

    return func(instance);
  }

  int _size(Instance instance) {
    final func = _lib.lookupFunction<NativeClassCallbackFn0<ffi.Int32>, ClassCallbackFn0<int>>(
      _CFloatVectorFunctions.size,
    );

    return func(instance);
  }

  double _norm(Instance instance) {
    final func = _lib.lookupFunction<NativeClassCallbackFn0<ffi.Double>, ClassCallbackFn0<double>>(
      _CFloatVectorFunctions.norm,
    );

    return func(instance);
  }

  double _normL1(Instance instance) {
    final func = _lib.lookupFunction<NativeClassCallbackFn0<ffi.Double>, ClassCallbackFn0<double>>(
      _CFloatVectorFunctions.normL1,
    );

    return func(instance);
  }

  double _maxAbs(Instance instance) {
    final func = _lib.lookupFunction<NativeClassCallbackFn0<ffi.Float>, ClassCallbackFn0<double>>(
      _CFloatVectorFunctions.maxAbs,
    );

    return func(instance);
  }

  double _getValue(Instance instance, int index) {
    final func = _lib
        .lookupFunction<NativeClassCallbackFn1<ffi.Int, ffi.Float>, ClassCallbackFn1<int, double>>(
      _CFloatVectorFunctions.getValue,
    );

    return func(instance, index);
  }

  void _setValue(Instance instance, int index, double value) {
    final func = _lib.lookupFunction<NativeClassCallbackFn2<ffi.Int, ffi.Float, ffi.Void>,
        ClassCallbackFn2<int, double, void>>(
      _CFloatVectorFunctions.setValue,
    );

    return func(instance, index, value);
  }

  FloatVectorDesc _desc(Instance instance) {
    final func = _lib
        .lookupFunction<NativeClassCallbackFn0<FloatVectorDesc>, ClassCallbackFn0<FloatVectorDesc>>(
      _CFloatVectorFunctions.getDesc,
    );

    return func(instance);
  }

  void _nullify(Instance instance) {
    final func = _lib.lookupFunction<NativeClassCallbackFn0<ffi.Void>, ClassCallbackFn0<void>>(
      _CFloatVectorFunctions.nullify,
    );

    return func(instance);
  }

  ffi.Pointer<ffi.Float> _getPtr(Instance instance) {
    final func = _lib.lookupFunction<NativeClassCallbackFn0<ffi.Pointer<ffi.Float>>,
        ClassCallbackFn0<ffi.Pointer<ffi.Float>>>(
      _CFloatVectorFunctions.getPtr,
    );

    return func(instance);
  }

  ffi.Pointer<ffi.Void> _sparseVector(Instance instance) {
    final func = _lib.lookupFunction<NativeClassCallbackFn0<ffi.Pointer<ffi.Void>>,
        ClassCallbackFn0<ffi.Pointer<ffi.Void>>>(
      _CFloatVectorFunctions.sparseVector,
    );

    return func(instance);
  }
}
