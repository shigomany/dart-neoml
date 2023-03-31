part of 'step_definition.dart';

abstract class StepDefinitionExecutor extends StepDefinition {
  /// Show additional information in output
  bool get verbose;

  /// Printing beautiful error message
  void errorPrint({
    required String title,
    String? content,
  }) {
    print('');
    print(title.bgRed);
    if (content != null) {
      print('');
      print(content.red);
    }
  }

  Future<void> executeCommand({
    required String command,
    required SpinnerPrompt rightPrompt,
    String? workingDirectory,
    bool runInShell = false,
  }) async {
    print('');
    print('Executing command: '.yellow.italic +
        command.yellow +
        (workingDirectory == null
            ? ''
            : '\nIn directory: $workingDirectory'.yellow));
    print('');

    try {
      final configureSpinner = Spinner(
        icon: '🔨',
        leftPrompt: (done) => '',
        rightPrompt: rightPrompt,
      ).interact();
      final commandSplitted = command.split(' ');
      // C:\workingprojects\dart-neoml\vcpkg\bootstrap-vcpkg.bat
      final executorCommand = await Process.run(
        commandSplitted.first,
        commandSplitted.sublist(1),
        workingDirectory: workingDirectory,
        runInShell: runInShell,
        stderrEncoding: Utf8Codec(),
        stdoutEncoding: Utf8Codec(),
      );
      if (executorCommand.exitCode != 0) {
        throw CommandExecute(
          processResult: executorCommand,
        );
      }
      configureSpinner.done();
    } on CommandExecute catch (e) {
      reset();
      errorPrint(
        title: e.toString(),
        content: verbose ? e.processResult.stderr as String : null,
      );
      exit(e.processResult.exitCode);
    } on Object catch (e, s) {
      reset();
      errorPrint(
        title: e.toString(),
        content: verbose ? s.toString() : null,
      );
      exit(exitCode);
    }
  }

  Future<void> executeFunction({
    required FutureCallback method,
    required SpinnerPrompt rightPrompt,
  }) async {
    try {
      final executableSpinner = Spinner(
        icon: '⚙️',
        leftPrompt: (done) => '',
        rightPrompt: rightPrompt,
      ).interact();

      await method();
      // await Future.delayed(const Duration(seconds: 5));
      executableSpinner.done();
    } on Object catch (e, s) {
      reset();
      errorPrint(
        title: e.toString(),
        content: s.toString(),
      );
      exit(exitCode);
    }
  }
}
