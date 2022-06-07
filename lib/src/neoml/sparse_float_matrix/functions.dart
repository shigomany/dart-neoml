part of 'sparse_float_matrix.dart';

class _CFloatMatrixDesc {
  static const init = 'CFloatMatrixDescInit';

  static const getRow = 'CFloatMatrixDescGetRow';

  const _CFloatMatrixDesc._();
}

class _CSparseFloatMatrixFunctinos {
  // --- Constructors --- //

  static const initEmpty = 'CSparseFloatMatrixInitEmpty';

  static const init = 'CSparseFloatMatrixInit';

  static const initDesc = 'CSparseFloatMatrixInitDesc';

  // --- Constructors --- //

  // --- Functions --- //

  // static const copyOnWrite = 'CSparseFloatMatrixCopyOnWrite';

  static const getDesc = 'CSparseFloatMatrixGetDesc';

  static const getHeight = 'CSparseFloatMatrixGetHeight';

  static const getWidth = 'CSparseFloatMatrixGetWidth';

  static const growInRows = 'CSparseFloatMatrixGrowInRows';

  static const growInElements = 'CSparseFloatMatrixGrowInElements';

  static const addRowVector = 'CSparseFloatMatrixAddRowVector';

  static const addRowDesc = 'CSparseFloatMatrixAddRowDesc';

  static const getRow = 'CSparseFloatMatrixGetRow';

  // --- Functions --- //

  const _CSparseFloatMatrixFunctinos._();
}
