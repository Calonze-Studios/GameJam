// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
#macro MG_STATE_IDLE 0
#macro MG_STATE_QTEVENT 1
#macro MG_STATE_RESULT 2

#macro MG_DIFFICULTY_EASY 0
#macro MG_DIFFICULTY_MEDIUM 1
#macro MG_DIFFICULTY_HARD 2
#macro MG_DIFFICULTY_ANY -1

function MinigameOption(_text,_correct,_difficulty=MG_DIFFICULTY_ANY) constructor {
	text = _text;
	correct = _correct;
	difficulty = _difficulty;
}

function MinigameState(_name,_difficulty=MG_DIFFICULTY_ANY) constructor {
	name = _name;
	correct_state = undefined;
	wrong_state = undefined;
	options = [];
	correct_options = []
	layers = [];
	type = MG_STATE_IDLE;
	expiry_timer = 150;
	render_surface = surface_create(640,480);
	difficulty = _difficulty;
	
	only_once = false;
	visited = false;
	function set_timer_seconds(sec) {
		expiry_timer = sec*fps;
	}
	function add_layer(_name,_spr,_fps){
		var _layer = new MinigameLayer(_name,_spr,_fps);
		array_push(layers,_layer);
		return _layer;
	}
	function add_option(_txt,_correct,_difficulty=MG_DIFFICULTY_ANY){
		var option = new MinigameOption(_txt,_correct,_difficulty);
		array_push(options,option);
	}
	function get_options(_correctOnly,_difficulty=MG_DIFFICULTY_ANY){
		var ret = []
		for (var i=0;i<array_length(options);i++){
			var option = options[i];
			
			if (_correctOnly && !option.correct) continue;
			
			if (option.difficulty == MG_DIFFICULTY_ANY) {
				array_push(ret,option);
			} else {
				if (option.difficulty == _difficulty){
					array_push(ret,option);
				}
			}
		}
		return ret;
	}
}
function add_minigame_state(mg,_name,_difficulty=MG_DIFFICULTY_ANY){
	var _state = new MinigameState(_name,_difficulty);
	array_push(mg.states,_state);
	return _state;
}