function scr_banter_wait(streamer, wait_length, is_seconds = 0){
	var true_length = wait_length;
	if is_seconds
		true_length *= 30;
		
	scr_banter_cmd(streamer, "wait", true_length);
}