part of 'step_definition.dart';

typedef SpinnerPrompt = String Function(bool done);
typedef VoidCallback = void Function();
typedef FutureCallback = Future<void> Function();

/// Interface for general step definitions
abstract class StepDefinition {
  String get module;

  Future<void> step();

  /// Help function which print [value] with [module]
  String message(String value) => '[$module] $value';
}
