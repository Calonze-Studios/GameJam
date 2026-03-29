// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
global.typing_mode = false;

function scr_keybind_pressed(bind){
	if (!global.typing_mode) {
		return keyboard_check_pressed(bind);
	} else {
		return false;
	}
}