if target_stream == global.stream_hovering || target_stream == global.streamer_on {
	surface_set_target(my_surface);
	draw_set_color(c_white);
	//draw_rectangle(270, 18, 910, 498, 0);
	//draw_rectangle(0, 0, 910, 498, 0);
	
	for (var i=0;i<array_length(states[global.streamer_game_state[target_stream]].layers);i++) {
		var _layer = states[global.streamer_game_state[target_stream]].layers[i];
		draw_sprite(_layer.sprite,_layer.current_frame,_layer.x_offset,_layer.y_offset);
		
		var _frametime = 1/_layer.framerate;
		if (_layer.timer > _frametime){
			_layer.current_frame++;
			if (_layer.current_frame > sprite_get_number(_layer.sprite)-1){
				_layer.current_frame = 0;
			}
			_layer.timer = 0;
		}
		
		_layer.timer += 1/fps;
	}
	
	if (keyboard_check_pressed(ord("N"))){
		global.streamer_game_state[target_stream] -= 1;
	}
	if (keyboard_check_pressed(ord("M"))){
		global.streamer_game_state[target_stream] += 1;
	}
	
	surface_reset_target()
}