if (array_length(global.streamer_game) == 0){
	
	var _game = instance_create_depth(0, 0, -1, obj_game);
	array_push(global.streamer_game, _game);
	
}

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

if scr_keybind_pressed(ord("B")) {
	if bulge == 0
		bulge = 1;
	else
		bulge = 0;
}

if scr_keybind_pressed(ord("Q"))
	global.gold += 100
if scr_keybind_pressed(ord("W"))
	global.gold -= 100
if scr_keybind_pressed(ord("Z"))
	global.lives--;
if scr_keybind_pressed(ord("X"))
	global.lives++;