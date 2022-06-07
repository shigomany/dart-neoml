import 'dart:ffi' as ffi;

import 'package:ffi/ffi.dart' as ffi;

extension ItrableIntToNative<T extends ffi.NativeType> on Iterable<int> {
  ffi.Pointer<ffi.Int32> toPointerInt32() {
    final ptr = ffi.calloc<ffi.Int32>(length);
    for (var i = 0; i < length; i++) {
      ptr[i] = elementAt(i);
    }

    return ptr;
  }

  ffi.Pointer<ffi.Int16> toPointerInt16() {
    final ptr = ffi.calloc.allocate<ffi.Int16>(length);
    for (var i = 0; i < length; i++) {
      ptr[i] = elementAt(i);
    }

    return ptr;
  }

  ffi.Pointer<ffi.Int8> toPointerInt8() {
    final ptr = ffi.calloc.allocate<ffi.Int8>(length);
    for (var i = 0; i < length; i++) {
      ptr[i] = elementAt(i);
    }

    return ptr;
  }

  ffi.Pointer<ffi.Int64> toPointerInt64() {
    final ptr = ffi.calloc.allocate<ffi.Int64>(length);
    for (var i = 0; i < length; i++) {
      ptr[i] = elementAt(i);
    }

    return ptr;
  }
}

extension ItrableDoubleToNative<T extends ffi.NativeType> on Iterable<double> {
  ffi.Pointer<ffi.Float> toPointerFloat() {
    final ptr = ffi.calloc<ffi.Float>(length);
    for (var i = 0; i < length; i++) {
      ptr[i] = elementAt(i);
    }

    return ptr;
  }

  ffi.Pointer<ffi.Double> toPointerDouble() {
    final ptr = ffi.calloc.allocate<ffi.Double>(length);
    for (var i = 0; i < length; i++) {
      ptr[i] = elementAt(i);
    }

    return ptr;
  }
}
