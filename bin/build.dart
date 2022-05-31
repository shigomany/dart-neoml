import 'common/pipeline.dart';
import 'steps/steps.dart';

Future<void> main() => Pipeline(
      steps: [
        VcpkgBuilder(),
        CheckDepndencies(),
        CMakeStepConfigure(),
        BuildLibrary(),
        CleanUp(),
      ],
    ).buildSteps();
