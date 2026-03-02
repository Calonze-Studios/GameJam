draw_set_color(c_black)
draw_rectangle(0, 0, 912, 513, 0)

var drawon = 0;

var chatsurf = surface_create(259, 323)

surface_set_target(chatsurf)

draw_clear(#0b0018)

draw_set_font(global.font);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top)

var y_offset = 0;

for (var i = array_length(global.chat_messages[global.streamer_on])-1; i >= 0; i--) {
	drawon++;
	y_offset -= string_height(global.chat_messages[global.streamer_on][i]) + 2;
	draw_text(3, 309 + y_offset, global.chat_messages[global.streamer_on][i]);
}

surface_reset_target();
draw_surface(chatsurf, 3, 191);
surface_free(chatsurf);

draw_sprite(streamer_sprite, streamer_frame, 4, 2);

draw_set_halign(fa_right);
draw_text(910, 2, "chat state: " + string(global.chat_state[global.streamer_on]) + " (" + scr_get_string_by_state(global.chat_state[global.streamer_on]) + ")");
draw_text(910, 15, "streamer state: " + string(global.streamer_state[global.streamer_on]) + " (" + scr_get_string_by_state(global.streamer_state[global.streamer_on]) + ")");
draw_text(910, 28, "streamer on: " + string(global.streamer_on+1) + "/" + string(global.streamers_unlocked));