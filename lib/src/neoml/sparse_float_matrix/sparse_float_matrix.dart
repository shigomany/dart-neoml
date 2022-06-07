import 'dart:ffi' as ffi;
import 'package:collection/collection.dart';
import 'package:dart_neoml/src/common/base.dart';
import 'package:dart_neoml/src/common/extensions.dart';
import 'package:dart_neoml/src/neoml/sparse_float_vector/sparse_float_vector.dart';
import 'package:ffi/ffi.dart';

import '../../functions/functions.dart';
import '../../libraries/libraries.dart';

part 'functions.dart';
part 'native.dart';

/// A sparse matrix
///
/// Any value that is not specified is 0
class SparseFloatMatrix implements ClassInstance {
  final Instance _instance;

  @override
  Instance get instance => _instance;

  SparseFloatMatrix.empty() : _instance = _initEmpty();

  SparseFloatMatrix({
    required int width,
    int rowsBufferSize = 0,
    int elementsBufferSize = 0,
  }) : _instance = _init(width, rowsBufferSize, elementsBufferSize);

  SparseFloatMatrix.fromDesc({
    required FloatMatrixDesc desc,
  }) : _instance = _initFromDesc(desc);

  static ffi.DynamicLibrary get _lib => Libraries.instance.neoML;

  static Instance _init(int width, int rowsBufferSize, int elementsBufferSize) =>
      _lib.lookupFunction<ConstructorFFI3<ffi.Int32, ffi.Int32, ffi.Int32>,
              Constructor3<int, int, int>>(_CSparseFloatMatrixFunctinos.init)(
          width, rowsBufferSize, elementsBufferSize);

  static Instance _initEmpty() => _lib
      .lookupFunction<EmptyConstructor, EmptyConstructor>(_CSparseFloatMatrixFunctinos.initEmpty)();

  static Instance _initFromDesc(FloatMatrixDesc floatVectorDesc) =>
      _lib.lookupFunction<ConstructorFFI1<FloatMatrixDesc>, Constructor1<FloatMatrixDesc>>(
          _CSparseFloatMatrixFunctinos.initDesc)(floatVectorDesc);

  // ffi.Pointer<FloatMatrixDesc> copyOnWrite() => _lib.lookupFunction<
  //     NativeClassCallbackFn0<ffi.Pointer<FloatVectorDesc>>,
  //     Callback0<ffi.Pointer<FloatVectorDesc>>>(_CSparseFloatMatrixFunctinos.copyOnWrite)(_instance);

  FloatMatrixDesc get desc => _lib.lookupFunction<NativeClassCallbackFn0<FloatMatrixDesc>,
      ClassCallbackFn0<FloatMatrixDesc>>(_CSparseFloatMatrixFunctinos.getDesc)(_instance);

  int get height => _lib.lookupFunction<NativeClassCallbackFn0<ffi.Int32>, ClassCallbackFn0<int>>(
      _CSparseFloatMatrixFunctinos.getHeight)(_instance);

  int get width => _lib.lookupFunction<NativeClassCallbackFn0<ffi.Int32>, ClassCallbackFn0<int>>(
      _CSparseFloatMatrixFunctinos.getWidth)(_instance);

  void growInRows(int rowsCount) =>
      _lib.lookupFunction<NativeClassCallbackFn1<ffi.Int32, ffi.Void>, ClassCallbackFn1<int, void>>(
          _CSparseFloatMatrixFunctinos.growInRows)(_instance, rowsCount);

  void growInElements(int elementsCount) =>
      _lib.lookupFunction<NativeClassCallbackFn1<ffi.Int32, ffi.Void>, ClassCallbackFn1<int, void>>(
          _CSparseFloatMatrixFunctinos.growInElements)(_instance, elementsCount);

  void addRowVector(SparseFloatVector vector) => _lib
      .lookupFunction<NativeClassCallbackFn1<Instance, ffi.Void>, ClassCallbackFn1<Instance, void>>(
          _CSparseFloatMatrixFunctinos.addRowVector)(_instance, vector.instance);

  void addRowDesc(FloatVectorDesc desc) => _lib.lookupFunction<
          NativeClassCallbackFn1<FloatVectorDesc, ffi.Void>,
          ClassCallbackFn1<FloatVectorDesc, void>>(_CSparseFloatMatrixFunctinos.addRowDesc)(
      _instance, desc);

  FloatVectorDesc getRowAt(int index) => _lib.lookupFunction<
          NativeClassCallbackFn1<ffi.Int32, FloatVectorDesc>,
          ClassCallbackFn1<int, FloatVectorDesc>>(_CSparseFloatMatrixFunctinos.getRow)(
      _instance, index);
}
