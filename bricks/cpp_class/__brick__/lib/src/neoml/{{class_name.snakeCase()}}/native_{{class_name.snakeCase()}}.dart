part of '{{class_name.snakeCase()}}.dart';

mixin _Native{{class_name.pascalCase()}} {
  static ffi.DynamicLibrary get _lib => Libraries.instance.neoML;

  static Instance initEmpty() {
    final constructor = _lib.lookupFunction<EmptyConstructor, EmptyConstructor>(
      _C{{class_name.pascalCase()}}Functions.initEmpty,
    );

    return constructor();
  }

  static Instance init(double value) {
    final constructor = _lib.lookupFunction<
        ConstructorFFI1<ffi.Double>, Constructor1<double>>(
      _C{{class_name.pascalCase()}}Functions.init,
    );

    return constructor(value);
  }

  double _getValue(Instance instance) {
    final func = _lib.lookupFunction<NativeClassCallbackFn0<ffi.Double>,
        ClassCallbackFn0<double>>(
      _C{{class_name.pascalCase()}}Functions.getValue,
    );

    return func(instance);
  }

  void _setValue(Instance instance, double value) {
    final func = _lib.lookupFunction<
        NativeClassCallbackFn1<ffi.Double, ffi.Void>,
        ClassCallbackFn1<double, void>>(
      _C{{class_name.pascalCase()}}Functions.setValue,
    );

    return func(instance, value);
  }
}