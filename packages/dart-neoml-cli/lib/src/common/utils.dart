extension PathExtension on String {
  /// Replace in path chars '\' on '/'
  String get toUnixPath => replaceAll(r'\', '/');
}
