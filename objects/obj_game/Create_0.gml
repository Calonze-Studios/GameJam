target_stream = global.streamers_unlocked-1;
current_state = 0;
previous_state = 0;
my_surface = surface_create(640,480);
states = [];

not_switching = true;

difficulty = MG_DIFFICULTY_EASY;

//has_transitions = true;
//transition_active = false;
//transition_fade = 0;

backseat_message = "";
is_backseating = false;
backseat_ui_offset = -400;
backseat_ui_offset_t = -400;

scr_load_minigame(target_stream);

function switch_to_state_idx(idx){
	difficulty = irandom_range(MG_DIFFICULTY_EASY,MG_DIFFICULTY_HARD);
	keyboard_string = "";
	backseat_message = "";
	previous_state = current_state;
	current_state = idx;
	states[current_state].visited = true;
	alarm[0] = states[current_state].expiry_timer;
	if (global.rush_hour) {
		alarm[0] /= 2;
	}
	if (states[current_state].type == MG_STATE_QTEVENT) {
		scr_streamer_change_state(3,target_stream);
		scr_chat_change_state(3,target_stream);
		is_backseating = true;
		global.typing_mode = true;
	} else if (states[current_state].type == MG_STATE_IDLE){
		scr_streamer_change_state(0,target_stream);
		scr_chat_change_state(0,target_stream);
		is_backseating = false;
		global.typing_mode = false;
	} else {
		is_backseating = false;
		global.typing_mode = false;
	}
	/*if (has_transitions){
		transition_active = true;
		transition_fade = 0;
	}*/
}

function flush_only_once(){
	for (var i=0;i<array_length(states);i++){
		if (states[i].type == MG_STATE_QTEVENT){
			states[i].visited = false;
		}
	}
}

function get_states() {
	var ret = [];
	for (var i=0;i<array_length(states);i++){
		if (states[i].difficulty == difficulty || states[i].difficulty == MG_DIFFICULTY_ANY){
			if (states[i].only_once && states[i].visited) continue;
			array_push(ret,i);
		}
	}
	return ret;
}

function get_states_of_type(type) {
	var ret = [];
	var _states = get_states();
	for (var i=0;i<array_length(_states);i++){
		if (states[_states[i]].type == type){
			array_push(ret,i);
		}
	}
	return ret;
}

function switch_to_random_state(type=-1) {
	if (type >= 0) {
		var _states = get_states_of_type(type);
		if (array_length(_states) == 0) {
			alarm[0] = 15;
			flush_only_once();
			return;
		}
		switch_to_state_idx(_states[irandom_range(0,array_length(_states)-1)]);
	} else {
		var _states = get_states();
		if (array_length(_states) == 0) {
			alarm[0] = 15;
			flush_only_once();
			return;
		}
		switch_to_state_idx(_states[irandom_range(0,array_length(_states)-1)]);
	}
}

function switch_to_state_name(_name){
	for (var i=0;i<array_length(states);i++){
		if (states[i].name == _name){
			switch_to_state_idx(i);
		}
	}
}

switch_to_random_state(MG_STATE_IDLE);