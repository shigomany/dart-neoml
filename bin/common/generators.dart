import 'dart:io';

import 'project_generator.dart';

final RegExp _fixNewLines = RegExp(r'[\n]{1,}[\=]{1,}', multiLine: true);

/// Returns a list of project generators from the CMake console output
List<ProjectGenerator> getGenerators() {
  final cmakeResult = Process.runSync(
    'cmake',
    ['--help'],
    runInShell: true,
  );

  final stdoutList = (cmakeResult.stdout as String).split('\n');

  // Index of the line from which the generators start
  final generatorsStartIndex =
      stdoutList.indexWhere((element) => element == 'Generators');
  // Select part text with generators and lines with generators names
  final generatorsList = stdoutList.skip(generatorsStartIndex).toList();

  // First sentence with '*'
  final starSignIndex =
      generatorsList.indexWhere((element) => element.contains('*'));

  final pureGeneratorsText = generatorsList
      .skip(starSignIndex)
      .skip(1)
      .map((e) => e.trim())
      .join('\n')
      .replaceAll(_fixNewLines, ' =');

  return _joinGeneratorDescriptions(pureGeneratorsText.split('\n'))
      .map((e) => ProjectGenerator.fromString(e))
      .toList();
}

// Combining generator descriptions
List<String> _joinGeneratorDescriptions(List<String> generators) {
  final result = <String>[];

  for (final gen in generators) {
    if (gen.contains('=')) {
      result.add(gen);
    } else {
      result[result.length - 1] += ' $gen';
    }
  }

  return result;
}
