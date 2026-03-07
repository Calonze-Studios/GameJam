if command_triggered[command_on] || array_length(command_arg0) <= 0
	exit;	

command_triggered[command_on] = true;

if command_arg0[command_on] == "streamer_say" {
	scr_streamer_say(streamer_target, command_arg1[command_on])
	
	command_on++;
}

if command_arg0[command_on] == "set_subtitles" {
	global.subtitles[streamer_target] = command_arg1[command_on];
	global.banter_subtitles = 1;
	
	command_on++;
}

if command_arg0[command_on] == "change_streamer_state" {
	scr_streamer_change_state(command_arg1[command_on], streamer_target);
	
	command_on++;
}

if command_arg0[command_on] == "change_chat_state" {
	scr_chat_change_state(command_arg1[command_on], streamer_target);
	
	command_on++;
}

if command_arg0[command_on] == "wait" {
	alarm[0] = command_arg1[command_on];
}

if command_arg0[command_on] == "banter_over" {
	global.banter_subtitles = 0;
	instance_destroy();
}