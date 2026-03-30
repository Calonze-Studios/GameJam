var rows = 1;

draw_set_alpha(1);

var screen_on = 0;

var xscale = 0.4;
var yscale = 0.4;

var max_per_row = 2;

var x_space_between = 912 * 0.025;
var y_space_between = 513 * 0.025;

var max_rows = ceil(global.streamers_unlocked/max_per_row)

var screens_on_row = [1];

global.stream_hovering = -1

for (var j = 0; j < global.streamers_unlocked; j++) {
	screen_on++
	screens_on_row[rows-1] = screen_on;
	
	if screen_on >= max_per_row {
		rows++
		screen_on = 0;
	}
}

rows = 0;
screen_on = 0;
var xcalc = (912 - (screens_on_row[rows] * (912 * xscale)) - ((screens_on_row[rows]-1) * x_space_between))/2 + ((screen_on * (912 * xscale)) + ((clamp(screen_on, 0, 4) * x_space_between)))
var ycalc = (513 - (max_rows * (513 * yscale)) - ((max_rows-1) * y_space_between))/2 + ((rows * (513 * yscale)) + ((clamp(rows, 0, 4) * y_space_between)))

for (var i = 0; i < global.streamers_unlocked; i++) {
	if screen_on >= max_per_row {
		rows++
		screen_on = 0;
	}
	
	xcalc = (912 - (screens_on_row[rows] * (912 * xscale)) - ((screens_on_row[rows]-1) * x_space_between))/2 + ((screen_on * (912 * xscale)) + ((clamp(screen_on, 0, 4) * x_space_between)))
	ycalc = (513 - (max_rows * (513 * yscale)) - ((max_rows-1) * y_space_between))/2 + ((rows * (513 * yscale)) + ((clamp(rows, 0, 4) * y_space_between)))
	
	if mouse_x >= global.computersurf_xdraw + xcalc && mouse_x <= global.computersurf_xdraw + xcalc + 912*xscale && mouse_y >= global.computersurf_ydraw + ycalc && mouse_y <= global.computersurf_ydraw + ycalc + 513*yscale && global.game_state == 0 && !global.in_shop && !global.game_paused
		global.stream_hovering = i;
		
	screen_on++
}
rows = 0;
screen_on = 0;

if !surface_exists(global.computersurf)
	global.computersurf = surface_create(918, 557);
		
surface_set_target(global.computersurf);
//surface_set_target(application_surface);
draw_clear(c_black);

for (var a = 0; a < global.streamers_unlocked; a++) {
	if screen_on >= max_per_row {
		rows++
		screen_on = 0;
	}	
	
	xcalc = (912 - (screens_on_row[rows] * (912 * xscale)) - ((screens_on_row[rows]-1) * x_space_between))/2 + ((screen_on * (912 * xscale)) + ((clamp(screen_on, 0, 4) * x_space_between)))
	ycalc = (513 - (max_rows * (513 * yscale)) - ((max_rows-1) * y_space_between))/2 + ((rows * (513 * yscale)) + ((clamp(rows, 0, 4) * y_space_between)))
	
	draw_sprite_ext(scr_get_thumbnail_by_game(global.streamer_game[a]), 0, xcalc, ycalc, xscale, yscale, 0, c_white, 1)
	
	if !surface_exists(global.streamsurf[a])
		global.streamsurf[a] = surface_create(912, 513);
	
	if global.stream_hovering == a {
		hover_alpha[a] += 0.1
		hover_alpha[a] = clamp(hover_alpha[a], 0, 1)
		draw_surface_ext(global.streamsurf[a], xcalc, ycalc, xscale, yscale, 0, c_white, hover_alpha[a]);
		
		if mouse_check_button_pressed(mb_left) {
			global.streamer_on = a;
			global.game_state = 1;
		}
		
	} else {
		if hover_alpha[a] > 0 {
			hover_alpha[a] -= 0.1
			draw_surface_ext(global.streamsurf[a], xcalc, ycalc, xscale, yscale, 0, c_white, hover_alpha[a]);
		}
	}
	
	if global.streamer_game_state[a] != 0
		draw_sprite(spr_placeholder_game_in_progress, 0, xcalc, ycalc)
	
	
	
	screen_on++
}



if global.game_state == 1 {
	draw_set_alpha(1)
	if !surface_exists(global.streamsurf[global.streamer_on])
		global.streamsurf[global.streamer_on] = surface_create(912, 513)
	draw_surface(global.streamsurf[global.streamer_on], stream_x, stream_y);
}

surface_reset_target();
surface_set_target(application_surface);