/// @func approach(_a, _b, _shift)
/// @arg {Real} _a
/// @arg {Real} _b
/// @arg {Real} _shift
/// @returns {Real}
function approach(_a, _b, _shift) {
  gml_pragma("forceinline");
  return (_a < _b) ? min(_a + _shift, _b) : max(_a - _shift, _b);
}

/// @func in_range(_val, _low, _high)
/// @desc Returns whether the value is contained inclusively within the given interval
/// @arg {Real} _val
/// @arg {Real} _low
/// @arg {Real} _high
/// @returns {Bool}
function in_range(_val, _low, _high) {
  gml_pragma("forceinline");
  return (_val >= _low) && (_val <= _high);
}

/// @func amin(_a, _b)
/// @desc Returns a value with the min absolute value
/// @param {Real} _a
/// @param {Real} _b
function amin(_a, _b) {
  gml_pragma("forceinline");
  return (abs(_a) < abs(_b)) ? _a : _b;
}

/// @func amax(_a, _b)
/// @desc Returns a value with the max absolute value
/// @param {Real} _a
/// @param {Real} _b
function amax(_a, _b) {
  gml_pragma("forceinline");
  return (abs(_a) > abs(_b)) ? _a : _b;
}

/// @func dlerp(_a, _b, _t)
/// @param {Real} _a
/// @param {Real} _b
/// @param {Real} _t
/// @returns {Real}
function dlerp(_a, _b, _t, _dt = dt) {
  gml_pragma("forceinline");
  return lerp(_a, _b, 1 - power(1 - _t, _dt));
}

/// @func wrap_angle(_a)
/// @param {Real} _a
function wrap_angle(_a) {
  var _d = _a - floor(_a / 360) * 360;
  return (_d > 180 ? _d - 360 : _d);
}

/// @func alerp(_a, _b, _t)
/// @param {Real} _a
/// @param {Real} _b
/// @param {Real} _t
/// @returns {Real}
function alerp(_a, _b, _t) {
  gml_pragma("forceinline");
  return lerp(_a, _a + wrap_angle(_b - _a), _t);
}

/// @func dalerp(_a, _b, _t)
/// @param {Real} _a
/// @param {Real} _b
/// @param {Real} _t
/// @returns {Real}
function dalerp(_a, _b, _t, _dt = dt) {
  gml_pragma("forceinline");
  return alerp(_a, _b, 1 - power(1 - _t, _dt));
}

/// @func fmod(_a, _b)
/// @param {Real} _a
/// @param {Real} _b
function fmod(_a, _b) {
  return _a - _b * floor(_a / _b);
}

/// @func wrap(_a, _min, _max)
/// @desc Wraps a value inside the range
/// @param {Real} _a
/// @param {Real} _min
/// @param {Real} _max
function wrap(_a, _min, _max) {
  return fmod(_a - _min, _max - _min + 1) + _min;
}

/// @func sign_pos(_x)
/// @desc Sign function with a bias to positive values i.e. `sign(0) = 1`
/// @param {Real} _x
function sign_pos(_x) {
  gml_pragma("forceinline");
  return sign(_x) == 0 ? 1 : sign(_x);
}

/// @func sign_neg(_x)
/// @desc Sign function with a bias to negative values i.e. `sign(0) = -1`
/// @param {Real} _x
function sign_neg(_x) {
  gml_pragma("forceinline");
  return sign(_x) == 0 ? -1 : sign(_x);
}

/// @func map_value(_x, _in_min, _in_max, _out_min, _out_max)
function map_value(_x, _in_min, _in_max, _out_min, _out_max) {
  gml_pragma("forceinline");
  return (((_x - _in_min) / (_in_max - _in_min)) * (_out_max - _out_min)) + _out_min;
}

/// @func map_norm_value(_x, _out_min, _out_max)
/// @desc Same as `map_value(_x, 0, 1, _out_min, _out_max)`
function map_norm_value(_x, _out_min, _out_max) {
  gml_pragma("forceinline");
  return _x * (_out_max - _out_min) + _out_min;
}
