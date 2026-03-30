if state == 0 {
	options_height = lerp(options_height, options_maxheight, 0.25)
	loading_frame += 0.2;
} 
if state == 1 {
	options_height = options_maxheight;
} 
if state == 2 {
	options_height = lerp(options_height, 20, 0.25)
}

if options_height + 5 >= options_maxheight && !alarmed_once {
	alarmed_once = 1;
	alarm[0] = 5;
}
if options_height - 21 <= 0 {
	instance_destroy();
}
	
if ((mouse_x >= x && mouse_x < x + options_width - 30 && mouse_y >= y && mouse_y <= y + 19) || options_mouse_grabbed) && mouse_check_button(mb_left) {
	
	if options_mouse_grabbed == 0 {
		
		options_mouse_grabbed = 1;
		options_mouse_x_last = mouse_x;
		options_mouse_y_last = mouse_y;
		
	}
	
	x -= options_mouse_x_last - mouse_x;
	y -= options_mouse_y_last - mouse_y;
	
	options_mouse_x_last = mouse_x;
	options_mouse_y_last = mouse_y;
	
} else {
	
	options_mouse_grabbed = 0;
	options_mouse_x_last = 0;
	options_mouse_y_last = 0;
	
}

maxdepth = script_execute_ext(max, description_depth);
maxdepth = max(maxdepth, settings_depth);

x = clamp(x, 0, 1600 - options_width);
y = clamp(y, 18, 900 - options_maxheight);

if !surface_exists(option_surface)
	option_surface = surface_create(477, clamp(options_height - 23, 1, options_maxheight))
surface_resize(option_surface, 477, clamp(options_height - 23, 1, options_maxheight))