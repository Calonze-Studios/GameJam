if (target_stream == 0) exit;
if target_stream == global.stream_hovering || target_stream == global.streamer_on {
	surface_set_target(states[current_state].render_surface);
	draw_set_color(c_white);
	//draw_rectangle(270, 18, 910, 498, 0);
	//draw_rectangle(0, 0, 910, 498, 0);
	
	for (var i=0;i<array_length(states[current_state].layers);i++) {
		var _layer = states[current_state].layers[i];
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
	
	if (debug_keyboard_check_pressed(ord("N"))){
		current_state -= 1;
	}
	if (debug_keyboard_check_pressed(ord("M"))){
		current_state += 1;
	}
	
	surface_reset_target()
	
	surface_set_target(my_surface);
	
	draw_clear(c_black);
	
	draw_surface(states[current_state].render_surface,0,0);
	
	
	/*if (transition_active){
		transition_fade += 1/fps;
		if (transition_fade > 1) transition_active = false;
		draw_surface_ext(states[previous_state].render_surface,0,0+480*transition_fade,1,1,0,c_white,1);
	}*/
	
	surface_reset_target();
	
	surface_set_target(application_surface);
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_font(global.font_2x);
	
	backseat_ui_offset_t = (is_backseating ? 0 : -250);
	backseat_ui_offset = lerp(backseat_ui_offset,backseat_ui_offset_t,0.25);
	
	var base_offset = room_height-(150/2)-backseat_ui_offset-20;
	
	draw_sprite_ext(spr_dark_nineslice,0,20,base_offset,4,0.5,0,c_white,1);
	
	var message_surf = surface_create(600,40);
	
	surface_reset_target();
	surface_set_target(message_surf);
	
	var x_offset = 0;
	
	if (string_width(backseat_message) > 600) x_offset = string_width(backseat_message)-600;
	
	draw_text(-x_offset,0,backseat_message);
	
	surface_reset_target();
	surface_set_target(application_surface);
	
	draw_surface(message_surf,40,base_offset+25);
	
	surface_free(message_surf);


	var y_offset = 0;
	var chosen_option = -2;
	var key_pressed = keyboard_check_pressed(vk_anykey);
	for (var i=0;i<array_length(states[current_state].options);i++){
		var option = states[current_state].options[i];
		
		if (key_pressed){
			backseat_message = keyboard_string;
			if (string_lower(option) == string_lower(backseat_message)){
				chosen_option = i;
			}
		}
		
		if (!string_starts_with(string_lower(option),string_lower(backseat_message)) && backseat_message != ""){
			continue;
		}
		
		draw_text(20,base_offset-30-y_offset,option);
		y_offset += 30;
	}
	
	if (keyboard_check_pressed(vk_enter)){
		var is_correct = false;
		for (var i=0;i<array_length(states[current_state].correct_options);i++){
			var option_idx = states[current_state].correct_options[i];
			if (chosen_option == option_idx) is_correct = true;
		}
		array_push(global.chat_messages[target_stream],"PlayerName: "+backseat_message);
		backseat_message = "";
		keyboard_string = "";
		if (is_correct){
			switch_to_state_name(states[current_state].correct_state);
		} else {
			switch_to_state_name(states[current_state].wrong_state);
		}
	}
	
	draw_set_font(global.font);
	
	surface_reset_target();
}