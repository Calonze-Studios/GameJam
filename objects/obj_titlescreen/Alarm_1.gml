if beginning_alarm_counter != 0 {
	if beginning_alarm_counter % 2 == 0 {
		dark_rec_alpha = 0.5;
	} else {
		dark_rec_alpha = 0.8;
	}
	beginning_alarm_counter -= 1;
	alarm[1] = 1;
} else {
	state = 1;
	dark_rec_alpha = 0;
}