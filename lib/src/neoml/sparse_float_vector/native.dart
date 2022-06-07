// ignore_for_file: non_constant_identifier_names

part of 'sparse_float_vector.dart';

/// A vector descriptor
///
/// If Indexes field is not set assume dense representation, otherwise assume sparse.
class FloatVectorDesc extends ffi.Struct {
  /// Size of vector
  @ffi.Int32()
  external int size;

  external ffi.Pointer<ffi.Int32> _indexes;

  external ffi.Pointer<ffi.Float> _values;

  /// Indexes of vector
  List<int> get indexes => _indexes.asTypedList(size);

  /// Values of vector
  List<double> get values => _values.asTypedList(size);

  static FloatVectorDesc init({
    required int size,
    required List<int> indexes,
    required List<double> values,
  }) {
    final ptrIndexes = indexes.toPointerInt32();
    final ptrValues = values.toPointerFloat();

    final struct = _createStructFn(size, ptrIndexes, ptrValues);
    // calloc.free(ptrIndexes);
    // calloc.free(ptrValues);

    return struct;
  }

  static FloatVectorDesc fromVector(List<double> vector) {
    final notZeros = vector
        .mapIndexed((index, element) => MapEntry(index, element))
        .where((element) => element.value > 0);
    final size = notZeros.length;
    final indexes = notZeros.map((e) => e.key);
    final ptrIndexes = indexes.toPointerInt32();
    final ptrValues = notZeros.map((e) => e.value).toPointerFloat();

    final struct = _createStructFn(size, ptrIndexes, ptrValues);
    // calloc.free(ptrIndexes);
    // calloc.free(ptrValues);
    return struct;
  }

  static FloatVectorDesc get empty =>
      _createStructFn(0, <int>[].toPointerInt32(), <double>[].toPointerFloat());

  static DartStructFn3<int, ffi.Pointer<ffi.Int32>, ffi.Pointer<ffi.Float>, FloatVectorDesc>
      get _createStructFn => Libraries.instance.neoML.lookupFunction<
              NativeStructFn3<ffi.Int32, ffi.Pointer<ffi.Int32>, ffi.Pointer<ffi.Float>,
                  FloatVectorDesc>,
              DartStructFn3<int, ffi.Pointer<ffi.Int32>, ffi.Pointer<ffi.Float>, FloatVectorDesc>>(
            _CFloatVectorDescFunctinos.init,
          );

  @override
  String toString() {
    return 'FloatVectorDesc(size: $size, indexes: $indexes, values: $values)';
  }

  @override
  int get hashCode =>
      size.hashCode ^
      const DeepCollectionEquality().hash(indexes) ^
      const DeepCollectionEquality().hash(values);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FloatVectorDesc &&
          other.size == size &&
          const DeepCollectionEquality().equals(other.indexes, indexes) &&
          const DeepCollectionEquality().equals(other.values, values);
}
