import 'dart:ffi' as ffi;

import 'package:dart_neoml/dart_neoml.dart';
import 'package:dart_neoml/src/common/base.dart';

import '../../libraries/libraries.dart';

part 'functions.dart';

/// Stores all data in memory
/// {@category neoml}
class MemoryProblem implements ClassInstance {
  final Instance _instance;

  @override
  Instance get instance => _instance;

  /// {@template neoml.MemoryProblem}
  /// Creates memory problem where each vector has [featureCount] elements,
  /// and each vector belongs to the one of the [classCount] classes.
  ///
  /// If [rowsBufferSize] and [elementsBufferSize] are greater than zero
  /// and the total number of vectors is not greater than [rowsBufferSize]
  /// and the total number of non-zero elements across all vectors is not greater than [elementsBufferSize]
  /// then it's guaranteed that there will be no additional allocations during the [add] calls.
  /// {@endtemplate}
  MemoryProblem({
    required int featureCount,
    required int classCount,
    int rowsBufferSize = 0,
    int elementsBufferSize = 0,
  }) : _instance = _init(featureCount, classCount, rowsBufferSize, elementsBufferSize);

  MemoryProblem.empty() : _instance = _initEmpty();

  static ffi.DynamicLibrary get _lib => Libraries.instance.neoML;

  static Instance _init(
    int featureCount,
    int classCount,
    int rowsBufferSize,
    int elementsBufferSize,
  ) {
    assert(featureCount > 0, 'featuresCount must be more than 0');
    assert(classCount > 0, 'classCount must be more than 0');
    assert(rowsBufferSize >= 0, 'rowsBufferSize must be at least 0');
    assert(elementsBufferSize >= 0, 'elementsBufferSize must be at least 0');

    final constructor = _lib.lookupFunction<
        ConstructorFFI4<ffi.Int32, ffi.Int32, ffi.Int32, ffi.Int32>,
        Constructor4<int, int, int, int>>(
      _CMemoryProblemFunctions.init,
    );

    return constructor(featureCount, classCount, rowsBufferSize, elementsBufferSize);
  }

  static Instance _initEmpty() {
    final constructor = _lib.lookupFunction<EmptyConstructor, EmptyConstructor>(
      _CMemoryProblemFunctions.initEmpty,
    );

    return constructor();
  }

  /// Adds a [SparseFloatVector] to the set
  void addSparseVector({
    required SparseFloatVector vector,
    required int classNumber,
    double weight = 0.0,
  }) =>
      _lib.lookupFunction<
                  NativeClassCallbackFn3<ffi.Pointer<ffi.Void>, ffi.Int32, ffi.Double, ffi.Void>,
                  ClassCallbackFn3<ffi.Pointer<ffi.Void>, int, double, void>>(
              _CMemoryProblemFunctions.addSparseFloatVector)(
          _instance, vector.instance, classNumber, weight);

  /// Adds a vector to the set
  void addVectorDesc({
    required FloatVectorDesc vector,
    required int classNumber,
    double weight = 0.0,
  }) =>
      _lib.lookupFunction<NativeClassCallbackFn3<FloatVectorDesc, ffi.Int32, ffi.Double, ffi.Void>,
              ClassCallbackFn3<FloatVectorDesc, int, double, void>>(
          _CMemoryProblemFunctions.addFloatDesc)(
        _instance,
        vector,
        classNumber,
        weight,
      );

  /// Gets a vector from the set
  FloatVectorDesc getVectorAt(int index) => _lib.lookupFunction<
          NativeClassCallbackFn1<ffi.Int32, FloatVectorDesc>,
          ClassCallbackFn1<int, FloatVectorDesc>>(_CMemoryProblemFunctions.getVector)(
        _instance,
        index,
      );

  /// Sets the feature type
  void setFeatureType(int index, bool isDiscrete) => _lib.lookupFunction<
          NativeClassCallbackFn2<ffi.Int32, ffi.Bool, ffi.Void>,
          ClassCallbackFn2<int, bool, void>>(_CMemoryProblemFunctions.setFeatureType)(
        _instance,
        index,
        isDiscrete,
      );

  /// Sets the feature type
  void setDiscretizationValue(int index, int value) => _lib.lookupFunction<
          NativeClassCallbackFn2<ffi.Int32, ffi.Int32, ffi.Void>,
          ClassCallbackFn2<int, int, void>>(_CMemoryProblemFunctions.setDiscretizationValue)(
        _instance,
        index,
        value,
      );

  /// Sets the vector weight
  void setVectorWeight(int index, double weight) => _lib.lookupFunction<
          NativeClassCallbackFn2<ffi.Int32, ffi.Float, ffi.Void>,
          ClassCallbackFn2<int, double, void>>(_CMemoryProblemFunctions.setVectorWeight)(
        _instance,
        index,
        weight,
      );

  /// Sets the vector class
  void setClass(int index, int newClass) => _lib.lookupFunction<
          NativeClassCallbackFn2<ffi.Int32, ffi.Int32, ffi.Void>,
          ClassCallbackFn2<int, int, void>>(_CMemoryProblemFunctions.setClass)(
        _instance,
        index,
        newClass,
      );

  /// The number of classes
  int get classCount =>
      _lib.lookupFunction<NativeClassCallbackFn0<ffi.Int32>, ClassCallbackFn0<int>>(
          _CMemoryProblemFunctions.getClassCount)(_instance);

  /// The number of features
  int get featuresCount =>
      _lib.lookupFunction<NativeClassCallbackFn0<ffi.Int32>, ClassCallbackFn0<int>>(
          _CMemoryProblemFunctions.getFeatureCount)(_instance);

  /// Indicates if the specified feature is discrete
  bool get isDiscreteFeature =>
      _lib.lookupFunction<NativeClassCallbackFn0<ffi.Bool>, ClassCallbackFn0<bool>>(
          _CMemoryProblemFunctions.isDiscreteFeature)(_instance);

  /// The number of vectors
  int get vectorCount =>
      _lib.lookupFunction<NativeClassCallbackFn0<ffi.Int32>, ClassCallbackFn0<int>>(
          _CMemoryProblemFunctions.getVectorCount)(_instance);

  /// The correct class number for a vector with a given index from 0 to [vectorCount]
  int getClassAt(int index) =>
      _lib.lookupFunction<NativeClassCallbackFn1<ffi.Int32, ffi.Int32>, ClassCallbackFn1<int, int>>(
          _CMemoryProblemFunctions.getClass)(_instance, index);

  /// Gets all input vectors as a matrix of size [vectorCount] x [featuresCount]
  FloatMatrixDesc get matrix => _lib.lookupFunction<NativeClassCallbackFn0<FloatMatrixDesc>,
      ClassCallbackFn0<FloatMatrixDesc>>(_CMemoryProblemFunctions.getMatrix)(_instance);

  /// The vector weight
  double getVectorWeightAt(int index) => _lib.lookupFunction<
      NativeClassCallbackFn1<ffi.Int32, ffi.Double>,
      ClassCallbackFn1<int, double>>(_CMemoryProblemFunctions.getVectorWeight)(_instance, index);

  /// The sampling value.
  ///
  /// For discrete features, it is reasonable to set this value to
  /// the number of different values the feature can take
  int getDiscretizationValueAt(int index) =>
      _lib.lookupFunction<NativeClassCallbackFn1<ffi.Int32, ffi.Int32>, ClassCallbackFn1<int, int>>(
          _CMemoryProblemFunctions.getDiscretizationValue)(_instance, index);

  /// The correct class in case of binary classification: +1 or -1
  int getBinaryClass(int index) => _lib
      .lookupFunction<NativeClassCallbackFn1<ffi.Int32, ffi.Double>, ClassCallbackFn1<int, double>>(
          _CMemoryProblemFunctions.getBinaryClass)(_instance, index)
      .toInt();
}
