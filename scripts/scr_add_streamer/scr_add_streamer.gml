function scr_add_streamer(spd_norm = 1, spd_max = 3, chat_spd_norm = 60, chat_spd_max = 15, game = 0, sprite = 0) {
	global.streamers_unlocked++;
	
	array_push(global.streamer_speed, spd_norm);
	array_push(global.streamer_speed_norm, spd_norm);
	array_push(global.streamer_speed_fastest, spd_max);
	array_push(global.streamer_sprite, 0);
	array_push(global.streamer_state, 0);
	
	array_push(global.chat_rate, chat_spd_norm);
	array_push(global.chat_rate_norm, chat_spd_norm);
	array_push(global.chat_rate_fastest, chat_spd_max);
	array_push(global.chat_state, 0);
	array_push(global.chat_messages, []);
	
	array_push(global.streamer_game, game);
	array_push(global.streamer_game_state, 0);
}