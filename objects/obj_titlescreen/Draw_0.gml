draw_set_alpha(1);
draw_set_color(c_white)
draw_sprite(spr_title_screen_bg, 0, 0, 0);

gpu_set_blendmode(bm_subtract);

var x0 = 300;
var x1 = 1100;

draw_set_alpha(1)
draw_rectangle_color(x0, 0, x1, 900, c_black, c_white, c_white, c_black, 0)
gpu_set_blendmode(bm_normal);

draw_set_color(c_black);
draw_rectangle(x1, 0, 1600, 900, 0);

draw_self();


var options = ["STORY MODE", "ARCADE MODE", "SETTINGS", "CREDITS"];
var descriptions = ["Not available in gamejam demo!",
					"Aim for a HIGH SCORE!" + (global.highscore == 0 ? "" : ("\nHigh score: " + string(global.highscore))),
					"Change your SETTINGS!",
					"rogues gallery"];
					
draw_set_halign(fa_right)
draw_set_valign(fa_top)

if description_on != -1 {
	
	draw_set_color(c_white);
	
	draw_set_alpha(description_alpha);
	
	scr_draw_text_transformed_outline(1600 + string_width(descriptions[description_on])*3 - description_xoffset, 20, descriptions[description_on], 3, 3, 1)
	
	draw_set_alpha(1);
	
	description_xoffset = lerp(description_xoffset, string_width(descriptions[description_on])*3 + 50, 0.25);
	
	if lasthover == -1 {
		description_alpha -= 0.1;
	}
	
	if description_alpha <= 0 {
		description_on = -1
		description_xoffset = 0;
	}
}

//draw_set_halign(fa_left)


var button = [0];

for (var i = 0; i < array_length(options); i++) {
	if i != 0 {
		button[i] = scr_draw_button_sprite(1550, 150 + (200 * i), options[i], spr_dark_nineslice, #d1d1d1, spr_undark_nineslice, c_white, 3, 3, 1)
		if (button[i] || pressing == i) && mouse_check_button(mb_left) && pressing != -1 {
			pressing = i;
		}
		if ((button[i] && mouse_check_button_released(mb_left) && option_sel == -1) || (pressing == i && !button[i])) && pressing != -1
			option_sel = i
	} else {
		button[i] = scr_draw_button_sprite(1550, 150 + (200 * i), options[i], spr_dark_nineslice, c_grey, spr_dark_nineslice, c_grey, 3, 3, 1, c_black, 0)
		//draw_set_color(c_white)
		//scr_draw_text_transformed_outline(1550, 215, "(Story mode not available\nin gamejam demo! Sorry!)", 2, 2, 1)
	}
	
	if button[i] {
		description_on = i;
		if lasthover != i {
			description_xoffset = 0;
			description_alpha = 1;
			lasthover = i;
		}
	}
	
	
	
}

if mouse_check_button(mb_left) && !script_execute_ext(max, button)
	pressing = -1;
else if !script_execute_ext(max, button) && !mouse_check_button(mb_left)
	pressing = 0;

if !script_execute_ext(max, button) {
	lasthover = -1
}

draw_set_color(c_white);
draw_set_alpha(1);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
scr_draw_text_transformed_outline(1590, 890, "v0.0.1", 2, 2, 1)


draw_set_alpha(dark_rec_alpha);
draw_set_color(c_black);
draw_rectangle(0, 0, 1600, 900, 0);