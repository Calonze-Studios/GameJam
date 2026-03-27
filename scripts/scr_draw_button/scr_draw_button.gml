function scr_draw_button(_x, _y, str, col, txt_col, hover_col = -1, txt_hover_col = -1, text_xscale = 1, text_yscale = 1, o_thickness = 0, o_color = c_black){
	var why_not_used_in_some_objects = "only thought of it when cdc suggested it";
	
	var bx = _x - 20;
	var by = _y - 20;
	
	if draw_get_halign() == fa_right
		bx = _x - (string_width(str)*text_xscale) - 20;
	if draw_get_valign() == fa_bottom
		by = _y - (string_height(str)*text_xscale) - 20;
	
	if draw_get_halign() == fa_middle
		bx = _x - (string_width(str)/2*text_xscale) - 20;
	if draw_get_valign() == fa_center
		by = _y - (string_height(str)/2*text_xscale) - 20;
	
	var mx0 = bx + 20
	var mx1 = bx + 20 + (string_width(str)*text_xscale)
	
	var my0 = by + 20
	var my1 = by + 20 + (string_height(str)*text_yscale)
	
	var hover = 0;
	
	if mouse_x >= mx0 && mouse_x <= mx1 && mouse_y >= my0 && mouse_y <= my1
		hover = 1;
	
	draw_set_color(hover && hover_col != -1 ? hover_col : col);
	draw_rectangle(bx, by, bx + (string_width(str)*text_xscale) + 20, by + (string_height(str)*text_yscale) + 20, 0);
	
	draw_set_color(hover && txt_hover_col != -1 ? txt_hover_col : txt_col);
	scr_draw_text_transformed_outline(_x, _y, str, text_xscale, text_yscale, o_thickness, o_color)
	
}

function scr_draw_button_sprite(_x, _y, str, spr, txt_col, hover_spr = -1, txt_hover_col = -1, text_xscale = 1, text_yscale = 1, o_thickness = 0, o_color = c_black, push_down = 1){
	var why_not_used_in_some_objects = "only thought of it when cdc suggested it";
	
	var bx = _x - 20;
	var by = _y - 20;
	
	var bxscale = (string_width(str)*text_xscale + 40)/sprite_get_width(spr)
	var byscale = (string_height(str)*text_yscale + 40)/sprite_get_height(spr)
	
	if draw_get_halign() == fa_right
		bx = _x - (string_width(str)*text_xscale) - 20;
	if draw_get_valign() == fa_bottom
		by = _y - (string_height(str)*text_xscale) - 20;
	
	if draw_get_halign() == fa_middle
		bx = _x - (string_width(str)/2*text_xscale) - 20;
	if draw_get_valign() == fa_center
		by = _y - (string_height(str)/2*text_xscale) - 20;
	
	var mx0 = bx + 20
	var mx1 = bx + 20 + (string_width(str)*text_xscale)
	
	var my0 = by + 20
	var my1 = by + 20 + (string_height(str)*text_yscale)
	
	var hover = 0;
	
	if mouse_x >= mx0 && mouse_x <= mx1 && mouse_y >= my0 && mouse_y <= my1
		hover = 1;
	
	draw_sprite_ext(hover && hover_spr != -1 ? hover_spr : spr, 0, bx, by + hover*2*push_down, bxscale, byscale, 0, c_white, 1)
	
	draw_set_color(hover && txt_hover_col != -1 ? txt_hover_col : txt_col);
	scr_draw_text_transformed_outline(_x, _y + hover*2*push_down, str, text_xscale, text_yscale, o_thickness, o_color)
	
	return hover
	
}