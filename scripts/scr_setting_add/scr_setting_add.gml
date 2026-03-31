function scr_setting_add(key, section, name, description, type, default_val = 0, options = []){
	ini_open("settings.ini");
	
	var array_has = 0;
	
	for (var i = 0; i < array_length(global.settings_name); i++) {
		if global.settings_name[i] == global.settings_name {
			array_has = 1;
			break;
		}
	}
	
	if !array_has {
		array_push(global.settings_name, name);
		array_push(global.settings_desc, description);
		array_push(global.settings_type, type);
		array_push(global.settings_options, options);
		array_push(global.settings_section, section)
		array_push(global.settings_key, key);
		if string_lower(type) != "string"
			array_push(global.settings_value, ini_read_real(section, key, default_val));
		else
			array_push(global.settings_value, ini_read_string(section, key, string(default_val)));
	}
	
	if !ini_key_exists(section, key) {
		if string_lower(type) != "string" {
			ini_write_real(section, key, default_val)
		} else {
			ini_write_string(section, key, string(default_val))
		}
	}
	
	if string_lower(type) != "string" {
		return ini_read_real("Settings", key, default_val)
	} else {
		return ini_read_string("Settings", key, string(default_val))
	}
	
	ini_close();
	
}