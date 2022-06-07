part of 'functions.dart';

/// {@template functions.callbacks.NativeCallback}
/// General callback on C/C++ with
/// {@endtemplate}
/// 0
/// {@template functions.callbacks.args}
/// arguments.
/// {@endtemplate}
typedef NativeCallbackFn0<TResult extends ffi.NativeType> = TResult Function();

/// {@template functions.callbacks.Callback}
/// General callback on Dart with
/// {@endtemplate}
/// 0
/// {@macro functions.callbacks.args}
typedef CallbackFn0<TResult> = TResult Function();

/// {@macro functions.callbacks.NativeClassCallback}
/// 1
/// {@macro functions.callbacks.args}
typedef NativeCallbackFn1<T1 extends ffi.NativeType, TResult extends ffi.NativeType> = TResult
    Function(
  T1 t1,
);

/// {@macro functions.callbacks.Callback}
/// 1
/// {@macro functions.callbacks.args}
typedef CallbackFn1<T1, TResult> = TResult Function(
  T1 t1,
);

/// {@macro functions.callbacks.NativeClassCallback}
/// 2
/// {@macro functions.callbacks.args}
typedef NativeCallbackFn2<T1 extends ffi.NativeType, T2 extends ffi.NativeType,
        TResult extends ffi.NativeType>
    = TResult Function(
  T1 t1,
  T2 t2,
);

/// {@macro functions.callbacks.Callback}
/// 2
/// {@macro functions.callbacks.args}
typedef CallbackFn2<T1, T2, TResult> = TResult Function(
  T1 t1,
  T2 t2,
);

/// {@macro functions.callbacks.NativeClassCallback}
/// 3
/// {@macro functions.callbacks.args}
typedef NativeCallbackFn3<T1 extends ffi.NativeType, T2 extends ffi.NativeType,
        T3 extends ffi.NativeType, TResult extends ffi.NativeType>
    = TResult Function(
  T1 t1,
  T2 t2,
  T3 t3,
);

/// {@macro functions.callbacks.Callback}
/// 3
/// {@macro functions.callbacks.args}
typedef CallbackFn3<T1, T2, T3, TResult> = TResult Function(
  T1 t1,
  T2 t2,
  T3 t3,
);
