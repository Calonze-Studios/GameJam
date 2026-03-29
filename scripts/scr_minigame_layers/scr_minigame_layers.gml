// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function MinigameLayer(_name,_sprite,_framerate) constructor{
	name = _name;
	sprite = _sprite;
	framerate = _framerate;
	x_offset = 0;
	y_offset = 0;
	timer = 0; 
	current_frame = 0;
	difficulty = MG_DIFFICULTY_ANY;
}