if surface_get_target() != application_surface {
	surface_reset_target();
	surface_set_target(application_surface);
}
	
draw_sprite_ext(_state == 0 ? spr_phone : spr_phone_on, frame, x - ((sprite_width * xscale) - sprite_width)/2, y + drawyoffset - ((sprite_height * yscale) - sprite_height)/2, xscale, yscale, 0, c_white, 1)