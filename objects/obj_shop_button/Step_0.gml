if position_meeting(mouse_x, mouse_y, id) && !global.game_paused {
	frame = 1;
	hover = 1;
} else {
	frame = 0;
	hover = 0;
}

if (!hover && mouse_check_button(mb_left) && !clicked) || obj_pause_button.hover == 1
	canhover = 0;
else if hover && !mouse_check_button(mb_left)
	alarm[0] = 1;

if hover && mouse_check_button(mb_left) && canhover {
	drawyoffset_change += 0.5;
	clicked = 1;
	xscale += 0.02;
}

if drawyoffset == -1 {
	drawyoffset = 0;
	drawyoffset_change = 0;
	xscale = 1;
	yscale = 1;
}

drawyoffset += drawyoffset_change;
drawyoffset = clamp(drawyoffset, -1, 5);

xscale = clamp(xscale, 0.9, 1.1);

var xscale_change = (xscale * sprite_width) - sprite_width;
yscale = (sprite_height - xscale_change) / sprite_height;

if ((hover && mouse_check_button_released(mb_left)) || (clicked && !hover)) && canhover {
	
	clicked = 0;
	
	drawyoffset = 0;
	drawyoffset_change = -0.75;
	
	xscale = 0.9;
	
	if !global.in_shop {
		
		_state = 1;
		global.in_shop = 1;
		
		if !instance_exists(obj_shopper)
			instance_create_depth(0, 0, 100, obj_shopper);
		else
			obj_shopper.state = 0;
			
	} else {
		
		_state = 0;
		global.in_shop = 0;
		
		if instance_exists(obj_shopper) {
			obj_shopper.state = 2;
		}
		
	}
}