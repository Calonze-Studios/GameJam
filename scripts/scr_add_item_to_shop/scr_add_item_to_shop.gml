function scr_add_item_to_shop(_id, _count = -1) {
	var array_has = 0;
	var array_on = 0;
	
	for (var i = 0; i < array_length(global.shop); i++) {
		if global.shop[i] == _id {
			array_has = 1;
			array_on = i
			break;
		}
	}
	
	if array_has == 1 {
		global.shop_item_count[array_on] += _count;
	} else {
		array_push(global.shop, _id);
		if _count != -1
			array_push(global.shop_item_count, _count);
		else {
			scr_shop_item_get_info(_id);
			array_push(global.shop_item_count, count);
		}
	}
}