part of '../steps.dart';

class CleanUp extends StepDefinitionExecutor {
  @override
  String get module => 'CleanUp';

  @override
  Future<void> step() => platform.when<Future<void>>(
        windows: () => executeFunction(
          method: () => _desktopStep(cleanPath: 'assets/windows'),
          rightPrompt: (done) =>
              done ? message('Cleanup succeed') : message('Cleanup pending'),
        ),
        macOS: () => executeFunction(
          method: () => _desktopStep(
            cleanPath: 'assets/macOS',
            binFolderName: 'lib',
          ),
          rightPrompt: (done) =>
              done ? message('Cleanup succeed') : message('Cleanup pending'),
        ),
        orElse: () => throw UnsupportedError('Unsupported platform'),
      )!;

  Future<void> _desktopStep({
    required String cleanPath,
    String binFolderName = 'bin',
  }) async {
    final libDir = Directory(path.join(Directory.current.path, cleanPath));
    final nestedDirFiles = libDir.listSync().whereType<Directory>().toList();

    final binDirectoryIndex = nestedDirFiles
        .indexWhere((element) => element.path.contains(binFolderName));
    if (binDirectoryIndex != -1) {
      final binDir = nestedDirFiles[binDirectoryIndex];
      copyDirectory(binDir, libDir);
      for (final dir in nestedDirFiles) {
        await dir.delete(recursive: true);
      }
    }
  }

  void copyDirectory(Directory source, Directory destination) =>
      source.listSync(recursive: false).forEach((entity) {
        if (entity is Directory) {
          var newDirectory = Directory(
              path.join(destination.absolute.path, path.basename(entity.path)));
          newDirectory.createSync();

          copyDirectory(entity.absolute, newDirectory);
        } else if (entity is File) {
          entity.copySync(
              path.join(destination.path, path.basename(entity.path)));
        }
      });
}
