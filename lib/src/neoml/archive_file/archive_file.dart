import 'dart:ffi' as ffi;
import 'dart:io';
import 'package:ffi/ffi.dart' as ffi;

import '../../functions/functions.dart';
import '../../libraries/libraries.dart';

part 'functions.dart';

typedef _BufferType = ffi.Array<ffi.Int32>;

enum _Direction {
  read._(1),
  write._(2);

  const _Direction._(this.value);

  final int value;
}

/// {@template neoml.ArchiveFile}
/// This class is necessary for serialization and deserialization of binary objects.
///
/// With it, you can serialize your trained models.
/// {@endtemplate}
/// {@category neoml}
class ArchiveFile {
  /// Path ot file
  final String filePath;

  ArchiveFile({
    required this.filePath,
  });

  ffi.Pointer<ffi.Void> _init(_Direction direction) {
    final constructor = Libraries.instance.neoML.lookupFunction<
        ConstructorFFI2<ffi.Pointer<ffi.Utf8>, ffi.Int32>,
        Constructor2<ffi.Pointer<ffi.Utf8>, int>>(
      _CArchiveFileFunctinos.init,
    );

    return constructor(filePath.toNativeUtf8(), direction.value);
  }

  /// Returns a double value from a normal distribution N([mean], [sigma])
  Future<int> read() async {
    final file = File(filePath);
    final length = await file.length();
    // final buffer = ffi.Pointer<ffi.Int32>.fromAddress(ptr);
    final instance = _init(_Direction.read);
    // final array = ffi.Array<ffi.Int16>(length);
    final outBuffer2 = ffi.calloc<ffi.Int8>(length * 1);
    final function = Libraries.instance.neoML.lookupFunction<
        NativeClassCallbackFn2<ffi.Pointer<ffi.Int8>, ffi.Int32, ffi.Int32>,
        ClassCallbackFn2<ffi.Pointer<ffi.Int8>, int, int>>(_CArchiveFileFunctinos.read);

    final readedBytes = function(instance, outBuffer2, length * 1);
    close(instance);
    final f = outBuffer2.cast<ffi.Utf8>().toDartString();
    // return _outBuffer.cast<ffi.Int32>();
    return 1;
  }

  void close(ffi.Pointer<ffi.Void> handle) {
    final closeHandle = Libraries.instance.neoML
        .lookupFunction<NativeClassCallbackFn0<ffi.Void>, ClassCallbackFn0<void>>(
            _CArchiveFileFunctinos.close);
    closeHandle(handle);
  }
  // Libraries.instance.neoML.lookupFunction<NativeClassCallbackFn2<ffi.Double, ffi.Double, ffi.Double>,
  //     Callback2<double, double, double>>(_CRandomFunctinos.normal)(
  //   _instance,
  //   mean,
  //   sigma,
  // );
}
