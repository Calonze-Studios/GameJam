global.game_paused = 1;

depth = -9999;
if instance_exists(obj_shop_button)
	instance_deactivate_object(obj_shop_button);
if instance_exists(obj_pause_button)
	instance_deactivate_object(obj_pause_button);
if instance_exists(obj_settings) {
	instance_deactivate_object(obj_settings);
	depth = obj_settings.description_depth - 10;
}

yoffset = -1600;
state = 0;
counter_on = 0;

requirements = ["YOU GOT " + string(global.gold) + " MONEY!",
				"YOU UNLOCKED " + string(global.streamers_unlocked) + (global.streamers_unlocked > 1 ? " STREAMERS!" : " STREAMER."),
				"AND SURVIVED FOR " + string(ceil(global.timer/30)) + (abs(global.gold) != 1 ? " SECONDS!" : " SECOND, SOMEHOW.")];


alarm[0] = 90;

special_on = 0;

final_score = clamp((ceil(global.gold/10) + (global.streamers_unlocked * ceil(clamp(global.timer, 1, 99999)/60))) * 10, 0, 99999);
set_high_score = final_score > global.highscore;
scr_edit_highscore(max(global.highscore, final_score));