depth = settings_depth
draw_set_alpha(1);
draw_sprite_ext(spr_settings_browser_nineslice, 0, x, y, options_width/(sprite_get_width(spr_settings_browser_nineslice)), options_height/sprite_get_height(spr_settings_browser_nineslice), 0, c_white, 1);

draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_set_color(c_white)
draw_text(x + 4, y + 3, "Settings.exe");

draw_set_color(#c2c2c2);
draw_rectangle(x + 3, y + 15, x + 150, y + 20, 0)

var hover = 0;
if mouse_x >= x + options_width - 15 && mouse_x <= x + options_width - 4 && mouse_y >= y + 2 && mouse_y <= y + 13 && !(mouse_x >= description_x && mouse_x < description_x + description_width && mouse_y >= description_y && mouse_y <= description_y + description_height)
	hover = 1;

draw_sprite(spr_settings_x, hover, x + options_width - 15, y + 2);

if hover && mouse_check_button_pressed(mb_left) 
	state = 2;

surface_set_target(option_surface);
if state != 0 {
	draw_clear(c_white);
	
	var yoffset = 4;
	draw_set_color(c_black);
	
	for (var i = 0; i < array_length(global.settings_name); i++) {
		draw_text_transformed(2, yoffset, global.settings_name[i], 2, 2, 0);
		if global.settings_type[i] == "bool" {
			draw_sprite_ext(spr_settings_bool, global.settings_value[i], 2 + (string_width(global.settings_name[i])*2) + 10, yoffset, 2, 2, 0, c_white, 1)
			if mouse_x >= x + 4 + 2 + (string_width(global.settings_name[i])*2) + 10 && mouse_x <= x + 4 + 2 + (string_width(global.settings_name[i])*2) + 42 && mouse_y >= y + 21 + yoffset && mouse_y <= y + 21 + yoffset + 32 && mouse_check_button_pressed(mb_left) {
				scr_setting_edit_value(global.settings_key[i], global.settings_section[i], global.settings_name[i], !(global.settings_value[i]))
			}
		}
		if global.settings_type[i] == "string" {
			var arrw = [];
			var arrh = []
			for (var b = 0; b < array_length(global.settings_options[i]); b++) {
				arrw[b] = string_width(global.settings_options[i][b]);
				arrh[b] = string_height(global.settings_options[i][b])
			}
			
			var maxwidth = script_execute_ext(max, arrw);
			var maxheight = script_execute_ext(max, arrh)			
			
			
			var _x = 2 + (string_width(global.settings_name[i])*2) + 10
			
			var w = _x + maxwidth*2 + 2;
			var h = yoffset + maxheight*2 + 2;
			
			var _hover = 0;
			if mouse_x >= x + 4 + _x && mouse_x <= x + 4 + w && mouse_y >= y + 23 + yoffset - 2 && mouse_y <= y + 23 + h
				_hover = 1;
			
			var preclick = options_clicked;
			
			if _hover && mouse_check_button_pressed(mb_left) && options_clicked == 0 {
				options_clicked = i;
			}
			
			if _hover && preclick != 0 && mouse_check_button_pressed(mb_left)
				options_clicked = 0;
			
			draw_set_color(_hover ? #ebebeb : #c2c2c2);
			draw_rectangle(_x, yoffset - 2, w, h, 0);
			
			draw_set_color(c_black);
			draw_rectangle(_x, yoffset - 2, w, h, 1);
			draw_rectangle(_x - 1, yoffset - 3, w + 1, h + 1, 1);
			
			draw_text_transformed(_x + 2, yoffset + 1, global.settings_value[i], 2, 2, 0)
			
			if options_clicked == i {
				depth = settings_depth-1;
				for (var c = 0; c < array_length(global.settings_options[i]); c++) {
					show_debug_message(c)
					var __hover = 0;
					var _y = yoffset + ((maxheight*2 + 2) * (c+1));
					var _h = h + ((maxheight*2 + 2)*(c+1));
					
					if mouse_x >= x + 4 + _x && mouse_x <= x + 4 + w && mouse_y > y + 23 + _y && mouse_y <= y + 23 + _h
						__hover = 1;
					
					draw_set_color(__hover ? #f7f7f7 : #c2c2c2);
					draw_rectangle(_x, _y, w, _h, 0);
					
					draw_set_color(c_black)
					draw_rectangle(_x, _y, w, _h, 1);
					draw_rectangle(_x - 1, _y - 1, w + 1, _h + 1, 1);
					
					draw_text_transformed(_x + 2, _y + 3, global.settings_options[i][c], 2, 2, 0)
					
					if __hover && mouse_check_button_pressed(mb_left) {
						scr_setting_edit_value(global.settings_key[i], global.settings_section[i], global.settings_name[i], global.settings_options[i][c]);
						options_clicked = 0;
					}
					
				}
				depth = settings_depth;
			}
			
			if !_hover && mouse_check_button_pressed(mb_left) {
				options_clicked = 0;
			}
			
		}
		
		var butthover = 0;
		if mouse_x >= x + 4 + 443 && mouse_x <= x + 4 + 443 + 32 && mouse_y >= y + 23 + yoffset && mouse_y <= y + 23 + yoffset + 32
			butthover = 1;
		
		if butthover && mouse_check_button_pressed(mb_left) {
			description_target = i;
		}
		
		draw_sprite_ext(spr_settings_descbutt, butthover, 443, yoffset, 2, 2, 0, c_white, 1);
		
		yoffset += (string_height(global.settings_name[i])*2) + 10;
	}
	
	
	
} else {
	
	draw_clear(#c2c2c2);
	
	var spr = spr_placeholder_loading;
	var xscale = 1;
	var yscale = 1;
	
	draw_sprite(spr, floor(loading_frame), (477/2) - (sprite_get_width(spr)*xscale), (surface_get_height(option_surface)/2) - (sprite_get_height(spr)*yscale/2))
	
}
surface_reset_target();

draw_surface(option_surface, x + 4, y + 23)

depth = description_depth;

if description_state != -1 {
	draw_sprite_ext(spr_settings_browser_nineslice, 0, description_x, description_y, description_width/(sprite_get_width(spr_settings_browser_nineslice)), description_height/sprite_get_height(spr_settings_browser_nineslice), 0, c_white, 1);

	draw_set_color(c_white)
	draw_text(description_x + 4, description_y + 3, string(global.settings_name[description_target]) + ".txt");

	draw_set_color(#c2c2c2);
	draw_rectangle(description_x + 3, description_y + 15, description_x + 300, description_y + 20, 0)

	surface_set_target(description_surface);
	draw_clear(c_white);
	
	var txt = scr_get_setting_description_by_name(global.settings_name[description_target])
	
	draw_set_color(c_black)
	draw_set_font(font_mediumshop)
	draw_text_ext(2, -10, txt, 28, surface_get_width(description_surface));
	draw_set_font(global.font)
	surface_reset_target()
	
	var XBUTThover = 0;
	if mouse_x >= description_x + description_width - 15 && mouse_x <= description_x + description_width - 4 && mouse_y >= description_y + 2 && mouse_y <= description_y + 13
		XBUTThover = 1;
		
	draw_sprite(spr_settings_x, XBUTThover, description_x + description_width - 15, description_y + 2);
	
	if XBUTThover && mouse_check_button_pressed(mb_left)
		description_state = 2;
	
	draw_surface(description_surface, description_x + 4, description_y + 23);
	
}

//draw_sprite_ext(spr_settings_browser_nineslice, 0, x, y, options_width/(sprite_get_width(spr_settings_browser_nineslice)), options_height/sprite_get_height(spr_settings_browser_nineslice), 0, c_white, 1);