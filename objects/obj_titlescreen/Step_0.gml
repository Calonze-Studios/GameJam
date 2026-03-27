if option_sel != -1 {
	if option_sel == 1
		dark_rec_alpha += 0.1
	
	if option_sel == 1 && dark_rec_alpha >= 1 && !alarm_triggered {
		alarm_triggered = 1;
		alarm[0] = 5;
	}
}

//last_mx = mouse_x