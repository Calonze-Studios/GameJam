function scr_shop_item_get_info(_id){
	name = "";
	description = "";
	cost = -1;
	image = spr_no_item;
	
	switch _id {
		case 0:
			name = "Wide-screen monitor"
			description = "Brand new, used, clean, kinda dirty, ultra-special wide-screen monitor!"
			cost = 250;
			count = 1;
			image = spr_no_item;
		break;
		
		case 1:
			name = "Flinch Sub"
			description = "Gift your favorite Flinch streamer a Flinch Sub(tm)! It'll shield you from 1 ban!"
			cost = 1000;
			count = global.lives - 3;
			image = spr_no_item;
		break;
		
		case 2:
			name = "Lag switch"
			description = "Make yourself LAG! Give yourself more time whilst BACKSEATING!"
			cost = 500;
			count = 5;
			image = spr_no_item;
		break;
	}
}