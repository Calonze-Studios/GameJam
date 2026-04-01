function scr_get_string_by_state(state = global.streamer_state[global.streamer_on]){
	if state == 0
		return "idle";
	if state == 1
		return "happy";
	if state == 2 
		return "angry";
	if state == 3
		return "think";
}