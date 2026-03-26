draw_set_alpha(0.25 * clamp((800 - (sprite_width/2)) / x, 0, 1));
draw_set_color(c_black);
draw_rectangle(0, 0, 1600, 900, 0);

draw_set_color(c_white);
draw_set_alpha(1);
draw_self();

if state == 1 {
	
	if !surface_exists(phonesurf)
		phonesurf = surface_create(432, 652);
	if surface_get_width(phonesurf) != 652 {
		surface_resize(phonesurf, 432, 652)
	}
	
	surface_set_target(phonesurf);
	if menu == 0 {
		
		draw_clear(c_white);
		
		var bottomhover = 0;
		
		if mouse_x >= x + 50 && mouse_x <= x + 482 && mouse_y >= y + 692 && mouse_y <= y + 792 && clickstate == 0
			bottomhover = 1;
			
		draw_set_color(bottomhover ? c_white : #d1d1d1);
		
		draw_rectangle(0, 552, 432, 652, 0);
		
		draw_set_color(c_grey);
		draw_line(0, 552, 432, 552);
		
		draw_set_halign(fa_middle);
		draw_set_valign(fa_center)
		draw_set_color(c_black);
		draw_text_transformed(216, 602, "Open cart", 4, 4, 0);
		
		if bottomhover && mouse_check_button_pressed(mb_left) {
			randomize();
			alarm[0] = 30 + irandom_range(-5, 5);
			menu = 1;
		}
		
		offset = clamp(offset, 0, clamp((array_length(global.shop) * 70) - 652, 0, 10000))
		
		for (var i = 0; i < array_length(global.shop); i++) {
			target_count = clamp(target_count, 1, global.shop_item_count[target]);
			var _offset = i*70 + offset;
			
			var hover = 0;
			
			if mouse_x >= x + 50 && mouse_x < x + 482 && mouse_y >= y + 144 + _offset && mouse_y < y + 214 + _offset && global.shop_item_count[i] > 0
				hover = 1;
			
			if hover && mouse_check_button_pressed(mb_left) && clickstate == 0 {
				clickstate = 1;
				target = i;
				target_count = 1;
			}
			
			scr_shop_item_get_info(global.shop[i]);
		
			draw_set_color(hover == 1 && !clickstate ? c_white : #d1d1d1);
			draw_rectangle(0, _offset, 432, _offset + 70, 0)
			
			draw_set_color(c_white);
			
			draw_sprite(image, 0, 2, _offset + 4);
		
			draw_set_halign(fa_left);
			draw_set_valign(fa_top);
			draw_set_color(c_black);
			
			draw_text_transformed(sprite_get_width(image) + 6, _offset + 6, name, 2, 2, 0);
		
			var font_width = 2.8;
			var font_width_on = 0;
			var textarray = []
			var storedspace = 0;
			var maxwidth = floor((424 - sprite_get_width(image))/font_width);
	
			for (var a = 0; a < string_length(description); a++) {
				textarray[a] = string_char_at(description, a+1);
			}

			for (var t = 1; t <= string_length(description); t++) {
				font_width_on += font_width;
	
				if string_char_at(description, t) == " "
					storedspace = t;
		
				if font_width_on > maxwidth && storedspace != 0 {
					font_width_on = 0;
					textarray[storedspace-1] = "\n";
					t = storedspace;
				}
			}
			description = ""
			for (var b = 0; b < array_length(textarray); b++;) {
				description += textarray[b];
			}
		
			draw_set_color(c_grey);
			draw_text(sprite_get_width(image) + 6, _offset + 32, description);
			
			draw_set_color(c_black);
			draw_set_halign(fa_right);
			draw_set_valign(fa_bottom);
			
			if global.shop_item_count[i] == 0
				draw_set_color(c_red);
			
			draw_text(430, _offset + 68, string(global.shop_item_count[i]) + "x");
			
			draw_set_color(c_black)
			draw_set_valign(fa_top);
			draw_text(430, _offset + 6, "$" + string(cost))
			
			draw_set_halign(fa_left);
			
			draw_set_color(c_white);
			
		}
		
		if clickstate == 1 {
				
				
				draw_set_color(c_black)
				draw_set_alpha(0.2)
				draw_rectangle(0, 0, 432, 652, 0);
				
				
				draw_set_color(c_white);
				draw_set_alpha(1);
				draw_rectangle(50, 200, 382, 452, 0)
					
				draw_set_color(c_black)
				draw_rectangle(50, 200, 382, 452, 1)
				draw_rectangle(49, 199, 383, 453, 1)
				
				draw_set_halign(fa_middle);
				draw_set_valign(fa_top);
				scr_shop_item_get_info(global.shop[target]);
				
				draw_text_transformed(216, 204, "Add\n" + string(name) + "\nto cart?", 2, 2, 0)
				
				if global.shop_item_count[target] > 1 {
					draw_text_transformed(216, 300, "Count (max " + string(global.shop_item_count[target]) + "x):", 2, 2, 0)
				
					draw_set_color(#d1d1d1);
					draw_rectangle(55, 330, 277, 360, 0)
				
					draw_set_color(c_black);
					draw_rectangle(55, 330, 277, 360, 1)
					draw_rectangle(54, 329, 278, 361, 1)
				
					draw_text_transformed((55+277)/2, 332, string(target_count) + " ($" + string(cost*target_count) + ")", 2, 2, 0)
				
					var hover0 = 0;
					var hover1 = 0;
				
					if mouse_x >= x + 332 && mouse_x <= x + 362 && mouse_y >= y + 474 && mouse_y <= y + 504 
						hover0 = 1;
				
					if hover0 && mouse_check_button_pressed(mb_left) 
						target_count++
				
					draw_set_color(hover0 == 1 && target_count + 1 <= global.shop_item_count[target] ? c_white : #d1d1d1);
					draw_rectangle(282, 330, 312, 360, 0)
				
					draw_set_color(c_black);
					draw_rectangle(282, 330, 312, 360, 1)
					draw_rectangle(281, 329, 313, 361, 1)
			
					draw_text_transformed(297, 334, "+", 2, 2, 0)
			
					if mouse_x >= x + 367 && mouse_x <= x + 397 && mouse_y >= y + 474 && mouse_y <= y + 504 
						hover1 = 1;
				
					if hover1 && mouse_check_button_pressed(mb_left) 
						target_count--
				
					draw_set_color(hover1 == 1 && target_count - 1 >= 1 ? c_white : #d1d1d1);
					draw_rectangle(317, 330, 347, 360, 0)
				
					draw_set_color(c_black);
					draw_rectangle(317, 330, 347, 360, 1)
					draw_rectangle(316, 329, 348, 361, 1)
				
					draw_text_transformed(332, 334, "-", 2, 2, 0)
				} else 
					draw_text_transformed(216, 300, "Cost: $" + string(cost), 2, 2, 0)
				
				var hoverY = 0;
				var hoverN = 0;
				
				if (mouse_x >= x + 105 && mouse_x <= x + 255 && mouse_y >= y + 554 && mouse_y <= y + 584) || keyboard_check(ord("Y"))
					hoverY = 1;
				
				draw_set_color(hoverY == 1 ? c_white : #d1d1d1)
				draw_rectangle(55, 410, 205, 440, 0)
				
				draw_set_color(c_black)
				draw_rectangle(55, 410, 205, 440, 1)
				draw_rectangle(54, 409, 206, 441, 1)
				
				draw_text_transformed((55 + 205)/2, 412, "YES", 2, 2, 0)
				
				if (mouse_x >= x + 277 && mouse_x <= x + 427 && mouse_y >= y + 554 && mouse_y <= y + 584) || keyboard_check(ord("N"))
					hoverN = 1;
				
				draw_set_color(hoverN == 1 ? c_white : #d1d1d1)
				draw_rectangle(227, 410, 377, 440, 0)
				
				draw_set_color(c_black)
				draw_rectangle(227, 410, 377, 440, 1)
				draw_rectangle(228, 409, 378, 441, 1)
				
				draw_text_transformed((227 + 377)/2, 412, "NO", 2, 2, 0)
				
				if (hoverY && mouse_check_button_pressed(mb_left)) || keyboard_check_released(ord("Y")) {
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
		
	}  
	
	if menu == 2 {
		
		draw_clear(c_white);
		
		var totalcost = 0
		
		for (var c = 0; c < array_length(global.cart); c++) {
			scr_shop_item_get_info(global.cart[c]);
			
			totalcost += cost * global.cart_item_count[c];
			
		}
		
		var bottomhover = 0;
		
		if mouse_x >= x + 50 && mouse_x <= x + (totalcost == 0 ? 486 : 266) && mouse_y >= y + 692 && mouse_y <= y + 792
			bottomhover = 1;
			
		draw_set_color(bottomhover ? c_white : #d1d1d1);
		
		draw_rectangle(0, 552, totalcost == 0 ? 436 : 216, 652, 0);
		
		draw_set_halign(fa_middle);
		draw_set_valign(fa_center)
		draw_set_color(c_black);
		draw_text_transformed(totalcost == 0 ? 216 : 108, 602, "Open shop", totalcost == 0 ? 4 : 3, 4, 0);
		
		if bottomhover && mouse_check_button_pressed(mb_left) {
			randomize();
			alarm[1] = 30 + irandom_range(-5, 5)
			
			menu = 1;
		}
		
		if totalcost > 0 {
			var buyhover = 0
		
		
			if mouse_x >= x + 266 && mouse_x <= x + 482 && mouse_y >= y + 692 && mouse_y <= y + 792
				buyhover = 1;
		
			draw_set_color(buyhover ? c_white : #d1d1d1);
		
			draw_rectangle(216, 552, 432, 652, 0);
		
			draw_set_color(c_grey);
			draw_line(216, 552, 216, 652)
		
			draw_set_halign(fa_middle);
			draw_set_valign(fa_center)
			draw_set_color(c_black);
			draw_text_transformed(324, 602, "Checkout\n($" + string(totalcost) + ")", 3, 3, 0);
	
			if buyhover && mouse_check_button_pressed(mb_left) 
				buying = 1;
			
			if buying == 1 {
				
				draw_set_color(c_black)
				draw_set_alpha(0.2)
				draw_rectangle(0, 0, 432, 652, 0);
				
				
				draw_set_color(c_white);
				draw_set_alpha(1);
				draw_rectangle(50, 200, 382, 452, 0)
					
				draw_set_color(c_black)
				draw_rectangle(50, 200, 382, 452, 1)
				draw_rectangle(49, 199, 383, 453, 1)
				
				draw_set_halign(fa_middle);
				draw_set_valign(fa_top);
				scr_shop_item_get_info(global.cart[target]);
				
				draw_text_transformed(216, 204, "Buy everything\nin cart?", 2, 2, 0)
				
				draw_text_transformed(216, 280, "Total cost: $" + string(totalcost), 2, 2, 0)
				
				var hoverY = 0;
				var hoverN = 0;
				
				if ((mouse_x >= x + 105 && mouse_x <= x + 255 && mouse_y >= y + 554 && mouse_y <= y + 584) || keyboard_check(ord("Y"))) && global.gold >= totalcost
					hoverY = 1;
				
				draw_set_color(hoverY == 1 ? c_white : #d1d1d1)
				if global.gold < totalcost
					draw_set_color(c_grey);
					
				draw_rectangle(55, 410, 205, 440, 0)
				
				draw_set_color(c_black)
				draw_rectangle(55, 410, 205, 440, 1)
				draw_rectangle(54, 409, 206, 441, 1)
				
				draw_text_transformed((55 + 205)/2, 412, "YES", 2, 2, 0)
				
				if (mouse_x >= x + 277 && mouse_x <= x + 427 && mouse_y >= y + 554 && mouse_y <= y + 584) || keyboard_check(ord("N"))
					hoverN = 1;
				
				draw_set_color(hoverN == 1 ? c_white : #d1d1d1)
				draw_rectangle(227, 410, 377, 440, 0)
				
				draw_set_color(c_black)
				draw_rectangle(227, 410, 377, 440, 1)
				draw_rectangle(228, 409, 378, 441, 1)
				
				draw_text_transformed((227 + 377)/2, 412, "NO", 2, 2, 0)
				
				if hoverY && (mouse_check_button_pressed(mb_left) || keyboard_check_released(ord("Y"))) {
					
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
					
					alarm[2] = 10;
				}
				
				if (hoverN && mouse_check_button_pressed(mb_left)) || keyboard_check_released(ord("N")) {
					buying = 0;
				}
				
				draw_set_halign(fa_left);
				
			}
			
	}
		
		draw_line(0, 552, 432, 552);
		
		offset = clamp(offset, 0, clamp((array_length(global.cart) * 70) - 652, 0, 10000))
		
		for (var i = 0; i < array_length(global.cart); i++) {
			target_count = clamp(target_count, 1, global.cart_item_count[target]);
			
			var _offset = i*70 + offset;
			
			var hover = 0;
			
			if mouse_x >= x + 50 && mouse_x < x + 482 && mouse_y >= y + 144 + _offset && mouse_y < y + 214 + _offset && global.cart_item_count[i] > 0 && !buying
				hover = 1;
			
			if hover && mouse_check_button_pressed(mb_left) && clickstate == 0 {
				clickstate = 1;
				target = i;
				target_count = 1;
			}
			
			scr_shop_item_get_info(global.cart[i]);
		
			draw_set_color(hover == 1 && !clickstate ? c_white : #d1d1d1);
			draw_rectangle(0, _offset, 432, _offset + 70, 0)
			
			draw_set_color(c_white);
			
			draw_sprite(image, 0, 2, _offset + 4);
		
			draw_set_halign(fa_left);
			draw_set_valign(fa_top);
			draw_set_color(c_black);
			
			draw_text_transformed(sprite_get_width(image) + 6, _offset + 6, name, 2, 2, 0);
		
			var font_width = 2.8;
			var font_width_on = 0;
			var textarray = []
			var storedspace = 0;
			var maxwidth = floor((424 - sprite_get_width(image))/font_width);
	
			for (var a = 0; a < string_length(description); a++) {
				textarray[a] = string_char_at(description, a+1);
			}

			for (var t = 1; t <= string_length(description); t++) {
				font_width_on += font_width;
	
				if string_char_at(description, t) == " "
					storedspace = t;
		
				if font_width_on > maxwidth && storedspace != 0 {
					font_width_on = 0;
					textarray[storedspace-1] = "\n";
					t = storedspace;
				}
			}
			description = ""
			for (var b = 0; b < array_length(textarray); b++;) {
				description += textarray[b];
			}
		
			draw_set_color(c_grey);
			draw_text(sprite_get_width(image) + 6, _offset + 32, description);
			
			draw_set_color(c_black);
			draw_set_halign(fa_right);
			draw_set_valign(fa_bottom);
			
			draw_text(430, _offset + 68, string(global.cart_item_count[i]) + "x");
			
			draw_set_color(c_black)
			draw_set_valign(fa_top);
			draw_text(430, _offset + 6, "$" + string(cost))
			draw_set_halign(fa_left);
			
			draw_set_color(c_white);
			
		}
		
		if clickstate == 1 {
				
				
				draw_set_color(c_black)
				draw_set_alpha(0.2)
				draw_rectangle(0, 0, 432, 652, 0);
				
				
				draw_set_color(c_white);
				draw_set_alpha(1);
				draw_rectangle(50, 200, 382, 452, 0)
					
				draw_set_color(c_black)
				draw_rectangle(50, 200, 382, 452, 1)
				draw_rectangle(49, 199, 383, 453, 1)
				
				draw_set_halign(fa_middle);
				draw_set_valign(fa_top);
				scr_shop_item_get_info(global.cart[target]);
				
				draw_text_transformed(216, 204, "Remove\n" + string(name) + "\nfrom cart?", 2, 2, 0)
				
				if global.cart_item_count[target] > 1 {
					draw_text_transformed(216, 300, "Count (max " + string(global.cart_item_count[target]) + "x):", 2, 2, 0)
				
					draw_set_color(#d1d1d1);
					draw_rectangle(55, 330, 277, 360, 0)
				
					draw_set_color(c_black);
					draw_rectangle(55, 330, 277, 360, 1)
					draw_rectangle(54, 329, 278, 361, 1)
				
					draw_text_transformed((55+277)/2, 332, string(target_count) + " (-$" + string(cost * target_count) + ")", 2, 2, 0)
				
					var hover0 = 0;
					var hover1 = 0;
				
					if mouse_x >= x + 332 && mouse_x <= x + 362 && mouse_y >= y + 474 && mouse_y <= y + 504 
						hover0 = 1;
				
					if hover0 && mouse_check_button_pressed(mb_left) 
						target_count++
				
					draw_set_color(hover0 == 1 && target_count + 1 <= global.cart_item_count[target] ? c_white : #d1d1d1);
					draw_rectangle(282, 330, 312, 360, 0)
				
					draw_set_color(c_black);
					draw_rectangle(282, 330, 312, 360, 1)
					draw_rectangle(281, 329, 313, 361, 1)
			
					draw_text_transformed(297, 334, "+", 2, 2, 0)
			
					if mouse_x >= x + 367 && mouse_x <= x + 397 && mouse_y >= y + 474 && mouse_y <= y + 504 
						hover1 = 1;
				
					if hover1 && mouse_check_button_pressed(mb_left) 
						target_count--
				
					draw_set_color(hover1 == 1 && target_count - 1 >= 1 ? c_white : #d1d1d1);
					draw_rectangle(317, 330, 347, 360, 0)
				
					draw_set_color(c_black);
					draw_rectangle(317, 330, 347, 360, 1)
					draw_rectangle(316, 329, 348, 361, 1)
				
					draw_text_transformed(332, 334, "-", 2, 2, 0)
				} else {
					draw_text_transformed(216, 300, "-$" + string(cost) + " cart cost", 2, 2, 0)
				}
				
				var hoverY = 0;
				var hoverN = 0;
				
				if (mouse_x >= x + 105 && mouse_x <= x + 255 && mouse_y >= y + 554 && mouse_y <= y + 584) || keyboard_check(ord("Y"))
					hoverY = 1;
				
				draw_set_color(hoverY == 1 ? c_white : #d1d1d1)
				draw_rectangle(55, 410, 205, 440, 0)
				
				draw_set_color(c_black)
				draw_rectangle(55, 410, 205, 440, 1)
				draw_rectangle(54, 409, 206, 441, 1)
				
				draw_text_transformed((55 + 205)/2, 412, "YES", 2, 2, 0)
				
				if (mouse_x >= x + 277 && mouse_x <= x + 427 && mouse_y >= y + 554 && mouse_y <= y + 584) || keyboard_check(ord("N"))
					hoverN = 1;
				
				draw_set_color(hoverN == 1 ? c_white : #d1d1d1)
				draw_rectangle(227, 410, 377, 440, 0)
				
				draw_set_color(c_black)
				draw_rectangle(227, 410, 377, 440, 1)
				draw_rectangle(228, 409, 378, 441, 1)
				
				draw_text_transformed((227 + 377)/2, 412, "NO", 2, 2, 0)
				
				if (hoverY && mouse_check_button_pressed(mb_left)) || keyboard_check_released(ord("Y")) {
					scr_add_item_to_shop(global.cart[target], target_count);
					scr_add_item_to_cart(target, -target_count)
					clickstate = 0;
					target = 0;
					target_count = 1;
				}
				
				if (hoverN && mouse_check_button_pressed(mb_left)) || keyboard_check_released(ord("N")) {
					clickstate = 0;
					target = 0;
					target_count = 1;
				}
				
				draw_set_halign(fa_left);
				
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
	
	if menu != 1 {
		
		draw_sprite(spr_lameazing_placeholder, 0, x + 50, y + 70);
	
		draw_set_color(c_grey);
		draw_line(x + 50, y + 70 + sprite_get_height(spr_lameazing_placeholder), x + 482, y + 70 + sprite_get_height(spr_lameazing_placeholder))
	
		draw_set_color(c_white)
		
	}
	
} else {
	
	draw_set_color(c_black);
	draw_rectangle(x + 50, y + 70, x + 482, y + 796, 0);
	draw_set_color(c_white);
	
}

draw_set_alpha(0.2);
draw_sprite(spr_bigphone_shine, 0, x, y);
draw_set_alpha(1);