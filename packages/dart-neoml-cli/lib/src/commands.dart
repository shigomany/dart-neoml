import 'dart:io';

import 'package:args/command_runner.dart';

import 'common/pipeline.dart';
import 'steps/steps.dart';

enum _ArgumentsName {
  verbose('verbose'),
  vcpkgPath('vcpkg-path'),
  neomlPath('neoml-path');

  const _ArgumentsName(this.value);

  final String value;
}

class BuildLibraryCommand extends Command {
  @override
  final name = 'build';
  @override
  final description = 'Building dynamic library for dart-neoml package';

  BuildLibraryCommand() {
    argParser
      ..addFlag(
        _ArgumentsName.verbose.value,
        abbr: 'v',
        help: 'Show additional information in output console. Default: false',
        defaultsTo: false,
      )
      ..addOption(
        _ArgumentsName.vcpkgPath.value,
        help: 'Vcpkg absolute or relative path',
        valueHelp: r'C:\<path-to>\vcpkg',
      )
      ..addOption(
        _ArgumentsName.neomlPath.value,
        help: 'NeoML project absolute or relative path',
        valueHelp: r'C:\<path-to>\neoml\Build',
      );
  }

  @override
  Future<void> run() {
    final verbose = argResults![_ArgumentsName.verbose.value];
    final vcpkgPath = argResults![_ArgumentsName.vcpkgPath.value];
    final neomlPath = argResults![_ArgumentsName.neomlPath.value];
    return Pipeline(
      steps: [
        CheckDepndencies(verbose: verbose),
        if (Platform.isWindows)
          VcpkgBuilder(
            verbose: verbose,
            vcpkgPath: vcpkgPath,
          ),
        CMakeConfigure(
          verbose: verbose,
          neomlPath: neomlPath,
        ),
        BuildLibrary(verbose: verbose),
        CleanUp(),
      ],
    ).buildSteps();
  }
}
