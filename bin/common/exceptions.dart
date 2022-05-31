import 'dart:io';

/// {@macro common.exceptions.GlobalExecutable}
class GlobalExecutable implements Exception {
  /// Name of utility
  final String executable;

  final ProcessResult processResult;

  /// {@template common.exceptions.GlobalExecutable}
  /// Lack of a utility installed globally in the environment
  /// {@endtemplate}
  const GlobalExecutable({
    required this.executable,
    required this.processResult,
  });

  @override
  String toString() =>
      'Executable "$executable" not found in global enviroment variables.';
}

/// {@macro common.exceptions.LocalExecutable}
class LocalExecutable implements Exception {
  /// Name of utility
  final String executable;

  final ProcessResult processResult;

  /// The path where the executable file was started
  final String path;

  /// {@template common.exceptions.LocalExecutable}
  /// Lack of a utility installed localy [path]
  /// {@endtemplate}
  const LocalExecutable({
    required this.executable,
    required this.path,
    required this.processResult,
  });

  @override
  String toString() => 'Executable "$executable" not found in $path';
}

/// {@macro common.exceptions.NotSupportedGenerator}
class NotSupportedGenerator implements Exception {
  /// Name of project generator for CMake
  final String generatorName;

  /// {@template common.exceptions.NotSupportedGenerator}
  /// Error on unsupported project generators
  /// {@endtemplate}
  const NotSupportedGenerator({
    required this.generatorName,
  });

  @override
  String toString() =>
      '"$generatorName" - generator is not supported for the current platform (${Platform.operatingSystem}).';
}

class CommandExecute implements Exception {
  final ProcessResult processResult;

  const CommandExecute({
    required this.processResult,
  });

  @override
  String toString() =>
      'The command execution process ended with an error with code ${processResult.exitCode}';
}
