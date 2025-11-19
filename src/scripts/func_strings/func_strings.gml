// @func text_get_rect(_text, [_x], [_y], [_xscale], [_yscale], [_halign], [_valign], [_font])
/// TODO: add max_width check
function text_get_rect(_text, _x = 0, _y = 0, _xscale=1, _yscale=1, _halign=draw_get_halign(), _valign=draw_get_valign(), _font=draw_get_font()) {
    gpu_push_state();
        draw_set_font(_font);
        
        var _w = string_width(_text) * _xscale;
        var _h = string_height(_text) * _yscale;
    gpu_pop_state();
    
    var _x1 = -_w * alignment_to_anchor(_halign);
    var _x2 = _w * (1 - alignment_to_anchor(_halign));
    
    var _y1 = -_h * alignment_to_anchor(_valign);
    var _y2 = _h * (1 - alignment_to_anchor(_valign));
    
    return [_x + _x1, _y + _y1, _x + _x2, _y + _y2];
}

/// @func alignment_to_anchor(_align)
function alignment_to_anchor(_align) {
    switch (_align) {
        default:
        case fa_top:
        case fa_left:
            return 0;
        case fa_center:
        case fa_middle:
            return 0.5;
        case fa_bottom:
        case fa_right:
            return 1;
    }
}
