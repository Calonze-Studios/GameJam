if glow_state == 0
	glow_alpha = 0.8;
if glow_state == 1
	glow_alpha = 0.7;
	
if glow_alpha >= 0.8 && !alarmed_once {
	alarm[0] = 2;
	alarmed_once = 1;
}
if glow_alpha <= 0.7 && !alarmed_once {
	alarm[0] = 2;
	alarmed_once = 1;
}