import 'dart:collection';

import '../functions/functions.dart';
import 'package:meta/meta.dart';

/// Provides C++ class instance for Dart instance
abstract class ClassInstance {
  /// Instance C++ class
  @internal
  Instance get instance;
}

/// Provides NeoML vector C++ classes for Dart Instance
abstract class IFloatVector implements ClassInstance {}

/// Provides NeoML vector C++ classes for Dart Instance
///
/// Based on [List]
abstract class IFloatVectorList with ListMixin<double> implements IFloatVector {
}
