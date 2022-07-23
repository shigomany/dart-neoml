part of 'regression_model.dart';

mixin _NativeRegressionModel {
  static ffi.DynamicLibrary get _lib => Libraries.instance.neoML;

  double _predictVector(Instance instance, IFloatVector vector) {
    final func = _lib.lookupFunction<
        NativeClassCallbackFn1<Instance, ffi.Double>,
        ClassCallbackFn1<Instance, double>>(
      _getFunctionNameOf(vector),
    );

    return func(instance, vector.instance);
  }

  double _predictDesc(Instance instance, FloatVectorDesc desc) {
    final func = _lib.lookupFunction<
        NativeClassCallbackFn1<FloatVectorDesc, ffi.Double>,
        ClassCallbackFn1<FloatVectorDesc, double>>(
      _IRegressionModelFunctions.predictDesc,
    );

    return func(instance, desc);
  }

  double _predictList(Instance instance, List<double> data) {
    return _predictDesc(instance, FloatVectorDesc.fromVector(data));
  }

  String _getFunctionNameOf(IFloatVector vector) {
    if (vector is SparseFloatVector) {
      return _IRegressionModelFunctions.predictSparse;
    } else if (vector is FloatVector) {
      return _IRegressionModelFunctions.predictFloatVector;
    } else {
      throw ArgumentError(
        vector,
        'Type of vector ${vector.runtimeType} is not supported',
      );
    }
  }
}
