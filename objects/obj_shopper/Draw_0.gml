draw_set_alpha(0.25 * clamp((800 - (sprite_width/2)) / x, 0, 1));
draw_set_color(c_black);
draw_rectangle(0, 0, 1600, 900, 0);

draw_set_color(c_white);
draw_set_alpha(1);
draw_self();

pressable = 1;

if state == 1 {
	
	if !surface_exists(phonesurf)
		phonesurf = surface_create(432, 619);
	if surface_get_width(phonesurf) != 619 {
		surface_resize(phonesurf, 432, 619)
	}
	
	surface_set_target(phonesurf);
	if menu == 0 {
		
		draw_sprite(spr_lameazing_bg, 0, 0, 0)
		
		var bottomhover = 0;
		
		if mouse_x >= x + 50 && mouse_x <= x + 482 && mouse_y >= y + 692 && mouse_y <= y + 792 && clickstate == 0 && !global.game_paused
			bottomhover = 1;
		
		if bottomhover && mouse_check_button_pressed(mb_left) {
			randomize();
			alarm[0] = 30 + irandom_range(-5, 5);
			menu = 1;
		}
		
		offset = clamp(offset, 619 - ((array_length(global.shop) * 157) + 10 + 103), 0)
		
		for (var i = 0; i < array_length(global.shop); i++) {
			target_count = clamp(target_count, 1, global.shop_item_count[target]);
			var _offset = 11 + i*157 + offset;
			
			var hover = 0;
			
			if mouse_x >= x + 60 && mouse_x < x + 474 && mouse_y >= y + 177 + _offset && mouse_y < y + 324 + _offset  && clickstate = 0 && !global.game_paused
				hover = 1;
				
			if global.shop_item_count[i] <= 0
				hover = -1
			
			if hover && mouse_check_button_pressed(mb_left) {
				clickstate = 1;
				target = i;
				target_count = 1;
				pressable = 0;
			}
			
			scr_shop_item_get_info(global.shop[i]);
		
			var spr = spr_lameazing_product;
			
			if hover == 1
				spr = spr_lameazing_product_hover;
			if hover == -1
				spr = spr_lameazing_product_nostock;
			
			draw_sprite(spr, 0, 10, _offset)
			
			draw_set_color(c_white);
			
			draw_sprite(image, 0, 19, _offset + 9);
		
			draw_set_halign(fa_left);
			draw_set_valign(fa_bottom);
			draw_set_color(c_black);
			
			draw_set_font(font_shop)
			draw_text_transformed(157, _offset + 36, name, 17/13, 17/13, 0);

			draw_set_valign(fa_top)
			draw_text_ext(159, _offset + 35, description, 23, 260);
			
			draw_set_color(#808080)
			draw_set_halign(fa_left);
			draw_set_valign(fa_bottom);
			
			draw_text(159, _offset + 138, string(global.shop_item_count[i]) + " in stock");
			
			draw_set_color(c_white)
			draw_set_halign(fa_middle)
			
			draw_text(82.5, _offset + 139, "[ $" + string(cost) + " ]")
			
			draw_set_halign(fa_left);
			
			draw_set_color(c_white);
			
			if scr_item_in_cart(global.shop[i]) {
				draw_sprite(spr_lameazing_in_cart, 0, 147, _offset + 10)
			}
			
		}
		
		if clickstate == 1 {
				
				draw_set_color(c_black)
				draw_set_alpha(0.2)
				draw_rectangle(0, 0, 432, 652, 0);
				
				
				draw_set_color(c_white);
				draw_set_alpha(0.9);
				draw_sprite(spr_lameazing_popup_back, 0, 55, 138)
				
				draw_set_alpha(1)
				draw_set_halign(fa_middle);
				draw_set_valign(fa_top);
				scr_shop_item_get_info(global.shop[target]);
				
				draw_set_font(font_mediumshop)
				draw_set_color(c_black);
				
				draw_text_ext(216, 119, "Add " + string(name) + " to cart?", 26, 300)
				
				draw_set_color(c_white);
				
				draw_text_ext(216, 120, "Add " + string(name) + " to cart?", 26, 300)
				
				draw_set_font(font_shop)
				if global.shop_item_count[target] > 1 {
					draw_set_color(c_black)
					draw_text(216, 219, "How many? (max " + string(global.shop_item_count[target]) + ")")
					
					draw_set_color(c_white);
					
					draw_text(216, 220, "How many? (max " + string(global.shop_item_count[target]) + ")")
				
					draw_sprite(spr_lameazing_popup_bar, 0, 138, 260)
				
					draw_set_color(c_black)
					draw_set_font(font_shop)
					draw_text(138 + 164/2, 260, string(target_count) + " ($" + string(cost*target_count) + ")")
				
					var hover0 = 0;
					var hover1 = 0;
				
					if mouse_x >= x + 353 && mouse_x <= x + 393 && mouse_y >= y + 437 && mouse_y <= y + 478 && target_count < global.shop_item_count[target] && !global.game_paused
						hover0 = 1;
				
					if hover0 && mouse_check_button_pressed(mb_left) 
						target_count++
				
					draw_set_alpha(1)
					draw_sprite(spr_lameazing_popup_smallbutton, hover0, 303, 260)
			
					draw_set_font(font_shop);
					draw_set_alpha(0.8)
					draw_set_color(c_white)
					draw_text(303 + 20, 260, "+")
			
					if mouse_x >= x + 147 && mouse_x <= x + 187 && mouse_y >= y + 437 && mouse_y <= y + 478 && target_count > 1 && !global.game_paused
						hover1 = 1;
				
					if hover1 && mouse_check_button_pressed(mb_left) 
						target_count--
				
					draw_set_alpha(1)
					draw_sprite(spr_lameazing_popup_smallbutton, hover1, 97, 260)
				
					draw_set_alpha(0.8)
					draw_text(97 + 20, 260, "-")
					draw_set_alpha(1);
					
				} else 
					draw_text(216, 250, "Cost: $" + string(cost))
				
				var hoverY = 0;
				var hoverN = 0;
				
				if ((mouse_x >= x + 288 && mouse_x <= x + 425 && mouse_y >= y + 495 && mouse_y <= y + 556) || keyboard_check(ord("Y"))) && !global.game_paused && pressable
					hoverY = 1;
				
				draw_sprite(spr_lameazing_popup_yes, hoverY, 238, 318)
				
				draw_set_color(c_black)
				
				draw_set_font(font_mediumshop)
				draw_text(238 + 137/2, 304, "YES")
				
				draw_set_color(c_white);
				draw_text(238 + 137/2, 305, "YES")
				
				if ((mouse_x >= x + 117 && mouse_x <= x + 254 && mouse_y >= y + 495 && mouse_y <= y + 556) || keyboard_check(ord("N"))) && !global.game_paused && pressable
					hoverN = 1;
				
				draw_set_alpha(0.91);
				draw_sprite(spr_lameazing_popup_no, hoverN, 67, 318);
				
				draw_set_alpha(1)
				draw_set_color(c_black)
				
				draw_set_font(font_mediumshop)
				draw_text(67 + 137/2, 304, "NO")
				
				draw_set_color(c_white);
				draw_text(67 + 137/2, 305, "NO")
				
				if ((hoverY && mouse_check_button_pressed(mb_left)) || keyboard_check_released(ord("Y"))) && !global.game_paused && pressable {
					global.shop_item_count[target] -= target_count;
					scr_add_item_to_cart(global.shop[target], target_count);
					clickstate = 0;
					target = 0;
					target_count = 1;
				}
				
				if (hoverN && mouse_check_button_pressed(mb_left)) || keyboard_check_released(ord("N")) {
					clickstate = 0;
					target = 0;
					target_count = 1;
				}
				
			}
			
		var __spr = bottomhover ? spr_undark_nineslice : spr_dark_nineslice
		
		draw_sprite_ext(__spr, 0, 2, 517, 430/sprite_get_width(__spr), 102/sprite_get_height(__spr), 0, c_white, 1)
		
		draw_set_font(font_bigshop)
		draw_set_halign(fa_middle);
		draw_set_valign(fa_center);
		draw_set_color(c_black);
		draw_text(432/2, 517 + 102/2 - 9, "CHECK CART!");
		draw_set_color(c_white);
		draw_text(432/2, 516 + 102/2 - 9, "CHECK CART!");
		
	
	}
	
	if menu == 2 {
		
		draw_sprite(spr_lameazing_bg, 0, 0, 0);
		
		var totalcost = 0
		
		for (var c = 0; c < array_length(global.cart); c++) {
			scr_shop_item_get_info(global.cart[c]);
			
			totalcost += cost * global.cart_item_count[c];
			
		}
		
		var bottomhover = 0;
		
		if mouse_x >= x + 50 && mouse_x <= x + (totalcost == 0 ? 486 : 266) && mouse_y >= y + 692 && mouse_y <= y + 792 && !global.game_paused
			bottomhover = 1;
		
		if bottomhover && mouse_check_button_pressed(mb_left) && !global.game_paused {
			randomize();
			alarm[1] = 30 + irandom_range(-5, 5)
			
			menu = 1;
		}
		
		if totalcost != 0 {
			var buyhover = 0
		
			if mouse_x >= x + 266 && mouse_x <= x + 482 && mouse_y >= y + 692 && mouse_y <= y + 792 && !global.game_paused
				buyhover = 1;
	
			if buyhover && mouse_check_button_pressed(mb_left) && !global.game_paused
				buying = 1;
			
			if buying == 1 {
				
				var _hoverY = 0;
				var _hoverN = 0;
				
				if ((mouse_x >= x + 288 && mouse_x <= x + 425 && mouse_y >= y + 495 && mouse_y <= y + 556) || keyboard_check(ord("Y"))) && global.gold >= totalcost && !global.game_paused
					_hoverY = 1;
				
				if ((mouse_x >= x + 117 && mouse_x <= x + 254 && mouse_y >= y + 495 && mouse_y <= y + 556) || keyboard_check(ord("N"))) && !global.game_paused
					_hoverN = 1;
				
				if _hoverY && (mouse_check_button_pressed(mb_left) || keyboard_check_released(ord("Y"))) && global.gold >= totalcost && !global.game_paused && pressable {
					
					for (var p = 0; p < array_length(global.cart); p++) {
						
						var arrayhas = 0;
						var arrayon = 0;
						
						for (var z = 0; z < array_length(global.inventory); z++) {
							if global.inventory[z] == global.cart[p] {
								arrayhas = 1;
								arrayon = z;
								break;
							}
						}
						
						if !arrayhas {
							array_push(global.inventory, global.cart[p]);
							array_push(global.inventory_item_count, global.cart_item_count[p])
						} else {
							global.inventory_item_count[arrayhas] += global.cart_item_count[p]
						}
					}
					global.gold -= totalcost;
					array_delete(global.cart, 0, array_length(global.cart));
					array_delete(global.cart_item_count, 0, array_length(global.cart));
					
					menu = 1;
					//alarm[2] = 10;
					alarm[0] = 10;
				}
				
				if ((_hoverN && mouse_check_button_pressed(mb_left)) || keyboard_check_released(ord("N"))) && !global.game_paused && pressable {
					buying = 0;
				}
				
				draw_set_halign(fa_left);
				
			}
			
	}
		
		offset = clamp(offset, 619 - ((array_length(global.cart) * 157) + 10 + 103), 0)
		
		for (var i = 0; i < array_length(global.cart); i++) {
			target_count = clamp(target_count, 1, global.cart_item_count[target]);
			var _offset = 11 + i*157 + offset;
			
			var hover = 0;
			
			if mouse_x >= x + 50 && mouse_x < x + 482 && mouse_y >= y + 177 + _offset && mouse_y < y + 324 + _offset  && clickstate = 0 && !buying && !global.game_paused
				hover = 1;
				
			if global.cart_item_count[i] <= 0
				hover = -1
			
			if hover && mouse_check_button_pressed(mb_left) && !global.game_paused {
				clickstate = 1;
				target = i;
				target_count = 1;
				pressable = 0;
			}
			
			scr_shop_item_get_info(global.cart[i]);
		
			var spr = spr_lameazing_product;
			
			if hover == 1
				spr = spr_lameazing_product_hover;
			if hover == -1
				spr = spr_lameazing_product_nostock;
			
			draw_sprite(spr, 0, 10, _offset)
			
			draw_set_color(c_white);
			
			draw_sprite(image, 0, 19, _offset + 9);
		
			draw_set_halign(fa_left);
			draw_set_valign(fa_bottom);
			draw_set_color(c_black);
			
			draw_set_font(font_shop)
			draw_text_transformed(157, _offset + 36, name, 17/13, 17/13, 0);

			draw_set_valign(fa_top)
			draw_text_ext(159, _offset + 35, description, 23, 260);
			
			draw_set_color(#808080)
			draw_set_halign(fa_left);
			draw_set_valign(fa_bottom);
			
			draw_text(159, _offset + 138, string(global.cart_item_count[i]) + " in cart");
			
			draw_set_color(c_white)
			draw_set_halign(fa_middle)
			
			draw_text(82.5, _offset + 139, "[ $" + string(cost) + " ]")
			
			draw_set_halign(fa_left);
			
			draw_set_color(c_white);
			
		}
		
		if clickstate == 1 {
				
				
				draw_set_color(c_black)
				draw_set_alpha(0.2)
				draw_rectangle(0, 0, 432, 652, 0);
				
				
				draw_set_color(c_white);
				draw_set_alpha(0.9);
				draw_sprite(spr_lameazing_popup_back, 0, 55, 138)
				
				draw_set_alpha(1)
				draw_set_halign(fa_middle);
				draw_set_valign(fa_top);
				scr_shop_item_get_info(global.cart[target]);
				
				draw_set_font(font_mediumshop)
				draw_set_color(c_black);
				
				draw_text_ext_transformed(216, 119, "Remove " + string(name) + " from cart?", 26, 350, 0.8, 1, 0)
				
				draw_set_color(c_white);
				
				draw_text_ext_transformed(216, 120, "Remove " + string(name) + " from cart?", 26, 350, 0.8, 1, 0)
				
				draw_set_font(font_shop)
				if global.cart_item_count[target] > 1 {
					draw_set_color(c_black)
					draw_text(216, 219, "How many? (max " + string(global.cart_item_count[target]) + ")")
					
					draw_set_color(c_white);
					
					draw_text(216, 220, "How many? (max " + string(global.cart_item_count[target]) + ")")
				
					draw_sprite(spr_lameazing_popup_bar, 0, 138, 260)
				
					draw_set_color(c_black)
					draw_set_font(font_shop)
					draw_text(138 + 164/2, 260, string(target_count) + " (-$" + string(cost*target_count) + ")")
				
					var hover0 = 0;
					var hover1 = 0;
				
					if mouse_x >= x + 353 && mouse_x <= x + 393 && mouse_y >= y + 437 && mouse_y <= y + 478 && target_count < global.cart_item_count[target] && !global.game_paused
						hover0 = 1;
				
					if hover0 && mouse_check_button_pressed(mb_left) 
						target_count++
				
					draw_set_alpha(1)
					draw_sprite(spr_lameazing_popup_smallbutton, hover0, 303, 260)
			
					draw_set_font(font_shop);
					draw_set_alpha(0.8)
					draw_set_color(c_white)
					draw_text(303 + 20, 260, "+")
			
					if mouse_x >= x + 147 && mouse_x <= x + 187 && mouse_y >= y + 437 && mouse_y <= y + 478 && target_count > 1 && !global.game_paused
						hover1 = 1;
				
					if hover1 && mouse_check_button_pressed(mb_left) 
						target_count--
				
					draw_set_alpha(1)
					draw_sprite(spr_lameazing_popup_smallbutton, hover1, 97, 260)
				
					draw_set_alpha(0.8)
					draw_text(97 + 20, 260, "-")
					draw_set_alpha(1);
					
				} else 
					draw_text(216, 250, "Cost removed: $" + string(cost))
				
					var hoverY = 0;
					var hoverN = 0;
				
					if ((mouse_x >= x + 288 && mouse_x <= x + 425 && mouse_y >= y + 495 && mouse_y <= y + 556) || keyboard_check(ord("Y"))) && !global.game_paused
						hoverY = 1;
				
					draw_sprite(spr_lameazing_popup_yes, hoverY, 238, 318)
				
					draw_set_color(c_black)
				
					draw_set_font(font_mediumshop)
					draw_text(238 + 137/2, 304, "YES")
				
					draw_set_color(c_white);
					draw_text(238 + 137/2, 305, "YES")
				
					if ((mouse_x >= x + 117 && mouse_x <= x + 254 && mouse_y >= y + 495 && mouse_y <= y + 556) || keyboard_check(ord("N"))) && !global.game_paused
						hoverN = 1;
				
					draw_set_alpha(0.91);
					draw_sprite(spr_lameazing_popup_no, hoverN, 67, 318);
				
					draw_set_alpha(1)
					draw_set_color(c_black)
				
					draw_set_font(font_mediumshop)
					draw_text(67 + 137/2, 304, "NO")
				
					draw_set_color(c_white);
					draw_text(67 + 137/2, 305, "NO")
				
					if ((hoverY && mouse_check_button_pressed(mb_left)) || keyboard_check_released(ord("Y"))) && !global.game_paused && pressable {
						scr_add_item_to_shop(global.cart[target], target_count);
						scr_add_item_to_cart(global.cart[target], -target_count)
				
						clickstate = 0;
						target = 0;
						target_count = 1;
					
						menu = 1;
						alarm[0] = 10;
					}
				
					if ((hoverN && mouse_check_button_pressed(mb_left)) || keyboard_check_released(ord("N"))) && !global.game_paused && pressable {
						clickstate = 0;
						target = 0;
						target_count = 1;
					}
				
					draw_set_halign(fa_left);
				
			}
			
		
		if buying {
			draw_set_color(c_black)
			draw_set_alpha(0.2)
			draw_rectangle(0, 0, 432, 652, 0);
			
			
			draw_set_color(c_white);
			draw_set_alpha(0.9);
			draw_sprite(spr_lameazing_popup_back, 0, 55, 138)
				
			draw_set_font(font_mediumshop)
			draw_set_color(c_black);
			draw_set_halign(fa_middle);
			draw_set_valign(fa_top);
			draw_set_alpha(1);
				
			draw_text_ext_transformed(216, 119, "Buy everything in cart? ($" + string(totalcost) + ")", 26, 350, 0.8, 1, 0)
				
			draw_set_color(c_white);
				
			draw_text_ext_transformed(216, 120, "Buy everything in cart? ($" + string(totalcost) + ")", 26, 350, 0.8, 1, 0)
				
			if totalcost > global.gold {
				draw_text_ext_transformed(216, 190, "Not enough money! Need $" + string(totalcost - global.gold) + " more!", 26, 350, 0.8, 0.8, 0)
			}
			
			draw_set_font(font_shop);
				
			var _______spr = spr_lameazing_popup_yes;
			if totalcost > global.gold
				_______spr = spr_lameazing_popup_grey;
				
			draw_sprite(_______spr, _hoverY, 238, 318)
				
			draw_set_color(c_black)
				
			draw_set_font(font_mediumshop)
			draw_text(238 + 137/2, 304, "YES")
				
			draw_set_color(c_white);
			draw_text(238 + 137/2, 305, "YES")
				
			draw_set_alpha(0.91);
			draw_sprite(spr_lameazing_popup_no, _hoverN, 67, 318);
				
			draw_set_alpha(1)
			draw_set_color(c_black)
				
			draw_set_font(font_mediumshop)
			draw_text(67 + 137/2, 304, "NO")
				
			draw_set_color(c_white);
			draw_text(67 + 137/2, 305, "NO")
		}
		
		
		var __spr = bottomhover == 0 ? spr_dark_nineslice : spr_undark_nineslice
		
		draw_sprite_ext(__spr, 0, 2, 517, (430 / ((totalcost != 0)+1))/sprite_get_width(__spr), 102/sprite_get_height(__spr), 0, c_white, 1)

		
		draw_set_font(font_bigshop)
		draw_set_halign(fa_middle);
		draw_set_valign(fa_center);
		draw_set_color(c_black);
		draw_text_transformed(432/2/((totalcost != 0)+1), 517 + 102/2 - 9, "CHECK SHOP!", 1/((totalcost != 0)+1), 1, 0);
		draw_set_color(c_white);
		draw_text_transformed(432/2/((totalcost != 0)+1), 516 + 102/2 - 9, "CHECK SHOP!", 1/((totalcost != 0)+1), 1, 0);
		
		if totalcost != 0 {
			var ___spr = buyhover == 0 ? spr_dark_nineslice : spr_undark_nineslice
		
			draw_sprite_ext(___spr, 0, 217, 517, 215/sprite_get_width(__spr), 102/sprite_get_height(__spr), 0, c_white, 1)
		
			draw_set_font(font_bigshop)
			draw_set_halign(fa_middle);
			draw_set_valign(fa_center);
			draw_set_color(c_black);
			draw_text_transformed(217 + (215/2), 517 + 102/2 - 9, "CHECKOUT!", 0.5, 1, 0);
			draw_set_color(c_white);
			draw_text_transformed(217 + (215/2), 516 + 102/2 - 9, "CHECKOUT!", 0.5, 1, 0);
		
		}
	
	}
	
	if menu == 1 {
		
		surface_reset_target();
		surface_resize(phonesurf, 432, 726);
		surface_set_target(phonesurf);
		
		draw_clear(#d1d1d1);
		draw_sprite_ext(spr_placeholder_loading, floor(loadingframe), 432/2, 726/2, 3, 3, 0, c_white, 1);
	
	}  
	
	surface_reset_target();
	draw_surface(phonesurf, x + 50, y + 70 + (726 - surface_get_height(phonesurf)));
	
	if menu == 0
		draw_sprite(spr_lameazing_shop, 0, x + 50, y + 70);
	if menu == 2
		draw_sprite(spr_lameazing_cart, 0, x + 50, y + 70);
	if menu != 1 {
		draw_set_font(font_mediumshop)
		draw_set_valign(fa_top)
		draw_set_halign(fa_left)
		
		draw_set_color(#2c3438)
		draw_text(x + 100, y + 66, global.gold)
		draw_text(x + 100, y + 67, global.gold)
		draw_text(x + 100, y + 68, global.gold)
		draw_text(x + 100, y + 69, global.gold)
		draw_text(x + 100, y + 70, global.gold)
		
		draw_set_color(#64878c)
		draw_text(x + 100, y + 65, global.gold)
	}
	
	
} else {
	
	draw_set_color(c_black);
	draw_rectangle(x + 50, y + 70, x + 482, y + 796, 0);
	draw_set_color(c_white);
	
}

draw_set_alpha(0.2);
draw_sprite(spr_bigphone_shine, 0, x, y);
draw_set_alpha(1);