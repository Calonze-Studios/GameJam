function scr_chat_change_state(state, streamer = global.streamer_on) {
	global.chat_state[streamer] = state;
	global.chat_rate[streamer] = global.chat_rate_fastest[streamer];
	// is this for testing or intended?
}