for (var i = 0; i < global.streamers_unlocked; i++) {
	if global.line_sound[i] != -1 {
		
		if ((i != global.streamer_on && global.game_state == 1) || (i != global.stream_hovering && global.game_state == 0)) && audio_is_playing(global.line_sound[i])
			audio_stop_sound(global.line_sound[i])
			
		if (i == global.streamer_on && global.game_state == 1) && !audio_is_playing(global.line_sound[i])
			audio_play_sound(global.line_sound[i], 1, 0, 1, global.subtitle_timer[i]/30)
			
		if (i == global.stream_hovering && global.game_state == 0)  && !audio_is_playing(global.line_sound[i])
			audio_play_sound(global.line_sound[i], 1, 0, 0.5, global.subtitle_timer[i]/30)
			
		if global.subtitles[i] == "" && global.banter_subtitles == 0
			global.subtitles[i] = scr_streamer_get_text_by_audio(global.line_sound[i])
	
		global.subtitle_timer[i] += 1;
		
		if global.subtitle_timer[i] >= audio_sound_length(global.line_sound[i])*30 + 15 {
			global.subtitle_timer[i] = 0;
			global.line_sound[i] = -1;
			global.subtitles[i] = "";
		}
	}
	
	if global.subtitles[i] != "" && string_replace(global.subtitles[i], "\n", " ") == global.subtitles[i] {
		var font_width = 6
		var font_width_on = 0;
		var storedspace = 0;
		var textarray = []
		var maxwidth = 304
	
		for (var h = 0; h < string_length(global.subtitles[i]); h++) {
			textarray[h] = string_char_at(global.subtitles[i], h+1)
		}
	
		for (var g = 0; g < string_length(global.subtitles[i]); g++) {
			font_width_on += font_width;
	
			if string_char_at(global.subtitles[i], g) == " "
				storedspace = g;
		
			if font_width_on > maxwidth && storedspace != 0 {
				font_width_on = 0;
				textarray[storedspace-1] = "\n";
				g = storedspace;
			}

	
		}

		global.subtitles[i] = ""
		for (var b = 0; b < array_length(textarray); b++;) {
			global.subtitles[i] += textarray[b];
		}
	}
}

