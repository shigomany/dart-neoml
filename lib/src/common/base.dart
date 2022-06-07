import '../functions/functions.dart';
import 'package:meta/meta.dart';

/// Provides C++ class instance for Dart instance
abstract class ClassInstance {
  /// Instance C++ class
  @internal
  Instance get instance;
}
