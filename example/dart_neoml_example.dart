import 'package:dart_neoml/dart_neoml.dart';

void main() {
  final rnd = Random(seed: 42);
  print(rnd.uniform(min: 1, max: 100));
  print(rnd.uniform(min: 1, max: 100));
  // SIGMOID в C++ передается хуево
  // final cls = LinearClassifier();
  // print(ss2.sigmoid);
  // print(ss.desc);
  // final rnd = Random();
}
