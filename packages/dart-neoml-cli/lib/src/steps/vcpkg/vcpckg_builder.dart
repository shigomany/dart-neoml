part of '../steps.dart';

class VcpkgBuilder extends StepDefinitionExecutor {
  VcpkgBuilder({
    required bool verbose,
    String? vcpkgPath,
  })  : _verbose = verbose,
        _vcpkgPath = vcpkgPath;

  final bool _verbose;
  final String? _vcpkgPath;

  String get directoryPath => (_vcpkgPath ?? Directory.current.path).toUnixPath;

  @override
  bool get verbose => _verbose;

  @override
  String get module => 'Vcpkg';

  @override
  Future<void> step() => platform.when(
        windows: _winBuilder,
        orElse: () => throw UnsupportedError('Unsupported platfrom'),
      )!;

  Future<void> _winBuilder() async {
    if (!_isExistVcpkg()) {
      await executeCommand(
        command: 'bootstrap-vcpkg.bat',
        rightPrompt: (done) => done
            ? message('${'vcpkg'.bold} builded')
            : message('${'vcpkg'.bold} installing'),
        workingDirectory: directoryPath,
        runInShell: true,
      );
    }
    if (!_isInstalledProtobuf()) {
      await executeCommand(
        command: 'vcpkg install protobuf:x64-windows',
        rightPrompt: (done) => done
            ? message('${'protobuf'.bold} installed')
            : message('${'protobuf'.bold} installing'),
        workingDirectory: directoryPath,
        runInShell: true,
      );
    }
    await executeCommand(
      command: 'vcpkg integrate install',
      rightPrompt: (done) => done
          ? message('${'vcpkg'.bold} integration installed')
          : message('${'vcpkg'.bold} integration installing'),
      workingDirectory: directoryPath,
      runInShell: true,
    );
  }

  bool _isInstalledProtobuf() {
    final protobufResult = Process.runSync(
      'vcpkg',
      ['list'],
      workingDirectory: directoryPath,
      runInShell: true,
    );

    return (protobufResult.stdout as String).contains('protobuf:x64-windows');
  }

  bool _isExistVcpkg() {
    final executableFile = platform.when(
      windows: () => 'vcpkg.exe',
      linux: () => 'vcpkg',
      orElse: () => throw UnsupportedError('Unsupported platform'),
    )!;
    final vcpkgFile = File('$directoryPath/$executableFile');

    return vcpkgFile.existsSync();
  }
}
