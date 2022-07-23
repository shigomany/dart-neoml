import 'dart:ffi' as ffi;

import 'package:dart_neoml/dart_neoml.dart';
import 'package:dart_neoml/src/common/base.dart';
import 'package:dart_neoml/src/neoml/float_vector_desc/float_vector_desc.dart';
import 'package:meta/meta.dart';

import '../../libraries/libraries.dart';

part 'functions.dart';
part 'native_float_vector.dart';

/// {@macro neoml.FloatVector}
/// {@category neoml}
class FloatVector with _NativeFloatVector implements IFloatVector {
  /// {@template neoml.FloatVector}
  /// Creates a vector of size length from the given sparse vector.
  ///
  /// *the features that are not present in sparse vector are set to 0F*
  /// {@endtemplate}
  FloatVector.fromSparseVector({
    required int size,
    required SparseFloatVector vector,
  }) : _instance = _NativeFloatVector._fromSpareVector(size, vector);

  FloatVector({
    required int size,
    required double initial,
  }) : _instance = _NativeFloatVector._init(size, initial);

  FloatVector.fromVectorDesc({
    required int size,
    required FloatVectorDesc desc,
  }) : _instance = _NativeFloatVector._fromVectorDesc(size, desc);

  FloatVector.fromList(Iterable<double> values)
      : _instance = _NativeFloatVector._fromList(values);

  @internal
  FloatVector.fromInstance(Instance instance) : _instance = instance;

  final Instance _instance;

  @override
  Instance get instance => _instance;

  /// Check is null C pointer
  bool get isNull => _isNull(_instance);

  int get size => _size(_instance);

  double get norm => _norm(_instance);

  double get normL1 => _normL1(_instance);

  double get maxAbs => _maxAbs(_instance);

  double operator [](int index) => _getValue(_instance, index);

  void operator []=(int index, double value) =>
      _setValue(_instance, index, value);

  List<double> get sourceValues =>
      _getPtr(_instance).asTypedList(size).toList();

  void nullify() => _nullify(_instance);

  @experimental
  FloatVectorDesc get desc => _desc(_instance);

  @experimental
  SparseFloatVector get sparseVector =>
      SparseFloatVector.fromInstance(_sparseVector(_instance));

  @override
  String toString() {
    return 'FloatVector(size: $size, norm: $norm, normL1: $normL1, '
        'isNull: $isNull, maxAbs: $maxAbs)';
  }
}
