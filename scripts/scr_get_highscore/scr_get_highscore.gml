function scr_get_highscore(){
	ini_open("save.ini");
	if !ini_section_exists("Score") {
		ini_write_real("Score", "highscore", 0);
	}
	
	return ini_read_real("Score", "highscore", 0);
}