if target_stream == global.stream_hovering || target_stream == global.streamer_on {
	if !surface_exists(global.streamsurf[target_stream])
		global.streamsurf[target_stream] = surface_create(912, 513);
		
	surface_set_target(global.streamsurf[target_stream]);
	draw_set_color(c_white);
	draw_rectangle(270, 18, 910, 498, 0);
	
	surface_reset_target()
}