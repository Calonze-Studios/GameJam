draw_set_color(c_black);
draw_rectangle(0, yoffset, 1600, yoffset + 900, 0);

var num = 0;
for (var i = 0; i < string_length(string(final_score)); i++) {
	num *= 10;
	num += irandom_range(0, 9);
}

var gibberish = string(num);

draw_set_halign(fa_middle);
draw_set_valign(fa_center);
draw_set_color(c_white);

var _yoffset = 200;
for (var i = 0; i < counter_on; i++) {
	draw_text_transformed(800, yoffset + _yoffset, requirements[i], 2, 2, 0);
	_yoffset += string_height(requirements[i])*2 + 10;
}

draw_text_transformed(800, yoffset + 50, "YOU LOST!", 3, 3, 0)

if special_on = 0 {
	draw_text_transformed(800, yoffset + 600, "TOTAL SCORE: " + gibberish + "...", 2, 2, 0);
} else {
	draw_text_transformed(800, yoffset + 600, "TOTAL SCORE: " + string(final_score) + "!", 3, 3, 0);
		
}

if special_on >= 2 && set_high_score {
	draw_set_color(c_yellow);
	draw_text_transformed_color(800, yoffset + 700, "... THAT'S A NEW HIGH SCORE!", 4, 4, 0, #ffec65, #ffec65, c_yellow, c_yellow, 1);
	draw_set_color(c_white);
}

if (special_on == 2 && !set_high_score) || (special_on == 3 && set_high_score) {
	draw_set_halign(fa_left);
	draw_set_valign(fa_bottom);
	var b1 = scr_draw_button_sprite(30, 870, "MAIN MENU", spr_dark_nineslice, #d1d1d1, spr_undark_nineslice, c_white, 2, 2, 1);
	
	draw_set_halign(fa_right);
	var b2 = scr_draw_button_sprite(1570, 870, "PLAY AGAIN", spr_dark_nineslice, #d1d1d1, spr_undark_nineslice, c_white, 2, 2, 1);

	if b1 && mouse_check_button_pressed(mb_left) {
		init();
		
		room_goto(room_title);
	}
	if b2 && mouse_check_button_pressed(mb_left) {
		init();
		
		scr_add_random_streamer();
		
		room_restart();
	}

}