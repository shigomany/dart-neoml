part of '../steps.dart';

class CheckDepndencies extends StepDefinitionChecker {
  CheckDepndencies({
    required bool verbose,
  }) : _verbose = verbose;

  final bool _verbose;

  @override
  bool get verbose => _verbose;

  @override
  String get module => 'Dependencies';

  @override
  Future<void> step() => platform.when<Future<void>>(
        windows: _winChecks,
        macOS: _osxChecks,
        orElse: () => throw UnsupportedError('Unsupported platfrom'),
      )!;

  Future<void> _winChecks() async {
    await checkUtility(
      executable: 'cmake',
      command: 'cmake --help',
    );
    await checkUtility(
      executable: 'g++',
      command: 'g++ --help',
      supportInformation: _mingwInformation(),
    );
    await checkUtility(
      executable: 'gcc',
      command: 'gcc --help',
      supportInformation: _mingwInformation(),
    );
  }

  Future<void> _osxChecks() async {
    await checkUtility(
      executable: 'cmake',
      command: 'cmake --help',
    );

    await checkUtility(
      executable: 'g++',
      command: 'g++ --help',
      supportInformation: _mingwInformation(),
    );

    await checkUtility(
      executable: 'gcc',
      command: 'gcc --help',
      supportInformation: _mingwInformation(),
    );

    await checkUtility(
      executable: 'brew',
      command: 'brew --help',
      supportInformation: _brewInformation(),
    );

    await checkUtility(
      executable: 'protobuf',
      command: 'brew list protobuf',
      supportInformation: _brewCommandInfo('brew install protobuf'),
    );

    await checkUtility(
      executable: 'ninja',
      command: 'brew list ninja',
      supportInformation: _brewCommandInfo('brew install ninja'),
    );
  }

  String _brewInformation() =>
      'Install HomeBrew at this link: https://brew.sh/';

  String _brewCommandInfo(String command) =>
      'Use this command: ${command.bold}';

  String _mingwInformation() {
    return platform.when<String>(
      windows: () =>
          'Install MinGW for Windows x64: https://sourceforge.net/projects/mingw/\n'
          'And set G++ and GCC compilers (The GNU C++ Compiler) with MinGW Base',
      macOS: () => _brewCommandInfo('brew install gcc'),
      linux: () =>
          'Use this commands:\nsudo apt -y install build-essential\nwhereis gcc make',
      orElse: () => throw UnsupportedError('Unsupported platfrom'),
    )!;
  }
}
