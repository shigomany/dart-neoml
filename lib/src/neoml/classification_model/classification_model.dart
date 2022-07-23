import 'dart:ffi' as ffi;

import 'package:dart_neoml/dart_neoml.dart';
import 'package:dart_neoml/src/common/base.dart';
import 'package:meta/meta.dart';

import '../../libraries/libraries.dart';
import '../float_vector_desc/float_vector_desc.dart';

part 'functions.dart';
part 'native_classification_model.dart';

/// Trained classifier model interface
/// {@category neoml}
class ClassificationModel
    with _NativeClassificationModel
    implements ClassInstance {
  @internal
  ClassificationModel.fromInstance(Instance instance) : _instance = instance;

  final Instance _instance;

  @override
  Instance get instance => _instance;

  /// The number of classes
  int get classCount => _getClassCount(_instance);

  /// {@template neoml.ClassificationModel.classify}
  /// Classifies the input vector and returns true if successful, false otherwise
  /// {@endtemplate}
  ClassificationResult classifyList(List<double> data) =>
      _classifyList(_instance, data);

  /// {@macro neoml.ClassificationModel.classify}
  ClassificationResult classifyVector(IFloatVector vector) =>
      _classifyVector(_instance, vector);

  /// {@macro neoml.ClassificationModel.classify}
  ClassificationResult classifyDesc(FloatVectorDesc desc) =>
      _classifyDesc(_instance, desc);

  @override
  String toString() => 'ClassificationModel(classCount: $classCount)';
}
