import 'package:ansi_styles/extension.dart';

import 'step_definition/step_definition.dart';

/// {@macro common.pipeline.Pipeline}
class Pipeline {
  final List<StepDefinition> steps;

  /// {@template common.pipeline.Pipeline}
  /// Wrap over all steps
  /// {@endtemplate}
  Pipeline({
    required this.steps,
  });

  /// Call for [steps] method step
  Future<void> buildSteps() async {
    for (final stepDef in steps) {
      try {
        await stepDef.step();
      } on Object catch (e) {
        print(e.toString().bold.red);
        break;
      }
    }
  }
}
