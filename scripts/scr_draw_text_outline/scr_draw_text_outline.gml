function scr_draw_text_outline(_x, _y, str, o_thickness = 1, o_color = c_black) {
	var color_prev = draw_get_color()
	
	draw_set_color(o_color)
	for (var a = -o_thickness; a <= o_thickness; a++) {
		for (var b = -o_thickness; b <= o_thickness; b++) {
			draw_text(_x + a, _y + b, str);
		}
	}
	
	draw_set_color(color_prev);
	draw_text(_x, _y, str);
}

function scr_draw_text_transformed_outline(_x, _y, str, xscale, yscale, o_thickness = 1, o_color = c_black) {
	var color_prev = draw_get_color()
	
	draw_set_color(o_color)
	for (var a = -o_thickness * xscale; a <= o_thickness * xscale; a++) {
		for (var b = -o_thickness * yscale; b <= o_thickness * yscale; b++) {
			draw_text_transformed(_x + a, _y + b, str, xscale, yscale, 0);
		}
	}
	
	draw_set_color(color_prev);
	draw_text_transformed(_x, _y, str, xscale, yscale, 0);
}