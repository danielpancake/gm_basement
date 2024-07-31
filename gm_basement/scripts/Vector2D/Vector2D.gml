/// @func Vector2D([_x], [_y])
/// @desc Vector2D Class. Has a lot of functions to avoid unnecessary copying
function Vector2D(_x, _y): Point2D(_x, _y) constructor {
  
  /// @func set([_x], [_y])
  /// @desc Sets the vector's components
  static set = function(_x = 0, _y = 0) {
    x = _x;
    y = _y;
    return self;
  }
  
  /// @func set_polar([_dir], [_magnitude])
  /// @desc Sets the vector's components from polar
  static set_polar = function(_dir = 0, _magnitude = 1) {
    x = lengthdir_x(_magnitude, _dir);
    y = lengthdir_y(_magnitude, _dir);
    return self;
  }
  
  /// @func added(_v)
  /// @desc Adds another vector to the vector
  static added = function(_v) {
    x += _v.x;
    y += _v.y;
    return self;
  }
  
  /// @func added_scaled(_v, _c)
  /// @desc Adds another vector to the vector scaled by a constant
  static added_scaled = function(_v, _c) {
    x += _v.x * _c;
    y += _v.y * _c;
    return self;
  }
  
  /// @func added_polar(_dir, [_magnitude])
  /// @desc Adds a polar vector by magnitude and direction
  static added_polar = function(_dir, _magnitude = 1) {
    x += lengthdir_x(_magnitude, _dir);
    y += lengthdir_y(_magnitude, _dir);
    return self;
  }
  
  /// @func subtracted(_v)
  static subtracted = function(_v) {
    x -= _v.x;
    y -= _v.y;
    return self;
  }
  
  /// @func scaled(_c)
  /// @desc Scales the vector by a constant
  static scaled = function(_c) {
    x *= _c;
    y *= _c;
    return self;
  }
  
  /// @func is_degenerate()
  /// @desc Returns true if the vector is degenerate (magnitude is 0)
  /// @returns {Bool}
  static is_degenerate = function(_eps = .001) {
    gml_pragma("forceinline");
    return get_magnitude() < _eps;
  }
  
  /// @func get_magnitude()
  /// @desc Returns the magnitude of the vector
  static get_magnitude = function() {
    gml_pragma("forceinline");
    return sqrt(sqr(x) + sqr(y));
  }
  
  /// @func set_magnitude(_c)
  /// @desc Sets the magnitude of the vector
  static set_magnitude = function(_c) {
    gml_pragma("forceinline");
    return scaled(_c / get_magnitude());
  }
  
  /// @func limit_magnitude(_limit)
  /// @desc Limits the magnitude of the vector
  static limit_magnitude = function(_limit) {
    if (get_magnitude() > _limit) {
      set_magnitude(_limit);
    }
    return self;
  }
  
  /// @func get_direction()
  /// @desc Returns the direction of the vector in degrees
  static get_direction = function() {
    gml_pragma("forceinline");
    return point_direction(0, 0, x, y);
  }
  
  /// @func dot(_v)
  /// @desc Returns the dot product of the vector and another vector
  static dot = function(_v) {
    gml_pragma("forceinline");
    return x * _v.x + y * _v.y;
  }
  
  /// @func copy()
  /// @desc Makes a copy of the current vector
  static copy = function() {
    return Vector2D(x, y);
  }
}

/// @func Vector2DPolar([_dir], [_magnitude])
function Vector2DPolar(_dir = 0, _magnitude = 1): Vector2D(
  lengthdir_x(_magnitude, _dir),
  lengthdir_y(_magnitude, _dir)
) constructor {}
