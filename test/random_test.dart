import 'package:dart_neoml/dart_neoml.dart';
import 'package:test/test.dart';

void main() {
  group('Random C++ class.', () {
    test('Initialization', () {
      expect(() => Random(), returnsNormally);
    });

    test('Normal', () {
      final rnd = Random(seed: 42);
      expect(rnd.normal(mean: 1, sigma: 2).clamp(2, 2.15), 2.15);
    });

    test('Normal different values', () {
      final rnd = Random(seed: 42);
      final actualFirst = rnd.normal(mean: 1, sigma: 2);
      final actualSecond = rnd.normal(mean: 1, sigma: 2);
      final difference = (actualFirst - actualSecond).abs();

      expect(difference > 0, isTrue);
    });

    test('Uniform', () {
      final rnd = Random(seed: 42);
      expect(rnd.uniform(min: 1, max: 100).toInt(), 73);
    });

    test('Uniform different values', () {
      final rnd = Random(seed: 42);
      final actualFirst = rnd.uniform(min: 1, max: 100).toInt();
      final actualSecond = rnd.uniform(min: 1, max: 100).toInt();
      final difference = (actualFirst - actualSecond).abs();

      expect(difference > 0, isTrue);
    });

    test('Reset', () {
      final rnd = Random(seed: 42);
      final actualFirst = rnd.uniform(min: 1, max: 100).toInt();
      rnd.reset(42);
      final actualSecond = rnd.uniform(min: 1, max: 100).toInt();
      final difference = (actualFirst - actualSecond).abs();

      expect(difference == 0, isTrue);
    });

    test('Negative seed', () {
      expect(() => Random(seed: -3), throwsA((e) => e is ArgumentError));
    });
  });
}
