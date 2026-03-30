function scr_item_use(item_id){
	if scr_item_in_inventory(item_id) {
		switch item_id {
			case 0:
			
			break;
			
			case 1:
				global.immunity++;
			break;
			
			case 2:
			
			break;
		}
		
		for (var i = 0; i < array_length(global.inventory); i++) {
			if global.inventory[i] == item_id {
				global.inventory_item_count[i]--;
				if global.inventory_item_count[i] == 0 {
					for (var a = i; a < array_length(global.inventory)-1; a++) {
						global.inventory[a] = global.inventory[a+1];
						global.inventory_item_count[a] = global.inventory_item_count[a+1];
					}
					
					array_delete(global.inventory, array_length(global.inventory), 1);
					array_delete(global.inventory_item_count, array_length(global.inventory_item_count), 1);
					
				}
				break;
			}
		}
		
	}
}