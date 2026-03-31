var prev = counter_on
var special_on_prev = special_on
counter_on++;

counter_on = clamp(counter_on, 0, array_length(requirements));
show_debug_message(counter_on)
if prev == counter_on {
	show_debug_message("dude")
	special_on++;
	special_on = clamp(special_on, 0, 2 + set_high_score);
} 
if prev != counter_on || special_on_prev != special_on {
	alarm[0] = 90;
	scr_snd_play(snd_chord);
}