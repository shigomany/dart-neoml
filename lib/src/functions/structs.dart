part of 'functions.dart';

/// {@template functions.struct.nativestruct}
/// Function which create native struct with
/// {@endtemplate}
/// 0
/// {@template functions.struct.args}
/// arguments.
/// {@endtemplate}
typedef NativeStructFn0<TStruct extends ffi.Struct> = TStruct Function();

/// {@macro functions.struct.nativestruct}
/// 1
/// {@macro functions.struct.args}
typedef NativeStructFn1<T1 extends ffi.NativeType, TStruct extends ffi.Struct> = TStruct Function(
    T1 t1);

/// {@template functions.struct.dartstruct}
/// Function which bind to native struct with
/// {@endtemplate}
/// 1
/// {@macro functions.struct.args}
typedef DartStructFn1<T1, TStruct extends ffi.Struct> = TStruct Function(T1 t1);

/// {@macro functions.struct.nativestruct}
/// 2
/// {@macro functions.struct.args}
typedef NativeStructFn2<T1 extends ffi.NativeType, T2 extends ffi.NativeType,
        TStruct extends ffi.Struct>
    = TStruct Function(T1 t1, T2 t2);

/// {@macro functions.struct.dartstruct}
/// 1
/// {@macro functions.struct.args}
typedef DartStructFn2<T1, T2, TStruct extends ffi.Struct> = TStruct Function(T1 t1, T2 t2);

/// {@macro functions.struct.nativestruct}
/// 3
/// {@macro functions.struct.args}
typedef NativeStructFn3<T1 extends ffi.NativeType, T2 extends ffi.NativeType,
        T3 extends ffi.NativeType, TStruct extends ffi.Struct>
    = TStruct Function(T1 t1, T2 t2, T3 t3);

/// {@macro functions.struct.dartstruct}
/// 3
/// {@macro functions.struct.args}
typedef DartStructFn3<T1, T2, T3, TStruct extends ffi.Struct> = TStruct Function(
    T1 t1, T2 t2, T3 t3);

/// {@macro functions.struct.nativestruct}
/// 4
/// {@macro functions.struct.args}
typedef NativeStructFn4<T1 extends ffi.NativeType, T2 extends ffi.NativeType,
        T3 extends ffi.NativeType, T4 extends ffi.NativeType, TStruct extends ffi.Struct>
    = TStruct Function(T1 t1, T2 t2, T3 t3, T4 t4);

/// {@macro functions.struct.dartstruct}
/// 4
/// {@macro functions.struct.args}
typedef DartStructFn4<T1, T2, T3, T4, TStruct extends ffi.Struct> = TStruct Function(
    T1 t1, T2 t2, T3 t3, T4 t4);

/// {@macro functions.struct.nativestruct}
/// 5
/// {@macro functions.struct.args}
typedef NativeStructFn5<
        T1 extends ffi.NativeType,
        T2 extends ffi.NativeType,
        T3 extends ffi.NativeType,
        T4 extends ffi.NativeType,
        T5 extends ffi.NativeType,
        TStruct extends ffi.Struct>
    = TStruct Function(T1 t1, T2 t2, T3 t3, T4 t4, T5 t5);

/// {@macro functions.struct.dartstruct}
/// 5
/// {@macro functions.struct.args}
typedef DartStructFn5<T1, T2, T3, T4, T5, TStruct extends ffi.Struct> = TStruct Function(
    T1 t1, T2 t2, T3 t3, T4 t4, T5 t5);

/// {@macro functions.struct.nativestruct}
/// 6
/// {@macro functions.struct.args}
typedef NativeStructFn6<
        T1 extends ffi.NativeType,
        T2 extends ffi.NativeType,
        T3 extends ffi.NativeType,
        T4 extends ffi.NativeType,
        T5 extends ffi.NativeType,
        T6 extends ffi.NativeType,
        TStruct extends ffi.Struct>
    = TStruct Function(T1 t1, T2 t2, T3 t3, T4 t4, T5 t5, T6 t6);

/// {@macro functions.struct.dartstruct}
/// 6
/// {@macro functions.struct.args}
typedef DartStructFn6<T1, T2, T3, T4, T5, T6, TStruct extends ffi.Struct> = TStruct Function(
    T1 t1, T2 t2, T3 t3, T4 t4, T5 t5, T6 t6);
