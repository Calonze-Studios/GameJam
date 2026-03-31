function scr_add_random_streamer(){
	
	show_debug_message("it's almost 12 am...")
	
	var spd_norm = irandom_range(3, 5);
	var spd_max = spd_norm+4;
	var chat_spd_norm = irandom_range(25, 35);
	var chat_spd_max = clamp(chat_spd_norm-23, 10, 999);
	var sprite = irandom_range(0, 3);
	for (var i = 0; i < global.streamers_unlocked; i++) {
		if sprite == global.streamer_sprite[i]
			sprite = irandom_range(0, 3);
			
	}
	
	scr_add_streamer(spd_norm, spd_max, chat_spd_norm, chat_spd_max, 0, sprite);
}