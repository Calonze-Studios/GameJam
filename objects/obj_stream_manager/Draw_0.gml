if !surface_exists(chatsurf)
	chatsurf = surface_create(259, 323)

for (var a = 0; a < global.streamers_unlocked; a++) {
	if a == global.stream_hovering || (a == global.streamer_on && global.game_state == 1) {
		draw_set_color(c_black);
		//draw_rectangle(0, 0, 912, 513, 0);

		var drawon = 0;
		surface_set_target(chatsurf);

		draw_clear(#0b0018);

		draw_set_font(global.font);
		draw_set_color(c_white);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top)

		var y_offset = 0;
		for (var i = array_length(global.chat_messages[a])-1; i >= 0; i--) {
			drawon++;
			y_offset -= string_height(global.chat_messages[a][i]) + 2;
			draw_text(3, 309 + y_offset, global.chat_messages[a][i]);
		}

		surface_reset_target()
	
		if !surface_exists(global.streamsurf[a]) {
			global.streamsurf[a] = surface_create(912, 513)
		}
	
		surface_set_target(global.streamsurf[a]);
		draw_clear(c_black);
		draw_surface(chatsurf, 3, 191);
		surface_reset_target();
	
		if !surface_exists(global.streamsurf[a]) {
			global.streamsurf[a] = surface_create(912, 513)
		}
	
		surface_set_target(global.streamsurf[a])
	
		draw_sprite(streamer_sprite[a], streamer_frame[a], 4, 2);
		draw_set_halign(fa_right);
		draw_text(910, 2, "chat state: " + string(global.chat_state[a]) + " (" + scr_get_string_by_state(global.chat_state[a]) + ")");
		draw_text(910, 15, "streamer state: " + string(global.streamer_state[a]) + " (" + scr_get_string_by_state(global.streamer_state[a]) + ")");
		draw_text(910, 28, "streamer on: " + string(a+1) + "/" + string(global.streamers_unlocked));
		draw_set_halign(fa_left);
	
		surface_reset_target();
	}
}

surface_reset_target();