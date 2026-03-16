var phone_frame = 0;
var meeting = 0;

if position_meeting(mouse_x, mouse_y, id) {
	phone_frame = 1;
	meeting = 1;
}
	
draw_sprite(spr_phone, phone_frame, x, y)

if meeting && mouse_check_button_pressed(mb_left) {
	if !global.in_shop {
		
		global.in_shop = 1;
		
		if !instance_exists(obj_shopper)
			instance_create_depth(0, 0, 100, obj_shopper);
		else
			obj_shopper.state = 0;
			
	} else {
		global.in_shop = 0;
		
		if instance_exists(obj_shopper) {
			obj_shopper.state = 2;
		}
		
	}
}