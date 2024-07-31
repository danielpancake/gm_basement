/*
  These macro and functions help
  with most common operations on bounding boxes
*/
#macro bbox_width  (bbox_right - bbox_left)
#macro bbox_height (bbox_bottom - bbox_top)
#macro bbox_cx     ((bbox_right + bbox_left) / 2)
#macro bbox_cy     ((bbox_bottom + bbox_top) / 2)

/// @func bbox_width_of(_inst)
function bbox_width_of(_inst) {
  gml_pragma("forceinline");
  return (_inst.bbox_right - _inst.bbox_left);
}

/// @func bbox_height_of(_inst)
function bbox_height_of(_inst) {
  gml_pragma("forceinline");
  return (_inst.bbox_bottom - _inst.bbox_top);
}

/// @func bbox_cx_of(_inst)
function bbox_cx_of(_inst) {
  gml_pragma("forceinline");
  return (_inst.bbox_right + _inst.bbox_left) / 2;
}

/// @func bbox_cy_of(_inst)
function bbox_cy_of(_inst) {
  gml_pragma("forceinline");
  return (_inst.bbox_bottom + _inst.bbox_top) / 2;
}

/// @func bbox_distance(_inst_a, _inst_b, [_squared])
function bbox_distance(_inst_a, _inst_b, _squared = false) {
  return bbox_distance_manual(
    _inst_a.bbox_right, _inst_a.bbox_top, _inst_a.bbox_left, _inst_a.bbox_bottom,
    _inst_b.bbox_right, _inst_b.bbox_top, _inst_b.bbox_left, _inst_b.bbox_bottom,
    _squared
  );
}

/// @func bbox_distance_manual(_bbox_right_a, _bbox_top_a, _bbox_left_a, _bbox_bottom_a, _bbox_right_b, _bbox_top_b, _bbox_left_b, _bbox_bottom_b, [_squared])
function bbox_distance_manual(
  _bbox_right_a, _bbox_top_a, _bbox_left_a, _bbox_bottom_a,
  _bbox_right_b, _bbox_top_b, _bbox_left_b, _bbox_bottom_b,
  _squared = false
) {
  var _outer_width = max(_bbox_right_a, _bbox_right_b) - min(_bbox_left_a, _bbox_left_b);
  var _outer_height = max(_bbox_bottom_a, _bbox_bottom_b) - min(_bbox_top_a, _bbox_top_b);
  
  var _inner_width = max(0, _outer_width - (_bbox_right_a - _bbox_left_a) - (_bbox_right_b - _bbox_left_b));
  var _inner_height = max(0, _outer_height - (_bbox_bottom_a - _bbox_top_a) - (_bbox_bottom_b - _bbox_top_b));
  
  if (_squared) {
    return sqr(_inner_width) + sqr(_inner_height);
  }
  return point_distance(0, 0, _inner_width, _inner_height);
}

/// @func distance_to_bbox(_x, _y, _inst, [_squared]) {
function distance_to_bbox(_x, _y, _inst, _squared = false) {
  return distance_to_bbox_manual(_x, _y, _inst.bbox_right, _inst.bbox_top, _inst.bbox_left, _inst.bbox_bottom, _squared);
}

/// @func distance_to_bbox_manual(_x, _y, _bbox_right, _bbox_top, _bbox_left, _bbox_bottom, [_squared]) {
function distance_to_bbox_manual(_x, _y, _bbox_right, _bbox_top, _bbox_left, _bbox_bottom, _squared = false) {
  if (in_range(_x, _bbox_left, _bbox_right) && in_range(_y, _bbox_top, _bbox_bottom)) {
    return 0;
  }
  
  var _xx = median(_x, _bbox_left, _bbox_right);
  var _yy = median(_y, _bbox_top, _bbox_bottom);
  
  if (_squared) {
    return sqr(_x - _xx) + sqr(_y - _yy);
  }
  return point_distance(_x, _y, _xx, _yy);
}
