// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
#macro MG_STATE_IDLE 0
#macro MG_STATE_QTEVENT 1
#macro MG_STATE_RESULT 2

function MinigameState(_name,_correct_state=undefined) constructor {
	name = _name;
	correct_state = undefined;
	wrong_state = undefined;
	options = [];
	correct_options = []
	layers = [];
	type = MG_STATE_IDLE;
	expiry_timer = 150;
	render_surface = surface_create(640,480);
	function set_timer_seconds(sec) {
		expiry_timer = sec*fps;
	}
	function add_layer(_name,_spr,_fps){
		var _layer = new MinigameLayer(_name,_spr,_fps);
		array_push(layers,_layer);
		return _layer;
	}
	function add_option(_txt,_correct){
		array_push(options,_txt);
		if (_correct) array_push(correct_options,array_length(options)-1);
	}
}
function add_minigame_state(mg,_name,_backseatable=false,_correct_state=undefined){
	var _state = new MinigameState(_name,_backseatable,_correct_state);
	array_push(mg.states,_state);
	return _state;
}