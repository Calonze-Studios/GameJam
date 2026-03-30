function scr_get_setting_by_name(name) {
	var array_on = -1;
	for (var i = 0; i < array_length(global.settings_name); i++) {
		if global.settings_name[i] == name {
			array_on = i;
			break;
		}
	}
	
	if array_on != -1
		return global.settings_value[array_on];
	
}

function scr_get_setting_description_by_name(name) {
	var array_on = -1;
	for (var i = 0; i < array_length(global.settings_name); i++) {
		if global.settings_name[i] == name {
			array_on = i;
			break;
		}
	}
	
	if array_on != -1
		return global.settings_desc[array_on];
	
}