if option_sel != -1 {
	if option_sel == 1
		dark_rec_alpha += 0.1
	
	if option_sel == 1 && dark_rec_alpha >= 1 && !alarm_triggered {
		alarm_triggered = 1;
		alarm[0] = 5;
	}
}

if keyboard_check_pressed(vk_anykey) {
	if keyboard_check_pressed(mus_commands[mus_command_on]) {
		mus_command_on++;
	} else {
		mus_command_on = 0;
	}
}

if mus_command_on == array_length(mus_commands) {
	room_goto(room_song);
}

//last_mx = mouse_x