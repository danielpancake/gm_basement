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

/// @func distance_to_bbox(_x, _y, _bbox_right, _bbox_top, _bbox_left, _bbox_bottom) {
function distance_to_bbox(_x, _y, _bbox_right, _bbox_top, _bbox_left, _bbox_bottom) {
  if (in_range(_x, _bbox_left, _bbox_right) && in_range(_y, _bbox_top, _bbox_bottom)) {
    return 0;
  }
  
  var _xx = median(_x, _bbox_left, _bbox_right);
  var _yy = median(_y, _bbox_top, _bbox_bottom);
  return point_distance(_x, _y, _xx, _yy);
}
