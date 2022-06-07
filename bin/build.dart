import 'common/pipeline.dart';
import 'steps/steps.dart';

Future<void> main() => Pipeline(
      steps: [
        VcpkgBuilder(),
        CheckDepndencies(),
        CMakeConfigure(),
        BuildLibrary(),
        CleanUp(),
      ],
    ).buildSteps();
