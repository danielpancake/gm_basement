/// @func noop()
function noop() {
    gml_pragma("forceinline");
    return undefined;
}

/// @func is_defined(_x);
function is_defined(_x) {
    return !is_undefined(_x);
}

/// @func null(_x)
function null(_x) {
    gml_pragma("forceinline");
    return 0;
}

/// @func identity(_x)
function identity(_x) {
    gml_pragma("forceinline");
    return _x;
}

/// @func eq2(_a, _b)
function eq2(_a, _b) {
    gml_pragma("forceinline");
    return _a == _b;
}

/// @func sum2(_a, _b)
function sum2(_a, _b) {
    gml_pragma("forceinline");
    return _a + _b;
}

/// @func minuend(_a, _b)
function minuend(_a, _b) {
    gml_pragma("forceinline");
    return _a - _b;
}

/// @func subtrahend(_b, _a)
function subtrahend(_b, _a) {
    gml_pragma("forceinline");
    return _a - _b;
}

/// @func is_positive(_value)
function is_positive(_value) {
    gml_pragma("forceinline");
    return _value > 0;
}

/// @func is_zero(_value)
function is_zero(_value) {
    gml_pragma("forceinline");
    return _value == 0;
}

/// @func is_negative(_value)
function is_negative(_value) {
  gml_pragma("forceinline");
  return _value < 0;
}

/// @func compose(_f, _g)
/// @desc Composes two functions together
function compose(_f, _g) {
  return method({_f, _g}, function(/*...*/) {
    argument_make_array = argument[argument_index];
    return _f(method_call(_g, argument_array));
  });
}


/// @func call_defined(...)
/// @desc Calls the first argument function, only if it is defined
function call_defined(/*...*/) {
    if (argument_count == 0 || is_undefined(argument[0])) {
        exit;
    }
    
    if (argument_count == 1) {
        argument[0]();
    } else {
        argument_make_array = argument[argument_index];
        method_call(argument[0], argument_array, 1);
    }
}
