part of '../steps.dart';

final RegExp _visualStudioVersion = RegExp(r'^Visual Studio (\d{1,})');

class CMakeConfigure extends StepDefinitionExecutor {
  @override
  String get module => 'CMake';

  @override
  Future<void> step() => platform.when<Future<void>>(
        windows: _winStep,
        macOS: _macOsStep,
        orElse: () => throw UnsupportedError('Unsupported platform'),
      )!;

  String get _assetPath => platform.when(
        windows: () => 'assets/windows',
        linux: () => 'assets/linux',
        macOS: () => 'assets/macOS',
        orElse: () => throw UnsupportedError('Unsupported platfrom'),
      )!;

  Future<void> _winStep() async {
    // Select nessary fields
    final selectedGenerator = _selectProjectGenerator();
    final selectedArch = _selectArchitecture(archs: ['x64', 'Win32']);

    final command = _cmakeConfigureCommand(
      arch: selectedArch,
      installPath: _assetPath,
      generator: selectedGenerator.shortNameIDE,
      toolchainFile: '../../vcpkg/scripts/buildsystems/vcpkg.cmake',
    );

    // Execute command
    await executeCommand(
      command: command,
      rightPrompt: (done) =>
          done ? message('Project configured') : message('Configuring project'),
      workingDirectory: 'neoml/Build',
    );
  }

  ProjectGenerator _selectProjectGenerator() {
    final projectGenerators = getGenerators();
    final filteredGenerators = projectGenerators.where((gen) {
      final match = _visualStudioVersion.firstMatch(gen.ideName);

      return match != null && int.parse(match.group(1)!) >= 15;
    }).toList();
    final projectGeneratorsSelectors = Select(
      prompt: message('Project generator:'),
      options: filteredGenerators.map((e) => e.shortNameIDE).toList(),
      initialIndex:
          filteredGenerators.indexWhere((element) => element.isSelected),
    );

    final selectedGenerator =
        filteredGenerators[projectGeneratorsSelectors.interact()];

    return selectedGenerator;
  }

  String _selectArchitecture({
    required List<String> archs,
  }) {
    // final archs = ['x64', 'Win32'];
    final archSelect = Select(
      prompt: message('Architecture:'),
      options: archs,
      initialIndex: 0,
    );

    final selectedArch = archs[archSelect.interact()];

    return selectedArch;
  }

  String _cmakeConfigureCommand({
    required String installPath,
    String? arch,
    String? generator,
    String? toolchainFile,
    String? configurationBuild,
  }) {
    final resultCommand = StringBuffer('cmake');

    // Append Generator
    if (generator != null && generator.split(' ').length > 1) {
      resultCommand.write(' -G "$generator"');
    } else if (generator != null) {
      resultCommand.write(' -G $generator');
    }

    // Append Arch
    if (arch != null) {
      resultCommand.write(' -A $arch');
    }

    resultCommand.write(' ../NeoML');

    // Append Configuration build
    if (configurationBuild != null) {
      resultCommand.write(' -DCMAKE_BUILD_TYPE=$configurationBuild');
    }

    // Append Toolchain path
    if (toolchainFile != null) {
      resultCommand.write(' -DCMAKE_TOOLCHAIN_FILE="$toolchainFile"');
    }

    resultCommand.write(' -DCMAKE_INSTALL_PREFIX="../../$installPath"');

    return resultCommand.toString();
  }

  Future<void> _macOsStep() async {
    final command = _cmakeConfigureCommand(
      installPath: _assetPath,
      generator: 'Ninja',
    );

    // Execute command
    await executeCommand(
      command: command,
      rightPrompt: (done) =>
          done ? message('Project configured') : message('Configuring project'),
      workingDirectory: 'neoml/Build',
    );
  }
}
