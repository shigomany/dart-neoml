import 'package:dart_neoml/src/neoml/float_vector/float_vector.dart';

void main() {
  // final rnd = Random();
  final vector = FloatVector.fromList([1, 2, 3]);
  final sparseVector = vector.sparseVector;

  print(sparseVector.numberOfElements);
}
