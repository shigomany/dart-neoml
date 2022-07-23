part of 'sparse_float_vector.dart';

mixin _NativeSparseFloatVector {
  static ffi.DynamicLibrary get _lib => Libraries.instance.neoML;

  @protected
  static Instance initBufferSize(int bufferSize) {
    final constructor =
        _lib.lookupFunction<ConstructorFFI1<ffi.Int32>, Constructor1<int>>(
            _CSparseFloatVectorFunctions.initBufferSize);

    return constructor(bufferSize);
  }

  @protected
  static Instance initEmpty() =>
      _lib.lookupFunction<EmptyConstructor, EmptyConstructor>(
          _CSparseFloatVectorFunctions.initEmpty)();

  @protected
  static Instance initFloatVectorDesc(FloatVectorDesc floatVectorDesc) {
    final constructor = _lib.lookupFunction<ConstructorFFI1<FloatVectorDesc>,
            Constructor1<FloatVectorDesc>>(
        _CSparseFloatVectorFunctions.initFloatVector);

    return constructor(floatVectorDesc);
  }

  void _fillZeros(Instance instance) => _lib.lookupFunction<
      NativeClassCallbackFn0<ffi.Void>,
      ClassCallbackFn0<void>>(_CSparseFloatVectorFunctions.nullify)(instance);

  void _setAt(Instance instance, int index, double value) {
    final func = _lib.lookupFunction<
            NativeClassCallbackFn2<ffi.Int32, ffi.Float, ffi.Void>,
            ClassCallbackFn2<int, double, void>>(
        _CSparseFloatVectorFunctions.setAt);

    return func(instance, index, value);
  }

  double _getAt(Instance instance, int index) {
    final func = _lib.lookupFunction<
        NativeClassCallbackFn1<ffi.Int32, ffi.Float>,
        ClassCallbackFn1<int, double>>(_CSparseFloatVectorFunctions.getValue);

    return func(instance, index);
  }

  Instance _addDesc(Instance instance, FloatVectorDesc desc) {
    final func = _lib.lookupFunction<
            NativeClassCallbackFn1<FloatVectorDesc, Instance>,
            ClassCallbackFn1<FloatVectorDesc, Instance>>(
        _CSparseFloatVectorFunctions.plusEqualDesc);

    return func(instance, desc);
  }

  Instance _add(Instance instance, SparseFloatVector other) {
    final func = _lib.lookupFunction<NativeClassCallbackFn1<Instance, Instance>,
            ClassCallbackFn1<Instance, Instance>>(
        _CSparseFloatVectorFunctions.plusEqualSparse);

    return func(instance, other._instance);
  }

  FloatVectorDesc _desc(Instance instance) {
    final func = _lib.lookupFunction<NativeClassCallbackFn0<FloatVectorDesc>,
            ClassCallbackFn0<FloatVectorDesc>>(
        _CSparseFloatVectorFunctions.getDesc);

    return func(instance);
  }

  int _numberOfElements(Instance instance) {
    final func = _lib.lookupFunction<NativeClassCallbackFn0<ffi.Int32>,
        ClassCallbackFn0<int>>(_CSparseFloatVectorFunctions.numberOfElements);

    return func(instance);
  }

  double _norm(Instance instance) {
    final func = _lib.lookupFunction<NativeClassCallbackFn0<ffi.Double>,
        ClassCallbackFn0<double>>(_CSparseFloatVectorFunctions.norm);

    return func(instance);
  }

  double _normL1(Instance instance) {
    final func = _lib.lookupFunction<NativeClassCallbackFn0<ffi.Double>,
        ClassCallbackFn0<double>>(_CSparseFloatVectorFunctions.normL1);

    return func(instance);
  }

  double _maxAbs(Instance instance) {
    final func = _lib.lookupFunction<NativeClassCallbackFn0<ffi.Float>,
        ClassCallbackFn0<double>>(_CSparseFloatVectorFunctions.maxAbs);

    return func(instance);
  }
}
