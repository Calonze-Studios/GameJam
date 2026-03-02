function scr_add_streamer(spd_norm = 2, spd_max = 6, chat_spd_norm = 30, chat_spd_max = 7, game = 0, sprite = 0) {
	global.streamers_unlocked++;
	
	array_push(global.streamer_speed, spd_norm);
	array_push(global.streamer_speed_norm, spd_norm);
	array_push(global.streamer_speed_fastest, spd_max);
	array_push(global.streamer_sprite, sprite);
	array_push(global.streamer_state, 0);
	
	array_push(global.chat_rate, chat_spd_norm);
	array_push(global.chat_rate_norm, chat_spd_norm);
	array_push(global.chat_rate_fastest, chat_spd_max);
	array_push(global.chat_state, 0);
	array_push(global.chat_messages, []);
	
	array_push(global.streamer_game, game);
	array_push(global.streamer_game_state, 0);
	
	array_push(global.subtitles, "");
	array_push(global.subtitle_timer, 0);
	array_push(global.line_sound, -1);
	
	
}