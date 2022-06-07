part of 'float_vector.dart';

// This class provides name functions in C dynamic library for class `CFloatVector`
class _CFloatVectorFunctions {
  // --- Contructors --- //

  static const fromSparseVector = 'CFloatVectorFromSparseVector';

  static const fromVectorDesc = 'CFloatVectorFromVectorDesc';

  static const init = 'CFloatVectorInit';

  // --- Contructors --- //

  // --- Functions --- //

  static const isNull = 'CFloatVectorIsNull';

  static const size = 'CFloatVectorSize';

  static const norm = 'CFloatVectorNorm';

  static const normL1 = 'CFloatVectorNormL1';

  static const maxAbs = 'CFloatVectorMaxAbs';

  static const getValue = 'CFloatVectorGetValue';

  static const setValue = 'CFloatVectorSetValue';

  static const copyOnWrite = 'CFloatVectorCopyOnWrite';

  static const getDesc = 'CFloatVectorGetDesc';

  static const nullify = 'CFloatVectorNullify';

  static const getPtr = 'CFloatVectorGetPtr';

  static const sparseVector = 'CFloatVectorSparseVector';

  // --- Functions --- //

  const _CFloatVectorFunctions._();
}
