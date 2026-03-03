var rows = 1;

var screen_on = 0;

var xscale = 0.25;
var yscale = 0.25;

var max_per_row = 2;
var space_between = 40;
var max_rows = ceil(global.streamers_unlocked/max_per_row)

var screens_on_row = [1];

for (var j = 0; j < global.streamers_unlocked; j++) {
	if screen_on >= max_per_row {
		screens_on_row[rows] = screen_on;
		rows++
		screen_on = 0;
	}
	
	screen_on++
}

rows = 0;
screen_on = 0;
for (var i = 0; i < global.streamers_unlocked; i++) {
	if screen_on >= max_per_row {
		rows++
		screen_on = 0;
	}
	
	if surface_get_target() != application_surface
		surface_set_target(application_surface);
	
	var xcalc = 912/2 - (912*xscale) + space_between*screens_on_row[rows] + (912 * xscale*screen_on)
	var ycalc = 513/2
	
	draw_set_alpha(1)
	draw_surface_ext(global.streamsurf[i], xcalc, ycalc, xscale, yscale, 0, c_white, 1);
	if mouse_x >= xcalc && mouse_x <= xcalc + 912*xscale && mouse_y >= ycalc && mouse_y <= ycalc + 513*yscale && global.game_state == 0 {
		draw_set_color(c_white)
		draw_set_alpha(0.2)
		draw_rectangle(xcalc, ycalc, xcalc + 912*xscale, ycalc + 513*yscale, 0)
		if mouse_check_button_pressed(mb_left) {
			global.streamer_on = i;
			global.game_state = 1;
		}
		draw_set_alpha(1)
	}
	screen_on++
}

if global.game_state == 1 {
	draw_set_alpha(1)
	draw_surface(global.streamsurf[global.streamer_on], 0, 0)
}
