final RegExp _hasArchArgument = RegExp(r'\[arch\]');
final RegExp _isSelected = RegExp(r'\*');
final RegExp _ideName =
    RegExp(r'^\*{0,}\s{0,}([\w\s\-]{1,}[\[arch\]]{0,})\s{0,}=');

final RegExp _description = RegExp(r'\=\s{0,}(.+)$');

final RegExp _archOptions = RegExp(r'"([\w]{1,})"');

class ProjectGenerator {
  /// State default selected generator project
  final bool isSelected;

  /// IDE name
  final String ideName;

  /// Arch variants
  final List<String>? archs;

  /// Description of the project generator
  final String description;

  /// {@tempalte aboba}
  /// Data class about CMake project generators
  /// {@endtemplate}
  const ProjectGenerator({
    required this.isSelected,
    required this.ideName,
    required this.description,
    this.archs = const [],
  });

  factory ProjectGenerator.fromString(String rawValue) {
    final ideNameDirty = _ideName.firstMatch(rawValue)!.group(1)!.trim();
    final archsDirty = _hasArchArgument.hasMatch(rawValue)
        ? _archOptions.allMatches(rawValue).map((e) => e.group(1)!).toList()
        : null;
    final descriptionDirty =
        _description.firstMatch(rawValue)!.group(1)!.trim();
    return ProjectGenerator(
      isSelected: _isSelected.hasMatch(rawValue),
      archs: archsDirty,
      ideName: ideNameDirty,
      description: descriptionDirty,
    );
  }

  String get shortNameIDE => ideName.replaceAll('[arch]', '');

  @override
  String toString() => '$ideName - $description';
}
