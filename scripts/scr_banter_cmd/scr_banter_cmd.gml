function scr_banter_cmd(streamer, command, command_arg1 = 0){
	var target_banterer = noone;
	
	if instance_exists(obj_banterer) {
		for (var i = 0; i < instance_number(obj_banterer); i++) {
			if variable_instance_get(instance_find(obj_banterer, i), "streamer_target") == streamer {
				target_banterer = instance_find(obj_banterer, i);
				break;
			}
		}
	} else
		exit;
	if target_banterer = noone
		exit;
		
	array_push(target_banterer.command_arg0, command);
	array_push(target_banterer.command_arg1, command_arg1);
	array_push(target_banterer.command_triggered, 0)
}