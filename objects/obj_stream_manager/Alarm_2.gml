for (var i = 0; i < global.streamers_unlocked; i++) {
	if streamer_trigger[i] == 1 && streamer_trigger_timer[i] >= 44 {
		streamer_adding_rate[i] += 0.1;
		
		alarm[2] = 15;
	}
}