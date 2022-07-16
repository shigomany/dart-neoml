part of '{{class_name.snakeCase()}}.dart';

// This class provides name functions in C dynamic library for class `C{{class_name.pascalCase()}}`
class _C{{class_name.pascalCase()}}Functions {
  static const init = 'C{{class_name.pascalCase()}}Init';

  static const initEmpty = 'C{{class_name.pascalCase()}}InitEmpty';

  static const getValue = 'C{{class_name.pascalCase()}}GetValue';

  static const setValue = 'C{{class_name.pascalCase()}}SetValue';

  const _C{{class_name.pascalCase()}}Functions._();
}