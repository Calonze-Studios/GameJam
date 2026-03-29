if !audio_is_playing(mus_ohgod)
	audio_play_sound(mus_ohgod, 0, 1);
	
alpha += 0.0005
alpha = clamp(alpha, 0, 0.1)