if instance_exists(obj_score)
	exit;

var gameinprogress = 0;

for (var i = 0; i < array_length(global.streamer_game); i++) {
	if variable_instance_exists(global.streamer_game[i], "not_switching") {
		if (!global.streamer_game[i].not_switching) {
			gameinprogress = 1;
			break;
		}
	}
}

global.qteinprogress = gameinprogress;

if !global.game_paused || gameinprogress {
	global.timer += 1 / (global.in_shop+1);
	if !qteing && !waiting
		gametimer += 1 / (global.in_shop+1) * (global.rush_hour+1)
	else if !waiting {
		if outside
			outside_timer += 1 / (global.in_shop+1) * (global.rush_hour+1)
		else
			qte_timer += 1 / (global.in_shop+1) * (global.rush_hour+1)
	}
	if waiting
		wait_timer += 1 / (global.in_shop+1) * (global.rush_hour+1)
}

global.hour = floor(global.timer / 2400)%23;
if global.hour%6 == 0 {
	global.rush_hour = 0;
} else {
	global.rush_hour = 1;
}

//global.rush_hour = 1;

if (global.rush_hour) {
	if (!audio_is_playing(mus_rush_hour)){
		scr_mus_play(mus_rush_hour);
	}
} else {
	if (audio_is_playing(mus_rush_hour)){
		audio_stop_sound(mus_rush_hour);
	}
}

if (gametimer > 1*fps){
	var _gameid = irandom_range(0,global.streamers_unlocked-1);
	if (!gameinprogress) {
		with (global.streamer_game[_gameid]) {
			not_switching = false;
		}
	}
	gametimer = 0;
}

if global.lives <= 0 && !instance_exists(obj_score) {
	instance_create_depth(0, 0, 0, obj_score);
}