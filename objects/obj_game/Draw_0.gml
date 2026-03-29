if (target_stream == 0) exit; // oh thats why it broke oops
if target_stream == global.stream_hovering || target_stream == global.streamer_on {
	surface_set_target(states[current_state].render_surface);
	surface_set_target(my_surface);
	draw_set_color(c_white);
	//draw_rectangle(270, 18, 910, 498, 0);
	//draw_rectangle(0, 0, 910, 498, 0);
	for (var i=0;i<array_length(states[current_state].layers);i++) {
		var _layer = states[current_state].layers[i];
		if (_layer.difficulty != MG_DIFFICULTY_ANY && _layer.difficulty != difficulty) continue;
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
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_font(global.font_2x);
	
	backseat_ui_offset_t = (is_backseating ? 0 : -250);
	backseat_ui_offset = lerp(backseat_ui_offset,backseat_ui_offset_t,0.25);
	
	var base_offset = room_height-(150/2)-backseat_ui_offset-20;
	
	var option_surface = surface_create(600,900);
	surface_set_target(option_surface);
	
	var y_offset = 0;
	var chosen_option = -2;
	var key_pressed = keyboard_check_pressed(vk_anykey);
	var typing_allowed = is_backseating;
	var match = [];
	var matches = 0;
	var options = states[current_state].get_options(false,difficulty);
	for (var i=0;i<array_length(options);i++){
		var _option = options[i];
		var option = _option.text;
		
		if (key_pressed && typing_allowed){
			backseat_message = keyboard_string;
			if (string_lower(option) == string_lower(backseat_message)){
				chosen_option = i;
			}
		}
		
		if (!string_starts_with(string_lower(option),string_lower(backseat_message)) && backseat_message != ""){
			continue;
		}
		match = [i,option,_option];
		matches++;
		
		draw_text(5,y_offset,string(i+1)+". "+option);
		y_offset += 35;
	}
	y_offset += 20;
	
	surface_reset_target();
	surface_set_target(application_surface);
	
	if (matches > 0) draw_sprite_ext(spr_dark_nineslice,0,20,base_offset-y_offset,4,(y_offset+10)/150,0,c_white,1);
	draw_sprite_ext(spr_undark_nineslice,0,20,base_offset,4,0.5,0,c_white,1);
	if (matches > 0) draw_surface(option_surface,40,base_offset-y_offset+20);
	
	var message_surf = surface_create(600,40);
	
	surface_reset_target();
	surface_set_target(message_surf);
	
	var x_offset = 0;
	
	show_debug_message(matches);
	
	if (string_width(backseat_message) > 600) x_offset = string_width(backseat_message)-600;
	
	if (matches == 1) {
		draw_set_alpha(0.75);
		var _start = backseat_message;
		var _start_at = string_length(_start)+1;
		var _end = string_copy(match[1],_start_at,string_length(match[1])-_start_at+1);
		draw_text(0,0,_start+_end);
		draw_set_alpha(1);
	}
	draw_text(-x_offset,0,backseat_message);
	
	surface_reset_target();
	surface_set_target(application_surface);
	
	draw_surface(message_surf,40,base_offset+25);
	
	surface_free(message_surf);
	
	if (keyboard_check_pressed(vk_enter) && typing_allowed){
		var is_correct = false;
		var chat_message = backseat_message;
		if (matches == 1) {
			chat_message = states[current_state].get_options(false,difficulty)[match[0]].text;
			var correct_options = states[current_state].get_options(true,difficulty);
			for (var i=0;i<array_length(correct_options);i++){
				var _correct_option = correct_options[i];
				if (match[2] == _correct_option) is_correct = true;
			}
		} else {
			var correct_options = states[current_state].get_options(true,difficulty);
			for (var i=0;i<array_length(correct_options);i++){
				var _correct_option = correct_options[i];
				if (string_lower(backseat_message) == string_lower(_correct_option.text)) is_correct = true;
			}
		}
		array_push(global.chat_messages[target_stream],"PlayerName: "+chat_message);
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