function scr_banter(streamer, _id) {
	scr_banter_begin(streamer);
	switch _id {
		case 0:
			scr_banter_streamer_say(streamer, snd_boy_banter0)
			scr_banter_change_streamer_state(streamer, 1);
			scr_banter_set_subtitles(streamer, "(Unintelligible) I sure do love spending 40 USD on this video game from 19-- 2004!")
			scr_banter_wait(streamer, 8, 1)
			scr_banter_change_streamer_state(streamer, 0);
			scr_banter_set_subtitles(streamer, "(That I definitely didn't pirate on my 3DS like a normal person!)")
			scr_banter_wait(streamer, 4, 1)
			scr_banter_set_subtitles(streamer, "This is a placeholder. Don't put it in the game, please remove it afterwards, like other placeholders.")
			scr_banter_wait(streamer, 5.5, 1)
			scr_banter_change_streamer_state(streamer, 1);
			scr_banter_set_subtitles(streamer, "So Nintendo doesn't sue us! (Unintelligible) Pokemon for free Vbuvks.")
			scr_banter_wait(streamer, 5.5, 1)
			scr_banter_set_subtitles(streamer, "I will absolutely (???) A Pokemon.")
			scr_banter_wait(streamer, 3, 1)
			scr_banter_change_streamer_state(streamer, 0);
			scr_banter_set_subtitles(streamer, " ")
		break;
		
	}
	scr_banter_over(streamer);
}