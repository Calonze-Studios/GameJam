if surface_get_target() != application_surface {
	surface_reset_target();
	surface_set_target(application_surface);
}


if open {
	var width = array_length(global.inventory) * 139 + 40;
	
	draw_set_alpha(0.75);
	draw_set_color(c_white);
	
	draw_rectangle(x + 30, y + drawyoffset + 4, x + width + 30, y + drawyoffset + 68 - 4, 0);
	
	draw_set_alpha(1)
	
	for (var i = 0; i < array_length(global.inventory); i++) {
		scr_shop_item_get_info(global.inventory[i]);
		draw_sprite(image, 0, x + 70 + 139*i, y + drawyoffset - sprite_get_height(image) + 60);
		
		draw_set_halign(fa_right);
		draw_set_valign(fa_bottom);
		scr_draw_text_outline(x + 70 + 139*i + sprite_get_width(image) - 3, y + drawyoffset + 60 - 2, string(global.inventory_item_count[i]) + "x", 1)
		
		var hover = 0;
		if mouse_x >= x + 70 + 139*i && mouse_x <= x + 79 + 139*i + sprite_get_width(image) && mouse_y >= y + drawyoffset - sprite_get_height(image) + 60 && mouse_y <= y + drawyoffset - + 60
			hover = 1;
			
		draw_set_halign(fa_middle);
		draw_set_valign(fa_bottom);
		if hover {
			scr_draw_text_transformed_outline(x + 70 + 139*i + (sprite_get_width(image)/2), y + drawyoffset - sprite_get_height(image) + 60 - 5, name, 2, 2, 1);
		}
		if hover && mouse_check_button_pressed(mb_left)
			scr_item_use(global.inventory[i]);
			
	}
	
}

draw_sprite_ext((sprite == 0 ? spr_inv : spr_inv_pressed), frame, x - ((sprite_width * xscale) - sprite_width)/2, y + drawyoffset - ((sprite_height * yscale) - sprite_height)/2, xscale, yscale, 0, c_white, 1);