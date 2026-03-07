function scr_streamer_say(streamer, line_id) {
	if array_length(global.line_sound) > streamer {
		if audio_is_playing(line_id)
			audio_stop_sound(line_id);
			
		if audio_is_playing(global.line_sound[streamer])
			audio_stop_sound(global.line_sound[streamer]);
		
		global.subtitle_timer[streamer] = 0;
		global.subtitles[streamer] = "";
	
		global.line_sound[streamer] = line_id;
	}
}