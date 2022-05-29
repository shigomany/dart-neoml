import 'package:dart_neoml/src/neoml/random/random.dart';

Future<void> main() async {
  final random = Random.timebased();

  print(random.normal(mean: 0, sigma: 10));
}
