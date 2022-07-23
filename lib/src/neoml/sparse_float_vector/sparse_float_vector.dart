import 'dart:ffi' as ffi;

import 'package:dart_neoml/dart_neoml.dart';
import 'package:dart_neoml/src/common/base.dart';
import 'package:meta/meta.dart';

import '../../libraries/libraries.dart';
import '../float_vector_desc/float_vector_desc.dart';

part 'functions.dart';
part 'native_sparse_float_vector.dart';

/// {@macro neoml.SparseFloatVector}
/// {@category neoml}
class SparseFloatVector with _NativeSparseFloatVector implements IFloatVector {
  /// {@template neoml.SparseFloatVector}
  /// Sparse float vector.
  ///
  ///	Descirption
  /// {@endtemplate}
  SparseFloatVector({
    int bufferSize = 32,
  }) : _instance = _NativeSparseFloatVector.initBufferSize(bufferSize);

  SparseFloatVector.empty() : _instance = _NativeSparseFloatVector.initEmpty();

  @internal
  SparseFloatVector.fromInstance(Instance instance) : _instance = instance;

  SparseFloatVector.fromDesc({
    required FloatVectorDesc desc,
  }) : _instance = _NativeSparseFloatVector.initFloatVectorDesc(desc);

  Instance _instance;

  @override
  Instance get instance => _instance;

  FloatVectorDesc get desc => _desc(_instance);

  int get numberOfElements => _numberOfElements(_instance);

  double get norm => _norm(_instance);

  double get normL1 => _normL1(_instance);

  double get maxAbs => _maxAbs(_instance);

  /// Sets all values to 0
  void fillZeros() => _fillZeros(_instance);

  void addVector(SparseFloatVector vector) {
    _instance = _add(_instance, vector);
  }

  void addDesc(FloatVectorDesc desc) {
    _instance = _addDesc(_instance, desc);
  }

  double operator [](int index) => _getAt(_instance, index);

  void operator []=(int index, double value) => _setAt(_instance, index, value);
}
