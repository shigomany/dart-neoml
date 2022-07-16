import 'dart:ffi' as ffi;
import 'package:ffi/ffi.dart' as ffi;

import 'package:dart_neoml/dart_neoml.dart';
import 'package:dart_neoml/src/common/base.dart';
import 'package:meta/meta.dart';

import '../../libraries/libraries.dart';

part 'functions.dart';
part 'native_{{class_name.snakeCase()}}.dart';

/// {@macro neoml.{{class_name.pascalCase()}}}
/// {@category neoml}
class {{class_name.pascalCase()}}
    with _Native{{class_name.pascalCase()}}
    implements ClassInstance {
  /// {@template neoml.{{class_name.pascalCase()}}}
  /// {{class_name.sentenceCase()}}.
  ///
  ///	Descirption
  /// {@endtemplate}
  {{class_name.pascalCase()}}(double value) : 
    _instance = _Native{{class_name.pascalCase()}}.init(value);

  {{class_name.pascalCase()}}.empty() : 
    _instance = _Native{{class_name.pascalCase()}}.initEmpty();

  @internal
  {{class_name.pascalCase()}}.fromInstance(Instance instance)
      : _instance = instance;

  final Instance _instance;

  @override
  Instance get instance => _instance;

  double get value => _getValue(_instance);

  set value(double value) => _setValue(_instance, value);

  @override
  String toString() =>
      '{{class_name.pascalCase()}}(value: $value)';
}
