part of 'classification_model.dart';

mixin _NativeClassificationModel {
  static ffi.DynamicLibrary get _lib => Libraries.instance.neoML;

  int _getClassCount(Instance instance) {
    final func = _lib.lookupFunction<NativeClassCallbackFn0<ffi.Int32>,
        ClassCallbackFn0<int>>(
      _IClassificationModelFunctions.getClassCount,
    );

    return func(instance);
  }

  ClassificationResult _classifyVector(Instance instance, IFloatVector vector) {
    final func = _lib.lookupFunction<NativeClassCallbackFn1<Instance, Instance>,
        ClassCallbackFn1<Instance, Instance>>(
      _getFunctionNameOf(vector),
    );

    return ClassificationResult.fromInstance(func(instance, vector.instance));
  }

  ClassificationResult _classifyDesc(Instance instance, FloatVectorDesc desc) {
    final func = _lib.lookupFunction<
        NativeClassCallbackFn1<FloatVectorDesc, Instance>,
        ClassCallbackFn1<FloatVectorDesc, Instance>>(
      _IClassificationModelFunctions.classifyDesc,
    );

    return ClassificationResult.fromInstance(func(instance, desc));
  }

  ClassificationResult _classifyList(Instance instance, List<double> data) {
    return _classifyDesc(instance, FloatVectorDesc.fromVector(data));
  }

  String _getFunctionNameOf(IFloatVector vector) {
    if (vector is SparseFloatVector) {
      return _IClassificationModelFunctions.classifySparse;
    } else if (vector is FloatVector) {
      return _IClassificationModelFunctions.classifyFloatVector;
    } else {
      throw ArgumentError(
        vector,
        'Type of vector ${vector.runtimeType} is not supported',
      );
    }
  }
}
