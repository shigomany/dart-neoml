part of '../steps.dart';

class BuildLibrary extends StepDefinitionExecutor {
  @override
  String get module => 'CMake';

  @override
  Future<void> step() => platform.when<Future<void>>(
        windows: _winStep,
        orElse: () => throw UnsupportedError('Unsupported platform'),
      )!;

  Future<void> _winStep() async {
    final selectedConfiguration = _selectConfiguration();
    // Execute command
    await executeCommand(
      command:
          'cmake --build . --target install --config $selectedConfiguration',
      rightPrompt: (done) =>
          done ? message('Library builded') : message('Library building'),
      workingDirectory: 'neoml/Build',
      runInShell: true,
    );
  }

  String _selectConfiguration() {
    final configurations = ['Debug', 'Release', 'RelWithDebInfo', 'MinSizeRel'];
    final configSelect = Select(
      prompt: message('Build type:'),
      options: configurations,
      initialIndex: 1,
    );

    final selectedConfig = configurations[configSelect.interact()];

    return selectedConfig;
  }

  String _macOsStep() {
    final resultCommand = StringBuffer('cmake');
    return resultCommand.toString();
  }
}
