import 'package:test/test.dart';

void main() {
  group('FloatVectorDesc.', () {
    late final List<List<double>> source;

    setUp(() {
      source = [
        [0, 1, 0, 0, 0, 0, 0],
        [0, 0, 2, 1, 0, 0, 1],
        [0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 1, 0, 3, 0],
      ];
    });

    test('Get row', () {
      for (var i = 0; i < source.length; i++) {
        // final actual = testSparseDesc.getRow(i);
        // final matcher = FloatVectorDesc.fromVector(source[i].map((e) => e.toDouble()).toList());
        // expect(actual, matcher);
      }
    });
  });
}
