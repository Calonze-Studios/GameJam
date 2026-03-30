var a = window_get_fullscreen()

window_set_fullscreen(scr_get_setting_by_name("Full screen"));

var sep = 0;
for (var i = 0; i < string_length(scr_get_setting_by_name("Game Size")); i++) {
	if string_char_at(scr_get_setting_by_name("Game Size"), i+1) == "x" {
		sep = i;
		break;
	}
}

var w = 0;
for (var j = 0; j < sep; j++) {
	w *= 10;
	w += real(string_char_at(scr_get_setting_by_name("Game Size"), j+1))
}
global.screen_width = w;

var h = 0;
for (var k = sep+1; k < string_length(scr_get_setting_by_name("Game Size")); k++) {
	h *= 10;
	h += real(string_char_at(scr_get_setting_by_name("Game Size"), k+1))
}
global.screen_height = h;

if a != window_get_fullscreen() {
	window_center();
}