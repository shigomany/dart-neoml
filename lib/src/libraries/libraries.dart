import 'package:platform_info/platform_info.dart';
import 'dart:ffi' as ffi;

class Libraries {
  Libraries() {
    // Don't change the order, as one library depends on another
    neoMathEngine = _openByName(_neoMathEngineName);
    neoML = _openByName(_neoMLName);
  }

  static final Libraries instance = Libraries();

  late final ffi.DynamicLibrary neoML;
  late final ffi.DynamicLibrary neoMathEngine;

  static const _neoMLName = 'NeoML';
  // static const _neoOnnyxName = 'NeoOnnx';
  static const _neoMathEngineName = 'NeoMathEngine';

  /// Get path library by [name]
  String _getLibraryPathByName(String name) => '$_assetPath/$name$_extension';

  ffi.DynamicLibrary _openByName(String name) =>
      ffi.DynamicLibrary.open(_getLibraryPathByName(name));

  String get _assetPath => platform.when(
        windows: () => 'assets/windows',
        linux: () => 'assets/linux',
        macOS: () => 'assets/macOS',
        orElse: () => throw UnsupportedError('Unsupported platfrom'),
      )!;

  String get _extension => platform.when(
        windows: () => '.dll',
        linux: () => '.so',
        macOS: () => '.dylib',
        orElse: () => throw UnsupportedError('Unsupported platfrom'),
      )!;

  String get neoMLPath => _getLibraryPathByName(_neoMLName);
  String get neoMathEnginePath => _getLibraryPathByName(_neoMathEngineName);
}
