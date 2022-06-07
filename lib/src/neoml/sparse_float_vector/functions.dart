part of 'sparse_float_vector.dart';

// This class provides name functions in C dynamic library for class `CFloatVectorDesc`
class _CFloatVectorDescFunctinos {
  static const init = 'CFloatVectorDescInit';

  const _CFloatVectorDescFunctinos._();
}

class _CSparseFloatVectorFunctinos {
  // --- Constructors --- //

  static const initEmpty = 'CSparseFloatVectorInitEmpty';

  static const initBufferSize = 'CSparseFloatVectorInitBufferSize';

  static const initFloatVector = 'CSparseFloatVectorInitFloatVector';

  // --- Constructors --- //

  // --- Functions --- //

  static const copyOnWrite = 'CSparseFloatVectorCopyOnWrite';

  static const getDesc = 'CSparseFloatVectorGetDesc';

  static const numberOfElements = 'CSparseFloatVectorNumberOfElements';

  static const norm = 'CSparseFloatVectorNorm';

  static const normL1 = 'CSparseFloatVectorNormL1';

  static const maxAbs = 'CSparseFloatVectorMaxAbs';

  static const setAt = 'CSparseFloatVectorSetAt';

  static const getValue = 'CSparseFloatVectorGetValue';

  static const nullify = 'CSparseFloatVectorNullify';

  // --- Functions --- //

  // --- Operations --- //

  static const equal = 'CSparseFloatVectorOpEqual';

  static const plusEqualSparse = 'CSparseFloatVectorOpPlusEqualSparse';

  static const minusEqualSparse = 'CSparseFloatVectorOpMinusEqualSparse';

  static const plusEqualDesc = 'CSparseFloatVectorOpPlusEqualDesc';

  static const minusEqualDesc = 'CSparseFloatVectorOpMinusEqualDesc';

  static const mulEqual = 'CSparseFloatVectorOpMulEqual';

  static const divEqual = 'CSparseFloatVectorOpDivEqual';

  // --- Operations --- //

  const _CSparseFloatVectorFunctinos._();
}
