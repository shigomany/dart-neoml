part of 'functions.dart';

/// Constructor functions C FFI and also for Dart constructors.
///
/// Empty constructor
typedef EmptyConstructor = ffi.Pointer<ffi.Void> Function();

/// {@template functions.constructors.fficonsturctor}
/// Constructor functions C FFI with
/// {@endtemplate}
/// 1
/// {@template functions.callback.args}
/// arguments.
/// {@endtemplate}
typedef ConstructorFFI1<T1 extends ffi.NativeType> = ffi.Pointer<ffi.Void>
    Function(
  T1 t1,
);

/// {@template functions.callback.dartconsturctor}
/// Constructor functions Dart FFI with
/// {@endtemplate}
/// 1
/// {@macro functions.callback.args}
typedef Constructor1<T1> = ffi.Pointer<ffi.Void> Function(T1 t1);

/// {@macro functions.constructors.fficonsturctor}
/// 2
/// {@macro functions.callback.args}
typedef ConstructorFFI2<T1 extends ffi.NativeType, T2 extends ffi.NativeType>
    = ffi.Pointer<ffi.Void> Function(
  T1 t1,
  T2 t2,
);

/// {@macro functions.callback.dartconsturctor}
/// 2
/// {@macro functions.callback.args}
typedef Constructor2<T1, T2> = ffi.Pointer<ffi.Void> Function(
  T1 t1,
  T2 t2,
);

/// {@macro functions.constructors.fficonsturctor}
/// 3
/// {@macro functions.callback.args}
typedef ConstructorFFI3<T1 extends ffi.NativeType, T2 extends ffi.NativeType,
        T3 extends ffi.NativeType>
    = ffi.Pointer<ffi.Void> Function(
  T1 t1,
  T2 t2,
  T3 t3,
);

/// {@macro functions.callback.dartconsturctor}
/// 3
/// {@macro functions.callback.args}
typedef Constructor3<T1, T2, T3> = ffi.Pointer<ffi.Void> Function(
  T1 t1,
  T2 t2,
  T3 t3,
);
