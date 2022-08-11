import 'dart:io';

import 'common/pipeline.dart';
import 'steps/steps.dart';

Future<void> main() => Pipeline(
      steps: [
        CheckDepndencies(),
        if (Platform.isWindows) VcpkgBuilder(),
        CMakeConfigure(),
        BuildLibrary(),
        CleanUp(),
      ],
    ).buildSteps();
