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

/// {@macro functions.constructors.fficonsturctor}
/// 4
/// {@macro functions.callback.args}
typedef ConstructorFFI4<T1 extends ffi.NativeType, T2 extends ffi.NativeType,
        T3 extends ffi.NativeType, T4 extends ffi.NativeType>
    = ffi.Pointer<ffi.Void> Function(
  T1 t1,
  T2 t2,
  T3 t3,
  T4 t4,
);

/// {@macro functions.callback.dartconsturctor}
/// 4
/// {@macro functions.callback.args}
typedef Constructor4<T1, T2, T3, T4> = ffi.Pointer<ffi.Void> Function(
  T1 t1,
  T2 t2,
  T3 t3,
  T4 t4,
);

/// {@macro functions.constructors.fficonsturctor}
/// 5
/// {@macro functions.callback.args}
typedef ConstructorFFI5<
        T1 extends ffi.NativeType,
        T2 extends ffi.NativeType,
        T3 extends ffi.NativeType,
        T4 extends ffi.NativeType,
        T5 extends ffi.NativeType>
    = ffi.Pointer<ffi.Void> Function(
  T1 t1,
  T2 t2,
  T3 t3,
  T4 t4,
  T5 t5,
);

/// {@macro functions.callback.dartconsturctor}
/// 5
/// {@macro functions.callback.args}
typedef Constructor5<T1, T2, T3, T4, T5> = ffi.Pointer<ffi.Void> Function(
  T1 t1,
  T2 t2,
  T3 t3,
  T4 t4,
  T5 t5,
);

/// {@macro functions.constructors.fficonsturctor}
/// 6
/// {@macro functions.callback.args}
typedef ConstructorFFI6<
        T1 extends ffi.NativeType,
        T2 extends ffi.NativeType,
        T3 extends ffi.NativeType,
        T4 extends ffi.NativeType,
        T5 extends ffi.NativeType,
        T6 extends ffi.NativeType>
    = ffi.Pointer<ffi.Void> Function(
  T1 t1,
  T2 t2,
  T3 t3,
  T4 t4,
  T5 t5,
  T6 t6,
);

/// {@macro functions.callback.dartconsturctor}
/// 6
/// {@macro functions.callback.args}
typedef Constructor6<T1, T2, T3, T4, T5, T6> = ffi.Pointer<ffi.Void> Function(
  T1 t1,
  T2 t2,
  T3 t3,
  T4 t4,
  T5 t5,
  T6 t6,
);

/// {@macro functions.constructors.fficonsturctor}
/// 7
/// {@macro functions.callback.args}
typedef ConstructorFFI7<
        T1 extends ffi.NativeType,
        T2 extends ffi.NativeType,
        T3 extends ffi.NativeType,
        T4 extends ffi.NativeType,
        T5 extends ffi.NativeType,
        T6 extends ffi.NativeType,
        T7 extends ffi.NativeType>
    = ffi.Pointer<ffi.Void> Function(
  T1 t1,
  T2 t2,
  T3 t3,
  T4 t4,
  T5 t5,
  T6 t6,
  T7 t7,
);

/// {@macro functions.callback.dartconsturctor}
/// 7
/// {@macro functions.callback.args}
typedef Constructor7<T1, T2, T3, T4, T5, T6, T7> = ffi.Pointer<ffi.Void>
    Function(
  T1 t1,
  T2 t2,
  T3 t3,
  T4 t4,
  T5 t5,
  T6 t6,
  T7 t7,
);

/// {@macro functions.constructors.fficonsturctor}
/// 8
/// {@macro functions.callback.args}
typedef ConstructorFFI8<
        T1 extends ffi.NativeType,
        T2 extends ffi.NativeType,
        T3 extends ffi.NativeType,
        T4 extends ffi.NativeType,
        T5 extends ffi.NativeType,
        T6 extends ffi.NativeType,
        T7 extends ffi.NativeType,
        T8 extends ffi.NativeType>
    = ffi.Pointer<ffi.Void> Function(
  T1 t1,
  T2 t2,
  T3 t3,
  T4 t4,
  T5 t5,
  T6 t6,
  T7 t7,
  T8 t8,
);

/// {@macro functions.callback.dartconsturctor}
/// 8
/// {@macro functions.callback.args}
typedef Constructor8<T1, T2, T3, T4, T5, T6, T7, T8> = ffi.Pointer<ffi.Void>
    Function(
  T1 t1,
  T2 t2,
  T3 t3,
  T4 t4,
  T5 t5,
  T6 t6,
  T7 t7,
  T8 t8,
);

/// {@macro functions.constructors.fficonsturctor}
/// 9
/// {@macro functions.callback.args}
typedef ConstructorFFI9<
        T1 extends ffi.NativeType,
        T2 extends ffi.NativeType,
        T3 extends ffi.NativeType,
        T4 extends ffi.NativeType,
        T5 extends ffi.NativeType,
        T6 extends ffi.NativeType,
        T7 extends ffi.NativeType,
        T8 extends ffi.NativeType,
        T9 extends ffi.NativeType>
    = ffi.Pointer<ffi.Void> Function(
  T1 t1,
  T2 t2,
  T3 t3,
  T4 t4,
  T5 t5,
  T6 t6,
  T7 t7,
  T8 t8,
  T9 t9,
);

/// {@macro functions.callback.dartconsturctor}
/// 9
/// {@macro functions.callback.args}
typedef Constructor9<T1, T2, T3, T4, T5, T6, T7, T8, T9> = ffi.Pointer<ffi.Void>
    Function(
  T1 t1,
  T2 t2,
  T3 t3,
  T4 t4,
  T5 t5,
  T6 t6,
  T7 t7,
  T8 t8,
  T9 t9,
);
