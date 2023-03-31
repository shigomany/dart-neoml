import 'package:ansi_styles/extension.dart';
import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:dart_neoml_cli/src/commands.dart';

Future<void> main(List<String> args) async {
  try {
    final runner = CommandRunner<void>(
        'dart-neoml', 'Building tool for dart-neoml package')
      ..addCommand(BuildLibraryCommand());
    await runner.run(args);
    // await runner
    //     .run(['build', '--vcpkg-path', r'C:\workingprojects\dart-neoml\vcpkg']);
  } on UsageException catch (e) {
    print(e.message.red);
  } on ArgParserException catch (e) {
    print(e.message.red);
  }
}
