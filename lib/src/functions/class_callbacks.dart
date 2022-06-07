part of 'functions.dart';

/// {@template functions.class_callbacks.NativeClassCallback}
/// Callback C FFI for Classes with
/// {@endtemplate}
/// 0
/// {@template functions.class_callbacks.args}
/// arguments.
/// {@endtemplate}
typedef NativeClassCallbackFn0<TResult extends ffi.NativeType> = TResult Function(
  Instance p,
);

/// {@template functions.class_callbacks.ClassCallback}
/// Callback Dart type FFI for Classes with
/// {@endtemplate}
/// 0
/// {@macro functions.class_callbacks.args}
typedef ClassCallbackFn0<TResult> = TResult Function(ffi.Pointer<ffi.Void> p);

/// {@macro functions.class_callbacks.NativeClassCallback}
/// 1
/// {@macro functions.class_callbacks.args}
typedef NativeClassCallbackFn1<T1 extends ffi.NativeType, TResult extends ffi.NativeType> = TResult
    Function(
  Instance p,
  T1 t1,
);

/// {@macro functions.class_callbacks.ClassCallback}
/// 1
/// {@macro functions.class_callbacks.args}
typedef ClassCallbackFn1<T1, TResult> = TResult Function(
  Instance p,
  T1 t1,
);

/// {@macro functions.class_callbacks.NativeClassCallback}
/// 2
/// {@macro functions.class_callbacks.args}
typedef NativeClassCallbackFn2<T1 extends ffi.NativeType, T2 extends ffi.NativeType,
        TResult extends ffi.NativeType>
    = TResult Function(
  Instance p,
  T1 t1,
  T2 t2,
);

/// {@macro functions.class_callbacks.ClassCallback}
/// 2
/// {@macro functions.class_callbacks.args}
typedef ClassCallbackFn2<T1, T2, TResult> = TResult Function(
  Instance p,
  T1 t1,
  T2 t2,
);

/// {@macro functions.class_callbacks.NativeClassCallback}
/// 3
/// {@macro functions.class_callbacks.args}
typedef NativeClassCallbackFn3<T1 extends ffi.NativeType, T2 extends ffi.NativeType,
        T3 extends ffi.NativeType, TResult extends ffi.NativeType>
    = TResult Function(
  Instance p,
  T1 t1,
  T2 t2,
  T3 t3,
);

/// {@macro functions.class_callbacks.ClassCallback}
/// 3
/// {@macro functions.class_callbacks.args}
typedef ClassCallbackFn3<T1, T2, T3, TResult> = TResult Function(
  Instance p,
  T1 t1,
  T2 t2,
  T3 t3,
);

/// {@macro functions.class_callbacks.NativeClassCallback}
/// 3
/// {@macro functions.class_callbacks.args}
typedef NativeClassCallbackFn4<T1 extends ffi.NativeType, T2 extends ffi.NativeType,
        T3 extends ffi.NativeType, T4 extends ffi.NativeType, TResult extends ffi.NativeType>
    = TResult Function(
  ffi.Pointer<ffi.Void> p,
  T1 t1,
  T2 t2,
  T3 t3,
  T4 t4,
);

/// {@macro functions.class_callbacks.ClassCallback}
/// 3
/// {@macro functions.class_callbacks.args}
typedef ClassCallbackFn4<T1, T2, T3, T4, TResult> = TResult Function(
  ffi.Pointer<ffi.Void> p,
  T1 t1,
  T2 t2,
  T3 t3,
  T4 t4,
);
