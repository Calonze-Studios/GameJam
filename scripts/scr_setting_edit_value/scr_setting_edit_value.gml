function scr_setting_edit_value (key, section, name, value){
	ini_open("settings.ini");
	if !is_string(value) {
		ini_write_real(section, key, value);
	} else {
		ini_write_string(section, key, string(value));
	}
	
	for (var i = 0; i < array_length(global.settings_name); i++) {
		if global.settings_name[i] == name {
			global.settings_value[i] = value
			break;
		}
	}
	
	ini_close();
}