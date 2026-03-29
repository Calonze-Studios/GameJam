// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
#macro DEBUG_ENABLED false
function debug_keyboard_check_pressed(key){
	if (DEBUG_ENABLED) {
		return keyboard_check_pressed(key);
	} else {
		return false;
	}
}