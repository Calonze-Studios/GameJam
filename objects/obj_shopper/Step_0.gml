if state == 0 {
	
	menu = 0;
	
	x = lerp(x, 800 - (sprite_width/2), 0.25)
	
}

if state == 2 {
	
	menu = 0;
	
	x = lerp(x, -sprite_width, 0.25)
	
}

if x + 10 >= 800 - (sprite_width/2) && state == 0 {
	state = 1;
}

if menu == 1 
	loadingframe += 0.125/2;
else
	loadingframe = 0;

if loadingframe >= 2
	loadingframe = 0;

if menu == 1 {
	offset = 0;
	clickstate = 0;
	target = 0;
	target_count = 1;
	buying = 0;
}

if mouse_wheel_up() && !global.game_paused && clickstate == 0
	offset += 25;

if mouse_wheel_down() && !global.game_paused && clickstate == 0
	offset -= 25;
	


if x <= -sprite_width + 1
	instance_destroy();