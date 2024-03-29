part of '../steps.dart';

class BuildLibrary extends StepDefinitionExecutor {
  BuildLibrary({required bool verbose}) : _verbose = verbose;

  final bool _verbose;

  @override
  bool get verbose => _verbose;

  @override
  String get module => 'CMake';

  @override
  Future<void> step() => platform.when<Future<void>>(
        windows: _desktopStep,
        linux: _desktopStep,
        macOS: _desktopStep,
        orElse: () => throw UnsupportedError('Unsupported platform'),
      )!;

  Future<void> _desktopStep() async {
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
}
