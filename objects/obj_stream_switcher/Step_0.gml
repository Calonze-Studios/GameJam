if ((mouse_x >= global.computersurf_xdraw + stream_x && mouse_x <= global.computersurf_xdraw + stream_x + 912 && mouse_y >= global.computersurf_ydraw + stream_y && mouse_y <= global.computersurf_ydraw + stream_y + 513) || mouse_grabbed) && mouse_check_button(mb_left) {
	if mouse_grabbed == 0 {
		mouse_grabbed = 1;
		mouse_grabbed_x = mouse_x;
		mouse_grabbed_y = mouse_y;
	}
	
	stream_x -= mouse_grabbed_x - mouse_x;
	stream_y -= mouse_grabbed_y - mouse_y;
	
	mouse_grabbed_x = mouse_x;
	mouse_grabbed_y = mouse_y;
	
} else {
	mouse_grabbed = 0;
	mouse_grabbed_x = 0;
	mouse_grabbed_y = 0;
}

stream_x = clamp(stream_x, 0, 918 - 912)
stream_y = clamp(stream_y, 0, 557 - 513)