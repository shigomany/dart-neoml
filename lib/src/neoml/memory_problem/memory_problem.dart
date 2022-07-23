import 'dart:ffi' as ffi;

import 'package:dart_neoml/dart_neoml.dart';
import 'package:dart_neoml/src/common/base.dart';
import 'package:meta/meta.dart';

import '../../libraries/libraries.dart';
import '../float_vector_desc/float_vector_desc.dart';

part 'functions.dart';
part 'native_memory_problem.dart';

/// {@macro neoml.MemoryProblem}
/// {@category neoml}
class MemoryProblem with _NativeMemoryProblem implements ClassInstance {
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
  }) : _instance = _NativeMemoryProblem.init(
          featureCount,
          classCount,
          rowsBufferSize,
          elementsBufferSize,
        );

  @internal
  MemoryProblem.fromInstance(Instance instance) : _instance = instance;

  final Instance _instance;

  @override
  Instance get instance => _instance;

  /// Adds a [SparseFloatVector] to the set
  void addSparseVector({
    required SparseFloatVector vector,
    required int classNumber,
    double weight = 0.0,
  }) =>
      _addSparseVector(_instance, vector, classNumber, weight);

  /// Adds a vector to the set
  void addVectorDesc({
    required FloatVectorDesc vector,
    required int classNumber,
    double weight = 0.0,
  }) =>
      _addVectorDesc(_instance, vector, classNumber, weight);

  /// Gets a vector from the set
  FloatVectorDesc getVectorAt(int index) => _getVectorAt(_instance, index);

  /// Sets the feature type
  void setFeatureType(int index, bool isDiscrete) =>
      _setFeatureType(_instance, index, isDiscrete);

  /// Sets the feature type
  void setDiscretizationValue(int index, int value) =>
      _setDiscretizationValue(_instance, index, value);

  /// Sets the vector weight
  void setVectorWeight(int index, double weight) =>
      _setVectorWeight(_instance, index, weight);

  /// Sets the vector class
  void setClass(int index, int newClass) =>
      _setClass(_instance, index, newClass);

  /// The number of classes
  int get classCount => _classCount(_instance);

  /// The number of features
  int get featuresCount => _featuresCount(_instance);

  /// Indicates if the specified feature is discrete
  bool get isDiscreteFeature => _isDiscreteFeature(_instance);

  /// The number of vectors
  int get vectorCount => _vectorCount(_instance);

  /// The correct class number for a vector with a given index from 0 to [vectorCount]
  int getClassAt(int index) => _getClassAt(_instance, index);

  /// Gets all input vectors as a matrix of size [vectorCount] x [featuresCount]
  FloatMatrixDesc get matrix => _matrix(_instance);

  /// The vector weight
  double getVectorWeightAt(int index) => _getVectorWeightAt(_instance, index);

  /// The sampling value.
  ///
  /// For discrete features, it is reasonable to set this value to
  /// the number of different values the feature can take
  int getDiscretizationValueAt(int index) =>
      _getDiscretizationValueAt(_instance, index);

  /// The correct class in case of binary classification: +1 or -1
  int getBinaryClass(int index) => _getBinaryClass(_instance, index);
}
