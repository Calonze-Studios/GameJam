function scr_banter_begin(streamer){
	if instance_exists(obj_banterer) {
		for (var i = 0; i < instance_number(obj_banterer); i++) {
			if instance_find(obj_banterer, i).streamer_target == streamer {
				instance_destroy(instance_find(obj_banterer, i))
				break;
			}
		}
	}
	var banterer = instance_create_depth(0, 0, 0, obj_banterer);
	banterer.streamer_target = streamer;
}