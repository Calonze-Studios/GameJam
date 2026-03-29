function scr_streamer_change_state(state, streamer = global.streamer_on) {
	global.streamer_state[streamer] = state;
	global.streamer_speed[streamer] = global.streamer_speed_fastest[streamer];
}