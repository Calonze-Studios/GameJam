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

if state == 1 {
	x = lerp(x, fx, 0.25);
}

clickprogress += clickprogresschange

clickprogress = clamp(clickprogress, 0, 1);

optionsyoffset = (900 * (clickprogress)) - 900;

if (hover && mouse_check_button_released(mb_left) && !keyboard_check(vk_escape) && canhover) || (hover && keyboard_check_released(vk_escape) && !mouse_check_button(mb_left)) || (alreadypressed && !hover) {
	
	room_goto(room_title);
	
	if audio_is_playing(mus_ohgod)
		audio_stop_sound(mus_ohgod);
	
}