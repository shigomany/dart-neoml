import 'dart:io';

import 'package:platform_info/platform_info.dart';
import 'dart:ffi' as ffi;
import 'package:path/path.dart' as path;

class Libraries {
  Libraries._() {
    // Don't change the order, as one library depends on another
    neoMathEngine = _openByName(_neoMathEngineFile);
    neoML = _openByName(_neoMLFile);
  }

  static final Libraries instance = Libraries._();

  late final ffi.DynamicLibrary neoML;
  late final ffi.DynamicLibrary neoMathEngine;

  /// File name and extension for `NeoML` library.
  static final _neoMLFile = platform.when(
    windows: () => 'NeoML.dll',
    linux: () => 'NeoML.so',
    macOS: () => 'libNeoML.dylib',
    orElse: () => throw UnsupportedError('Unsupported platfrom'),
  )!;
  // static final _neoOnnyxName = 'NeoOnnx';

  /// File name and extension for `NeoMathEngine` library.
  static final _neoMathEngineFile = platform.when(
    windows: () => 'NeoMathEngine.dll',
    linux: () => 'NeoMathEngine.so',
    macOS: () => 'libNeoMathEngine.dylib',
    orElse: () => throw UnsupportedError('Unsupported platfrom'),
  )!;

  /// Get path library by [name]
  String _getLibraryPathByName(String file) => '$_assetPath/$file';

  ffi.DynamicLibrary _openByName(String name) => ffi.DynamicLibrary.open(
      path.join(Directory.current.path, _getLibraryPathByName(name)));

  String get _assetPath => platform.when(
        windows: () => 'assets/windows',
        linux: () => 'assets/linux',
        macOS: () => 'assets/macOS',
        orElse: () => throw UnsupportedError('Unsupported platfrom'),
      )!;

  String get neoMLPath => _getLibraryPathByName(_neoMLFile);
  String get neoMathEnginePath => _getLibraryPathByName(_neoMathEngineFile);
}
