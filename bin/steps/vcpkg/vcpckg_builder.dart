part of '../steps.dart';

class VcpkgBuilder extends StepDefinitionExecutor {
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
        workingDirectory: 'vcpkg',
      );
    }
    if (!_isInstalledProtobuf()) {
      await executeCommand(
        command: 'vcpkg install protobuf:x64-windows',
        rightPrompt: (done) => done
            ? message('${'protobuf'.bold} installed')
            : message('${'protobuf'.bold} installing'),
        workingDirectory: 'vcpkg',
        runInShell: true,
      );
    }
    await executeCommand(
      command: 'vcpkg integrate install',
      rightPrompt: (done) => done
          ? message('${'vcpkg'.bold} integration installed')
          : message('${'vcpkg'.bold} integration installing'),
      workingDirectory: 'vcpkg',
      runInShell: true,
    );
  }

  bool _isInstalledProtobuf() {
    final protobufResult = Process.runSync(
      'vcpkg',
      ['list'],
      workingDirectory: 'vcpkg',
      runInShell: true,
    );

    return (protobufResult.stdout as String).contains('protobuf:x64-windows');
  }

  bool _isExistVcpkg() {
    final pathFile = platform.when(
      windows: () => 'vcpkg/vcpkg.exe',
      linux: () => 'vcpkg/vcpkg',
      orElse: () => throw UnsupportedError('Unsupported platform'),
    )!;
    final vcpkgFile = File(pathFile);

    return vcpkgFile.existsSync();
  }
}
