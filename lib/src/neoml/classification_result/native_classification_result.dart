part of 'classification_result.dart';

mixin _NativeClassificationResult {
  static ffi.DynamicLibrary get _lib => Libraries.instance.neoML;

  int _probSize(Instance instance) {
    final func = _lib.lookupFunction<NativeClassCallbackFn0<ffi.Int32>,
        ClassCallbackFn0<int>>(
      _CClassificationResultFunctions.probSize,
    );

    return func(instance);
  }

  int _preferredClass(Instance instance) {
    final func = _lib.lookupFunction<NativeClassCallbackFn0<ffi.Int32>,
        ClassCallbackFn0<int>>(
      _CClassificationResultFunctions.getPreferredClass,
    );

    return func(instance);
  }

  double _exceptionProbability(Instance instance) {
    final func = _lib.lookupFunction<NativeClassCallbackFn0<ffi.Double>,
        ClassCallbackFn0<double>>(
      _CClassificationResultFunctions.exceptionProbability,
    );

    return func(instance);
  }

  List<double> _getProbabilities(Instance instance) {
    final func = _lib.lookupFunction<
        NativeCallbackFn1<Instance, ffi.Pointer<ffi.Double>>,
        CallbackFn1<Instance, ffi.Pointer<ffi.Double>>>(
      _CClassificationResultFunctions.getProbabilities,
    );

    final probSize = _probSize(instance);
    // final ss = ffi.calloc<Instance>(probSize);
    // ss.value = ffi.Pointer.fromAddress(func(instance).address);

    // print('Prob size: $probSize');
    // print('Sizeof: ${ffi.sizeOf<ffi.Pointer<Instance>>()}');

    // final output = List.generate(probSize, (index) {
    //   final element = ClassificationProbability.fromInstance(ss[index]);
    //   return element;
    // });

    // final result = func(instance);

    // final output = List.generate(probSize, (index) {
    //   final r = ClassificationProbability.fromInstance(result.elementAt(index));
    //   return r;
    // });

    return func(instance).asTypedList(probSize);
  }
}
