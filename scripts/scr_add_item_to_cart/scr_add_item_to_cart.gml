function scr_add_item_to_cart(_id, count) {
	var array_has = 0;
	var array_on = 0;
	
	for (var i = 0; i < array_length(global.cart); i++) {
		if global.cart[i] == _id {
			array_has = 1;
			array_on = i
			break;
		}
	}
	
	if array_has == 1 {
		global.cart_item_count[array_on] += count;
		if global.cart_item_count[array_on] <= 0 {
			for (var a = array_on; a < array_length(global.cart)-1; a++) {
				global.cart[a] = global.cart[a+1]
				global.cart_item_count[a] = global.cart_item_count[a+1]
			}
			array_delete(global.cart, array_length(global.cart)-1, 1);
			array_delete(global.cart_item_count, array_length(global.cart_item_count)-1, 1);
		}
		
	} else {
		array_push(global.cart, _id);
		array_push(global.cart_item_count, count);
	}
	
	
}