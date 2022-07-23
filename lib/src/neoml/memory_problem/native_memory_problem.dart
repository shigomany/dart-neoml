part of 'memory_problem.dart';

mixin _NativeMemoryProblem {
  static ffi.DynamicLibrary get _lib => Libraries.instance.neoML;

  static Instance init(
    int featureCount,
    int classCount,
    int rowsBufferSize,
    int elementsBufferSize,
  ) {
    if (featureCount <= 0) {
      throw ArgumentError('The value `featuresCount` must be more than 0');
    }
    if (classCount <= 0) {
      throw ArgumentError('The value `classCount` must be more than 0');
    }
    if (rowsBufferSize < 0) {
      throw ArgumentError('The value `rowsBufferSize` must be at least 0');
    }
    if (elementsBufferSize < 0) {
      throw ArgumentError('The value `elementsBufferSize` must be at least 0');
    }

    final constructor = _lib.lookupFunction<
        ConstructorFFI4<ffi.Int32, ffi.Int32, ffi.Int32, ffi.Int32>,
        Constructor4<int, int, int, int>>(
      _CMemoryProblemFunctions.init,
    );

    return constructor(
        featureCount, classCount, rowsBufferSize, elementsBufferSize);
  }

  void _addSparseVector(
    Instance instance,
    SparseFloatVector vector,
    int classNumber, [
    double weight = 0.0,
  ]) {
    final func = _lib.lookupFunction<
            NativeClassCallbackFn3<ffi.Pointer<ffi.Void>, ffi.Int32, ffi.Double,
                ffi.Void>,
            ClassCallbackFn3<ffi.Pointer<ffi.Void>, int, double, void>>(
        _CMemoryProblemFunctions.addSparseFloatVector);

    return func(instance, vector.instance, classNumber, weight);
  }

  void _addVectorDesc(
    Instance instance,
    FloatVectorDesc vector,
    int classNumber, [
    double weight = 0.0,
  ]) {
    final func = _lib.lookupFunction<
            NativeClassCallbackFn3<FloatVectorDesc, ffi.Int32, ffi.Double,
                ffi.Void>,
            ClassCallbackFn3<FloatVectorDesc, int, double, void>>(
        _CMemoryProblemFunctions.addFloatDesc);

    return func(instance, vector, classNumber, weight);
  }

  FloatVectorDesc _getVectorAt(Instance instance, int index) {
    final func = _lib.lookupFunction<
            NativeClassCallbackFn1<ffi.Int32, FloatVectorDesc>,
            ClassCallbackFn1<int, FloatVectorDesc>>(
        _CMemoryProblemFunctions.getVector);

    return func(instance, index);
  }

  void _setFeatureType(Instance instance, int index, bool isDiscrete) {
    final func = _lib.lookupFunction<
            NativeClassCallbackFn2<ffi.Int32, ffi.Bool, ffi.Void>,
            ClassCallbackFn2<int, bool, void>>(
        _CMemoryProblemFunctions.setFeatureType);

    return func(instance, index, isDiscrete);
  }

  void _setDiscretizationValue(Instance instance, int index, int value) {
    final func = _lib.lookupFunction<
            NativeClassCallbackFn2<ffi.Int32, ffi.Int32, ffi.Void>,
            ClassCallbackFn2<int, int, void>>(
        _CMemoryProblemFunctions.setDiscretizationValue);

    return func(instance, index, value);
  }

  void _setVectorWeight(Instance instance, int index, double weight) {
    final func = _lib.lookupFunction<
            NativeClassCallbackFn2<ffi.Int32, ffi.Float, ffi.Void>,
            ClassCallbackFn2<int, double, void>>(
        _CMemoryProblemFunctions.setVectorWeight);

    return func(instance, index, weight);
  }

  void _setClass(Instance instance, int index, int newClass) {
    final func = _lib.lookupFunction<
        NativeClassCallbackFn2<ffi.Int32, ffi.Int32, ffi.Void>,
        ClassCallbackFn2<int, int, void>>(_CMemoryProblemFunctions.setClass);

    return func(instance, index, newClass);
  }

  int _classCount(Instance instance) {
    final func = _lib.lookupFunction<NativeClassCallbackFn0<ffi.Int32>,
        ClassCallbackFn0<int>>(_CMemoryProblemFunctions.getClassCount);

    return func(instance);
  }

  int _featuresCount(Instance instance) {
    final func = _lib.lookupFunction<NativeClassCallbackFn0<ffi.Int32>,
        ClassCallbackFn0<int>>(_CMemoryProblemFunctions.getFeatureCount);

    return func(instance);
  }

  bool _isDiscreteFeature(Instance instance) {
    final func = _lib.lookupFunction<NativeClassCallbackFn0<ffi.Bool>,
        ClassCallbackFn0<bool>>(_CMemoryProblemFunctions.isDiscreteFeature);

    return func(instance);
  }

  int _vectorCount(Instance instance) {
    final func = _lib.lookupFunction<NativeClassCallbackFn0<ffi.Int32>,
        ClassCallbackFn0<int>>(_CMemoryProblemFunctions.getVectorCount);

    return func(instance);
  }

  int _getClassAt(Instance instance, int index) {
    final func = _lib.lookupFunction<
        NativeClassCallbackFn1<ffi.Int32, ffi.Int32>,
        ClassCallbackFn1<int, int>>(_CMemoryProblemFunctions.getClass);

    return func(instance, index);
  }

  FloatMatrixDesc _matrix(Instance instance) {
    final func = _lib.lookupFunction<NativeClassCallbackFn0<FloatMatrixDesc>,
        ClassCallbackFn0<FloatMatrixDesc>>(_CMemoryProblemFunctions.getMatrix);

    return func(instance);
  }

  double _getVectorWeightAt(Instance instance, int index) {
    final func = _lib.lookupFunction<
            NativeClassCallbackFn1<ffi.Int32, ffi.Double>,
            ClassCallbackFn1<int, double>>(
        _CMemoryProblemFunctions.getVectorWeight);

    return func(instance, index);
  }

  int _getDiscretizationValueAt(Instance instance, int index) {
    final func = _lib.lookupFunction<
            NativeClassCallbackFn1<ffi.Int32, ffi.Int32>,
            ClassCallbackFn1<int, int>>(
        _CMemoryProblemFunctions.getDiscretizationValue);

    return func(instance, index);
  }

  int _getBinaryClass(Instance instance, int index) {
    final func = _lib.lookupFunction<
        NativeClassCallbackFn1<ffi.Int32, ffi.Double>,
        ClassCallbackFn1<int, double>>(_CMemoryProblemFunctions.getBinaryClass);

    return func(instance, index).toInt();
  }
}
