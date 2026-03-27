target_stream = 0;
current_state = 0;
previous_state = 0;
my_surface = surface_create(640,480);
states = [];

//has_transitions = true;
//transition_active = false;
//transition_fade = 0;

backseat_message = "";
is_backseating = false;
backseat_ui_offset = -400;
backseat_ui_offset_t = -400;

var state = add_minigame_state(id,"idle")
state.add_layer("bg",spr_mg_pkmn_idle_bg,30);
state.add_layer("fg",spr_mg_pkmn_idle_fg,30);
state.set_timer_seconds(5);

state = add_minigame_state(id,"battle_fire_idle")
state.add_option("Punch",true);
state.add_option("Do nothing",false);
state.correct_state = "battle_fire_win";
state.wrong_state = "battle_fire_lose";
state.add_layer("bg",spr_mg_pkmn_battle_bg,2);
state.add_layer("fg",spr_mg_pkmn_firebattle_idle,2);
state.type = MG_STATE_QTEVENT;

state = add_minigame_state(id,"battle_fire_win")
state.add_layer("bg",spr_mg_pkmn_battle_bg,2);
state.add_layer("fg",spr_mg_pkmn_firebattle_win,2);
state.type = MG_STATE_RESULT;

state = add_minigame_state(id,"battle_fire_lose")
state.add_layer("bg",spr_mg_pkmn_battle_bg,2);
state.add_layer("fg",spr_mg_pkmn_firebattle_lose,2);
state.type = MG_STATE_RESULT;

function switch_to_state_idx(idx){
	keyboard_string = "";
	backseat_message = "";
	previous_state = current_state;
	current_state = idx;
	alarm[0] = states[current_state].expiry_timer;
	if (states[current_state].type == MG_STATE_QTEVENT) {
		is_backseating = true;
	} else {
		is_backseating = false;
	}
	/*if (has_transitions){
		transition_active = true;
		transition_fade = 0;
	}*/
}

function get_states_of_type(type) {
	var ret = [];
	for (var i=0;i<array_length(states);i++){
		if (states[i].type == type){
			array_push(ret,i);
		}
	}
	return ret;
}

function switch_to_random_state(type=-1) {
	if (type >= 0) {
		var _states = get_states_of_type(type);
		switch_to_state_idx(_states[irandom_range(0,array_length(_states)-1)]);
	} else {
		switch_to_state_idx(irandom_range(0,array_length(states)-1));
	}
}

function switch_to_state_name(_name){
	for (var i=0;i<array_length(states);i++){
		if (states[i].name == _name){
			switch_to_state_idx(i);
		}
	}
}

switch_to_random_state(MG_STATE_QTEVENT);