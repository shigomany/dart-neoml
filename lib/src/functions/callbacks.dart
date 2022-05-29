part of 'functions.dart';

/// {@template functions.callback.fficalback}
/// Callback C FFI with
/// {@endtemplate}
/// 0
/// {@template functions.callback.args}
/// arguments.
/// {@endtemplate}
typedef CallbackFFI0<TFFI extends ffi.NativeType> = TFFI Function(
  ffi.Pointer<ffi.Void> p,
);

/// {@template functions.callback.dartcalback}
/// Callback Dart type FFI with
/// {@endtemplate}
/// 0
/// {@macro functions.callback.args}
typedef Callback0<TResult> = TResult Function(ffi.Pointer<ffi.Void> p);

/// {@macro functions.callback.fficalback}
/// 1
/// {@macro functions.callback.args}
typedef CallbackFFI1<T1 extends ffi.NativeType, TFFI extends ffi.NativeType>
    = TFFI Function(
  ffi.Pointer<ffi.Void> p,
  T1 t1,
);

/// {@macro functions.callback.dartcalback}
/// 1
/// {@macro functions.callback.args}
typedef Callback1<T1, TResult> = TResult Function(
  ffi.Pointer<ffi.Void> p,
  T1 t1,
);

/// {@macro functions.callback.fficalback}
/// 2
/// {@macro functions.callback.args}
typedef CallbackFFI2<T1 extends ffi.NativeType, T2 extends ffi.NativeType,
        TFFI extends ffi.NativeType>
    = TFFI Function(
  ffi.Pointer<ffi.Void> p,
  T1 t1,
  T2 t2,
);

/// {@macro functions.callback.dartcalback}
/// 2
/// {@macro functions.callback.args}
typedef Callback2<T1, T2, TResult> = TResult Function(
  ffi.Pointer<ffi.Void> p,
  T1 t1,
  T2 t2,
);

/// {@macro functions.callback.fficalback}
/// 3
/// {@macro functions.callback.args}
typedef CallbackFFI3<T1 extends ffi.NativeType, T2 extends ffi.NativeType,
        T3 extends ffi.NativeType, TFFI extends ffi.NativeType>
    = TFFI Function(
  ffi.Pointer<ffi.Void> p,
  T1 t1,
  T2 t2,
  T3 t3,
);

/// {@macro functions.callback.dartcalback}
/// 3
/// {@macro functions.callback.args}
typedef Callback3<T1, T2, T3, TResult> = TResult Function(
  ffi.Pointer<ffi.Void> p,
  T1 t1,
  T2 t2,
  T3 t3,
);

/// {@macro functions.callback.fficalback}
/// 3
/// {@macro functions.callback.args}
typedef CallbackFFI4<
        T1 extends ffi.NativeType,
        T2 extends ffi.NativeType,
        T3 extends ffi.NativeType,
        T4 extends ffi.NativeType,
        TFFI extends ffi.NativeType>
    = TFFI Function(
  ffi.Pointer<ffi.Void> p,
  T1 t1,
  T2 t2,
  T3 t3,
  T4 t4,
);

/// {@macro functions.callback.dartcalback}
/// 3
/// {@macro functions.callback.args}
typedef Callback4<T1, T2, T3, T4, TResult> = TResult Function(
  ffi.Pointer<ffi.Void> p,
  T1 t1,
  T2 t2,
  T3 t3,
  T4 t4,
);
