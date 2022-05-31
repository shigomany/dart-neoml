import 'dart:io';

import 'package:ansi_styles/extension.dart';
import 'package:interact/interact.dart';
import 'package:platform_info/platform_info.dart';

import '../common/generators.dart';
import '../common/project_generator.dart';
import '../common/step_definition/step_definition.dart';
import 'package:path/path.dart' as path;

part 'cmake/configure.dart';
part 'dependencies/check_dependencies.dart';
part 'vcpkg/vcpckg_builder.dart';
part 'cmake/build_library.dart';
part 'cleanup/cleanup.dart';
