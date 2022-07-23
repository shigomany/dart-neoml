part of 'classification_model.dart';

// This class provides name functions in C dynamic library for class `CClassificationModel`
class _IClassificationModelFunctions {
  static const getClassCount = 'IClassificationModelGetClassCount';

  static const classifyDesc = 'IClassificationModelClassifyDesc';

  static const classifySparse = 'IClassificationModelClassifySparseFloatVector';

  static const classifyFloatVector = 'IClassificationModelClassifyFloatVector';

  const _IClassificationModelFunctions._();
}
