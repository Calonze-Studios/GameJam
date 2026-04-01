if surface_get_target() != application_surface {
	surface_reset_target();
	surface_set_target(application_surface);
}

if clickprogress > 0 {
	draw_set_alpha(0.7 * clickprogress);
	draw_set_color(c_black);
	draw_rectangle(0, 0, 1600, 900, 0);
	
	draw_set_alpha(clickprogress);
	draw_set_halign(fa_middle);
	
	
	var _xscale = []
	var _yscale = []
	
	var selected = -1;
	
	var options = ["RESUME", "SETTINGS", "EXIT TO MAIN MENU", "EXIT TO DESKTOP"];
	
	draw_set_color(c_white);
	draw_set_valign(fa_top);
	scr_draw_text_transformed_outline(800, optionsyoffset + 30, "PAUSED", 2, 2, 2)
	
	draw_set_valign(fa_center);
	
	if !quit && !REALLYquit {
		for (var i = 0; i <= 3; i++) {
		
			_xscale[i] = 3;
			_yscale[i] = 3;
			
			var _y = 150 * (i+1) + 100
			
			var spr = spr_dark_nineslice;
		
			if mouse_x >= 800 - (string_width(options[i])*3/2) && mouse_x <= 800 + (string_width(options[i])*3/2) && mouse_y >= optionsyoffset + _y - (string_height(options[i])*3/2) && mouse_y <= optionsyoffset + _y + (string_height(options[i])*3/2) && !settinged
				selected = i;
			
			if selected == i
				_y += 2
			
			draw_set_color(#d1d1d1)
		
			if selected == i {
				draw_set_color(c_white)
				//_xscale[i] += 0.4;
				//_yscale[i] += 0.4;
				spr = spr_undark_nineslice;
			}
			
			var slice_x = 800 - (string_width(options[i])*3/2) - 20;
			var slice_y = optionsyoffset + _y - (string_height(options[i])*3/2) - 20;
			
			draw_sprite_ext(spr, 0, slice_x, slice_y, (string_width(options[i])*3 + 40)/sprite_get_width(spr), (string_height(options[i])*3 + 40)/sprite_get_height(spr), 0, c_white, 1);
			scr_draw_text_transformed_outline(800, optionsyoffset + _y, options[i], _xscale[i], _yscale[i], 1);
	
			if selected == i && mouse_check_button_released(mb_left) {
			
				if i == 0 {
					resumed = 1;
				}
				
				if i == 1 {
					settinged = 1;
				}
				
				if i == 2 {
					quit = 1;
				}
				
				if i == 3 {
					REALLYquit = 1;
				}
			}
		}
	}
	else if quit || REALLYquit {
		
		init();
		
		draw_set_color(c_white);
		
		var str = quit ? "Really exit to MAIN MENU?\nYour progress WON'T be saved." : "Really exit to DESKTOP?\nYour progress WON'T be saved."
		
		scr_draw_text_transformed_outline(800, optionsyoffset + 350, str, 3, 3, 2)
		
		var hover0 = 0;
		var hover1 = 0;
		
		var bx = 0;
		var by = 0;
		
		if mouse_x >= 600 - (string_width("YES")*3/2) + 50 && mouse_x <= 600 - (string_width("YES")*3/2) + 50 + string_width("YES")*3 && mouse_y >= optionsyoffset + 500 - string_height("YES")*3/2 && mouse_y <= optionsyoffset + 500 + string_height("YES")*3/2
			hover0 = 1;
		
		bx = 600 - (string_width("YES")*3/2) + 50 - 20;
		by = optionsyoffset + 500 + 2 * hover0 - (string_height("YES")*3/2) - 20
		
		draw_sprite_ext(!hover0 ? spr_dark_nineslice : spr_undark_nineslice, 0, bx, by, ((string_width("YES"))*3 + 40)/sprite_get_width(spr_dark_nineslice), (string_height("YES")*3 + 40)/sprite_get_height(spr_dark_nineslice), 0, c_white, 1)
		
		draw_set_color(!hover0 ? #d1d1d1 : c_white)
		draw_set_halign(fa_left);
		
		scr_draw_text_transformed_outline(600 - (string_width("YES")*3/2) + 50, optionsyoffset + 500 + 2 * hover0, "YES", 3, 3, 1)
		
		
		
		if mouse_x <= 1000 + (string_width("NO")*3/2) - 50 && mouse_x >= 1000 + (string_width("NO")*3/2) - 50 - string_width("NO")*3 && mouse_y >= optionsyoffset + 500 - string_height("NO")*3/2 && mouse_y <= optionsyoffset + 500 + string_height("NO")*3/2
			hover1 = 1;
		
		
		bx = 1000 + (string_width("NO")*3/2) - 50 - 20 - (string_width("NO")*3);
		by = optionsyoffset + 500 + 2 * hover1 - (string_height("NO")*3/2) - 20
		
		draw_sprite_ext(!hover1 ? spr_dark_nineslice : spr_undark_nineslice, 0, bx, by, ((string_width("NO"))*3 + 40)/sprite_get_width(spr_dark_nineslice), (string_height("NO")*3 + 40)/sprite_get_height(spr_dark_nineslice), 0, c_white, 1)
		
		draw_set_color(!hover1 ? #d1d1d1 : c_white)
		draw_set_halign(fa_right);
		
		scr_draw_text_transformed_outline(1000 + (string_width("NO")*3/2) - 50, optionsyoffset + 500 + 2 * hover1, "NO", 3, 3, 1)
	
		if hover0 && mouse_check_button_released(mb_left) {
			quit *= 2;
			REALLYquit *= 2;
		}
		if hover1 && mouse_check_button_released(mb_left) {
			quit = 0;
			REALLYquit = 0;
		}
	}
}

draw_sprite_ext((sprite == 0 ? spr_pause_unpressed : spr_pause_pressed), frame, x - ((sprite_width * xscale) - sprite_width)/2, y + drawyoffset - ((sprite_height * yscale) - sprite_height)/2, xscale, yscale, 0, c_white, 1);