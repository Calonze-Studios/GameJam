function scr_remove_life(){
	if global.immunity {
		global.immunity--;
		exit;
	}
	
	global.lives--;
	
}