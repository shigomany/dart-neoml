part of 'step_definition.dart';

abstract class StepDefinitionChecker extends StepDefinition {
  /// Printing beautiful error message
  void errorPrint({
    required String title,
    required String content,
  }) {
    print('');
    print(title.bgRed);
    print('');
    print(content.red);
  }

  void printErrorCode(int errorCode) {
    print('');
    print('Error code: $errorCode'.red.bold);
  }

  Future<void> checkUtility({
    required String executable,
    required String command,
    String? supportInformation,
    String? workingDirectory,
    bool runInShell = true,
  }) async {
    try {
      final executableSpinner = Spinner(
        icon: '⚙️',
        leftPrompt: (done) => '',
        rightPrompt: (done) => done
            ? message('${executable.bold} utility founded.')
            : message('${executable.bold} utility founding.'),
      ).interact();
      final commandSplitted = command.split(' ');
      final executableResult = await Process.run(
        commandSplitted.first,
        commandSplitted.sublist(1),
        runInShell: runInShell,
        workingDirectory: workingDirectory,
      );

      if (executableResult.exitCode != 0 && workingDirectory == null) {
        throw GlobalExecutable(
          executable: executable,
          processResult: executableResult,
        );
      } else if (executableResult.exitCode != 0 && workingDirectory != null) {
        throw LocalExecutable(
          executable: executable,
          processResult: executableResult,
          path: workingDirectory,
        );
      }

      executableSpinner.done();
    } on GlobalExecutable catch (e) {
      reset();
      errorPrint(
        title: e.toString(),
        content: e.processResult.stderr as String,
      );
      if (supportInformation != null) {
        print(supportInformation.cyanBright);
      }
      printErrorCode(e.processResult.exitCode);
      exit(e.processResult.exitCode);
    } on LocalExecutable catch (e) {
      reset();
      errorPrint(
        title: e.toString(),
        content: e.processResult.stderr as String,
      );
      printErrorCode(e.processResult.exitCode);
      exit(e.processResult.exitCode);
    } on Object catch (e, s) {
      errorPrint(
        title: e.toString(),
        content: s.toString(),
      );
      exit(exitCode);
    }
  }
}
