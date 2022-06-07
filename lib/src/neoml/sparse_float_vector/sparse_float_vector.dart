import 'dart:ffi' as ffi;
import 'package:collection/collection.dart';
import 'package:dart_neoml/src/common/extensions.dart';
import 'package:meta/meta.dart';

import '../../common/base.dart';
import '../../functions/functions.dart';
import '../../libraries/libraries.dart';

part 'functions.dart';
part 'native.dart';

class SparseFloatVector implements ClassInstance {
  final Instance _instance;

  @override
  Instance get instance => _instance;

  SparseFloatVector.empty() : _instance = _initEmpty();

  SparseFloatVector({
    int bufferSize = 32,
  }) : _instance = _initBufferSize(bufferSize);

  @internal
  SparseFloatVector.fromPointer(Instance ptr) : _instance = ptr;

  SparseFloatVector.fromDesc({
    required FloatVectorDesc desc,
  }) : _instance = _initFloatVectorDesc(desc);

  static Instance _initBufferSize(int bufferSize) =>
      Libraries.instance.neoML.lookupFunction<ConstructorFFI1<ffi.Int32>, Constructor1<int>>(
          _CSparseFloatVectorFunctinos.initBufferSize)(bufferSize);

  static Instance _initEmpty() => Libraries.instance.neoML
      .lookupFunction<EmptyConstructor, EmptyConstructor>(_CSparseFloatVectorFunctinos.initEmpty)();

  static Instance _initFloatVectorDesc(FloatVectorDesc floatVectorDesc) => Libraries.instance.neoML
      .lookupFunction<ConstructorFFI1<FloatVectorDesc>, Constructor1<FloatVectorDesc>>(
          _CSparseFloatVectorFunctinos.initFloatVector)(floatVectorDesc);

  ffi.Pointer<FloatVectorDesc> copyOnWrite() => Libraries.instance.neoML.lookupFunction<
          NativeClassCallbackFn0<ffi.Pointer<FloatVectorDesc>>,
          ClassCallbackFn0<ffi.Pointer<FloatVectorDesc>>>(_CSparseFloatVectorFunctinos.copyOnWrite)(
      _instance);

  FloatVectorDesc get desc => Libraries.instance.neoML
      .lookupFunction<NativeClassCallbackFn0<FloatVectorDesc>, ClassCallbackFn0<FloatVectorDesc>>(
          _CSparseFloatVectorFunctinos.getDesc)(_instance);

  int get numberOfElements => Libraries.instance.neoML
      .lookupFunction<NativeClassCallbackFn0<ffi.Int32>, ClassCallbackFn0<int>>(
          _CSparseFloatVectorFunctinos.numberOfElements)(_instance);

  double get norm => Libraries.instance.neoML
      .lookupFunction<NativeClassCallbackFn0<ffi.Double>, ClassCallbackFn0<double>>(
          _CSparseFloatVectorFunctinos.norm)(_instance);

  double get normL1 => Libraries.instance.neoML
      .lookupFunction<NativeClassCallbackFn0<ffi.Double>, ClassCallbackFn0<double>>(
          _CSparseFloatVectorFunctinos.normL1)(_instance);

  double get maxAbs => Libraries.instance.neoML
      .lookupFunction<NativeClassCallbackFn0<ffi.Float>, ClassCallbackFn0<double>>(
          _CSparseFloatVectorFunctinos.maxAbs)(_instance);

  void setAt(int index, double value) => Libraries.instance.neoML.lookupFunction<
          NativeClassCallbackFn2<ffi.Int32, ffi.Float, ffi.Void>,
          ClassCallbackFn2<int, double, void>>(_CSparseFloatVectorFunctinos.setAt)(
      _instance, index, value);

  double getValue(int index) => Libraries.instance.neoML
      .lookupFunction<NativeClassCallbackFn1<ffi.Int32, ffi.Float>, ClassCallbackFn1<int, double>>(
          _CSparseFloatVectorFunctinos.getValue)(_instance, index);

  /// Sets all values to 0
  void fillZeros() => Libraries.instance.neoML
      .lookupFunction<NativeClassCallbackFn0<ffi.Void>, ClassCallbackFn0<void>>(
          _CSparseFloatVectorFunctinos.nullify)(_instance);

  void addOtherSparseVector(SparseFloatVector other) {
    Libraries.instance.neoML.lookupFunction<NativeClassCallbackFn1<Instance, Instance>,
            ClassCallbackFn1<Instance, Instance>>(_CSparseFloatVectorFunctinos.plusEqualSparse)(
        _instance, other._instance);
  }

  void addOtherFloatDesc(FloatVectorDesc other) {
    Libraries.instance.neoML.lookupFunction<NativeClassCallbackFn1<FloatVectorDesc, Instance>,
            ClassCallbackFn1<FloatVectorDesc, Instance>>(
        _CSparseFloatVectorFunctinos.plusEqualDesc)(_instance, other);
  }

  double operator [](int index) => getValue(index);

  void operator []=(int index, double value) => setAt(index, value);
}
