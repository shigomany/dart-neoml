part of '../steps.dart';

class CheckDepndencies extends StepDefinitionChecker {
  @override
  String get module => 'Dependencies';

  @override
  Future<void> step() => platform.when<Future<void>>(
        windows: _winChecks,
        orElse: () => throw UnsupportedError('Unsupported platfrom'),
      )!;

  Future<void> _winChecks() async {
    await checkUtility(
      executable: 'cmake',
      command: 'cmake --help',
    );
    await checkUtility(
      executable: 'g++/gcc',
      command: 'g++ --help && gcc --help',
      supportInformation: _mingwInformation(),
    );
  }

  String _mingwInformation() {
    final brewCommand = 'brew install gcc'.bold;
    return platform.when<String>(
      windows: () =>
          'Install MinGW for Windows x64: https://sourceforge.net/projects/mingw-w64/\n'
          'And set MinGW path to global variables.',
      macOS: () => 'Use this command: $brewCommand',
      linux: () =>
          'Use this commands:\nsudo apt -y install build-essential\nwhereis gcc make',
      orElse: () => throw UnsupportedError('Unsupported platfrom'),
    )!;
  }
}
