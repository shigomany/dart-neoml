// ignore_for_file: non_constant_identifier_names

part of 'sparse_float_matrix.dart';

typedef _NativeConstructor = NativeStructFn6<ffi.Int32, ffi.Int32, ffi.Pointer<ffi.Int32>,
    ffi.Pointer<ffi.Float>, ffi.Pointer<ffi.Int32>, ffi.Pointer<ffi.Int32>, FloatMatrixDesc>;

typedef _DartConstructor = DartStructFn6<int, int, ffi.Pointer<ffi.Int32>, ffi.Pointer<ffi.Float>,
    ffi.Pointer<ffi.Int32>, ffi.Pointer<ffi.Int32>, FloatMatrixDesc>;

typedef _NativeGetRow = FloatVectorDesc Function(FloatMatrixDesc, ffi.Int32);
typedef _DartGetRow = FloatVectorDesc Function(FloatMatrixDesc, int);

/// {@template neoml.FloatMatrixDesc}
/// A matrix descriptor.
///
/// If Columns field is not set assume dense representation, otherwise assume sparse.
///
/// Note that PointerB and PointerE must be defined for both!
/// {@endtemplate}
class FloatMatrixDesc extends ffi.Struct {
  /// The matrix height
  @ffi.Int32()
  external int height;

  /// The matrix width
  @ffi.Int32()
  external int width;

  external ffi.Pointer<ffi.Int32> _columns;

  external ffi.Pointer<ffi.Float> _values;

  external ffi.Pointer<ffi.Int32> _pointerBegin;

  external ffi.Pointer<ffi.Int32> _pointerEnd;

  /// The columns array
  List<int> get columns => _columns.asTypedList(values.length).toList();

  /// Values of vector
  List<double> get values =>
      _values.asTypedList(height * width).where((element) => element > 0).toList();

  /// The array of indices for vector start in Columns/Values
  List<int> get pointerBegin => _pointerBegin.asTypedList(height).toList();

  /// The array of indices for vector end in Columns/Values
  List<int> get pointerEnd => _pointerEnd.asTypedList(height).toList();

  static FloatMatrixDesc init({
    required int height,
    required int width,
    required List<int> columns,
    required List<double> values,
    required List<int> pointerBegin,
    required List<int> pointerEnd,
  }) {
    final ptrColumns = columns.toPointerInt32();
    final ptrValues = values.toPointerFloat();
    final ptrPointerB = pointerBegin.toPointerInt32();
    final ptrPointerE = pointerEnd.toPointerInt32();
    final struct = _createStructFn(height, width, ptrColumns, ptrValues, ptrPointerB, ptrPointerE);

    return struct;
  }

  FloatVectorDesc getRowAt(int index) {
    final func = Libraries.instance.neoML.lookupFunction<_NativeGetRow, _DartGetRow>(
      _CFloatMatrixDesc.getRow,
    );

    return func(this, index);
  }

  static _DartConstructor get _createStructFn =>
      Libraries.instance.neoML.lookupFunction<_NativeConstructor, _DartConstructor>(
        _CFloatMatrixDesc.init,
      );

  void dispose() {
    calloc.free(_columns);
    calloc.free(_values);
    calloc.free(_pointerBegin);
    calloc.free(_pointerEnd);
  }

  @override
  int get hashCode =>
      width.hashCode ^
      height.hashCode ^
      const DeepCollectionEquality().hash(values) ^
      const DeepCollectionEquality().hash(columns) ^
      const DeepCollectionEquality().hash(pointerBegin) ^
      const DeepCollectionEquality().hash(pointerEnd);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is FloatMatrixDesc &&
            other.width == width &&
            other.height == height &&
            const DeepCollectionEquality().equals(other.values, other.values) &&
            const DeepCollectionEquality().equals(other.columns, columns) &&
            const DeepCollectionEquality().equals(other.pointerBegin, pointerBegin) &&
            const DeepCollectionEquality().equals(other.pointerEnd, pointerEnd);
  }

  // @override
  // String toString() {
  //   return 'FloatMatrixDesc(width: $width, height: $height, values: $values, '
  //       'columns: $columns, pointerBegin: $pointerBegin, pointerEnd: $pointerEnd)';
  // }
}
