function scr_edit_highscore(new_val){
	ini_open("save.ini");
	ini_write_real("Score", "highscore", new_val);
	global.highscore = ini_read_real("Score", "highscore", 0);
	ini_close();
}