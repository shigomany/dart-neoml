import 'package:dart_neoml/src/neoml/float_vector_desc/float_vector_desc.dart';
import 'package:dart_neoml/src/neoml/sparse_float_matrix/sparse_float_matrix.dart';
import 'package:test/test.dart';

void main() {
  group('FloatMatrixDesc.', () {
    late final List<List<double>> source;
    late FloatMatrixDesc testSparseDesc;

    setUp(() {
      testSparseDesc = FloatMatrixDesc.init(
        height: 4,
        width: 7,
        columns: [1, 2, 3, 6, 3, 5],
        values: [1, 2, 1, 1, 1, 3],
        pointerBegin: [0, 1, 1, 4],
        pointerEnd: [1, 4, 1, 6],
      );
      source = [
        [0, 1, 0, 0, 0, 0, 0],
        [0, 0, 2, 1, 0, 0, 1],
        [0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 1, 0, 3, 0],
      ];
    });

    test('Get row', () {
      for (var i = 0; i < source.length; i++) {
        final actual = testSparseDesc.getRowAt(i);
        final matcher = FloatVectorDesc.fromVector(
            source[i].map((e) => e.toDouble()).toList());
        expect(actual, matcher);
      }
    });
  });
}
