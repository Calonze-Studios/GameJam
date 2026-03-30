if !surface_exists(chatsurf)
	chatsurf = surface_create(259, 323)

for (var a = 0; a < global.streamers_unlocked; a++) {
	var is_on_streamer = a == global.streamer_on;
	if a == global.stream_hovering || (is_on_streamer && global.game_state == 1) {
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
			
			var chat_parts = string_split(global.chat_messages[a][i],": ");
			var x_offset = 3;
			
			for (var j = 0; j < 2;j++){
				var text_lines = string_split(chat_parts[j],"\n");
				var local_y_offset = 0;
				
				for (var k = 0; k<array_length(text_lines);k++) {
					if (k > 0) {
						x_offset = 3;
					}
					var text = text_lines[k];
					if (j == 0) {
						draw_set_color(scr_color_from_name(text));
						text = text + "  ";
					}
					draw_text(x_offset, 309 + y_offset + local_y_offset, text);
					x_offset += string_width(text);
					draw_set_color(c_white);
					local_y_offset += string_height(text);
				}
			}
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
		if (instance_exists(global.streamer_game[a])){
			if (variable_instance_exists(global.streamer_game[a],"my_surface")){
				if (!surface_exists(global.streamer_game[a].my_surface))
					global.streamer_game[a].my_surface = surface_create(640, 480);
				
				draw_surface(global.streamer_game[a].my_surface,270,18);
			}
		} else {
			draw_text(270,18,"There is no game.");
		}
		//show_debug_message(instance_exists(global.ste))
		draw_set_halign(fa_right);
		draw_text(910, 2, "chat state: " + string(global.chat_state[a]) + " (" + scr_get_string_by_state(global.chat_state[a]) + ")");
		draw_text(910, 15, "streamer state: " + string(global.streamer_state[a]) + " (" + scr_get_string_by_state(global.streamer_state[a]) + ")");
		draw_text(910, 28, "streamer on: " + string(a+1) + "/" + string(global.streamers_unlocked));
		draw_set_halign(fa_left);
	
		surface_reset_target();
	}
}

surface_reset_target();