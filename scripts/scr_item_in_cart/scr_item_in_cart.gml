function scr_item_in_cart(_id){
	var array_has = 0;
	
	for (var i = 0; i < array_length(global.cart); i++) {
		if global.cart[i] == _id {
			array_has = 1;
			break;
		}
	}
	
	return array_has
	
}