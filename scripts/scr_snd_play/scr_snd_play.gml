function scr_snd_play(soundid){
	if !audio_is_playing(soundid)
		audio_play_sound(soundid, 0, 0, global.sfxvolume);
}

function scr_mus_play(soundid){
	audio_play_sound(soundid, 0, 1, global.musvolume);
}