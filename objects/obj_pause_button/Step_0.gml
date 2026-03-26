if position_meeting(mouse_x, mouse_y, id) {
	frame = 1;
	hover = 1;
}
else {
	frame = 0;
	hover = 0;
}

if !hover && mouse_check_button(mb_left) && sprite == 0
	canhover = 0;
else if hover && !mouse_check_button(mb_left) 
	alarm[0] = 1;

if (hover && mouse_check_button(mb_left) && canhover) || keyboard_check(vk_escape) {
	hover = 1;
	sprite = 1;
	drawyoffset_change += 0.5;
	xscale += 0.02
	alreadypressed = 1;
}

if drawyoffset == -1 {
	drawyoffset = 0;
	drawyoffset_change = 0;
	xscale = 1;
	yscale = 1;
}



drawyoffset += drawyoffset_change;
drawyoffset = clamp(drawyoffset, -1, 5);

xscale = clamp(xscale, 0.9, 1.1)

var xscale_change = (xscale * sprite_width) - sprite_width;
yscale = (sprite_height - xscale_change) / sprite_height;

clickprogress += clickprogresschange

clickprogress = clamp(clickprogress, 0, 1);

if state == 0 && clickprogress == 0 {
	quit = 0;
	REALLYquit = 0;
	settinged = 0;
}

if state == 0
	clickprogresschange -= 0.15
else
	clickprogresschange += 0.15

optionsyoffset = (900 * (clickprogress)) - 900;

if (hover && mouse_check_button_released(mb_left) && !keyboard_check(vk_escape) && canhover) || (hover && keyboard_check_released(vk_escape) && !mouse_check_button(mb_left)) || (alreadypressed && !hover) || resumed {
	
	resumed = 0;
	
	sprite = 0;
	
	alreadypressed = 0;
	
	drawyoffset = 0;
	drawyoffset_change = -0.75;
	
	xscale = 0.9
	
	if state == 0 {
		state = 1;
		clickprogresschange = 0.1
	}
	else {
		state = 0;
		clickprogresschange = -0.1
	}
}

if quit == 2
	room_goto(room_title);
	
if REALLYquit == 2
	game_end();

global.game_paused = state;