part of 'memory_problem.dart';

// This class provides name functions in C dynamic library for class `CMemoryProblem`
class _CMemoryProblemFunctions {
  // -- Constructors -- //

  static const init = 'CMemoryProblemInit';

  // -- Constructors -- //

  // -- Functions -- //

  static const addFloatDesc = 'CMemoryProblemAddFloatDesc';

  static const addSparseFloatVector = 'CMemoryProblemAddSparseFloatVector';

  static const getVector = 'CMemoryProblemGetVector';

  static const setFeatureType = 'CMemoryProblemSetFeatureType';

  static const setDiscretizationValue = 'CMemoryProblemSetDiscretizationValue';

  static const setVectorWeight = 'CMemoryProblemSetVectorWeight';

  static const setClass = 'CMemoryProblemSetClass';

  static const getClassCount = 'CMemoryProblemGetClassCount';

  static const getFeatureCount = 'CMemoryProblemGetFeatureCount';

  static const isDiscreteFeature = 'CMemoryProblemIsDiscreteFeature';

  static const getVectorCount = 'CMemoryProblemGetVectorCount';

  static const getClass = 'CMemoryProblemGetClass';

  static const getMatrix = 'CMemoryProblemGetMatrix';

  static const getVectorWeight = 'CMemoryProblemGetVectorWeight';

  static const getDiscretizationValue = 'CMemoryProblemGetDiscretizationValue';

  static const getBinaryClass = 'CMemoryProblemGetBinaryClass';

  // -- Functions -- //

  const _CMemoryProblemFunctions._();
}
