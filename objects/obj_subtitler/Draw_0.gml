for (var i = 0; i < global.streamers_unlocked; i++) {
	if i == global.stream_hovering || i == (global.streamer_on && global.game_state == 1) {
		if !surface_exists(global.streamsurf[i])
			global.streamsurf[i] = surface_create(912, 513)
	
		draw_set_halign(fa_middle);
		draw_set_valign(fa_bottom)
		draw_set_font(global.font);
		surface_set_target(global.streamsurf[i])
		//draw_clear_alpha(c_black, 0);
	
		scr_draw_text_transformed_outline(456, 490, global.subtitles[i], 2, 2, 2);
	
		surface_reset_target();
	}
}