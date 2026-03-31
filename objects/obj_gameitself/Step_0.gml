if instance_exists(obj_score)
	exit;

var gameinprogress = 0;

for (var i = 0; i < array_length(global.streamer_game); i++) {
	if variable_instance_exists(global.streamer_game[i], "states") {
		if global.streamer_game[i].states[i] != MG_STATE_IDLE {
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
	global.rush_hour = 1;
} else {
	global.rush_hour = 0;
}

if global.rush_hour {
	
}

if gametimer >= gametimer_target && !qteing {
	
	game_target = irandom_range(0, array_length(global.streamer_game)-1);
	
	with (global.streamer_game[game_target]) alarm[0] = 1;
	
	for (var i = 0; i < array_length(global.streamer_game); i++) {
		if i != game_target
			with (global.streamer_game[i]) alarm[0] = 2;
	}
	/*
	if game_target == game_prevtarget {
		for (var i = game_target; i != game_prevtarget && array_length(global.streamer_game) > 1; i++) {
			game_target = irandom_range(0, array_length(global.streamer_game));
			i = game_target;
		}
	}
	*/
	scr_streamer_change_state(3, game_target);
	scr_chat_change_state(3, game_target);
	
	global.streamer_game[game_target].difficulty = MG_DIFFICULTY_ANY;

	gametimer = 0;
	
	game_prevtarget = game_target;
	
	qteing = 1;
	
} 
else if qteing {
	if global.last_guess != -1 {
		qte_timer = global.qtetime + 1;
		outside_timer = global.qtetime*2 + 1;
	}
	
	if global.game_state == 1 && global.streamer_on == game_target && !outside {
		outside = 1;
		qte_timer += outside_timer/2
	}
	
	for (var i = 0; i < array_length(global.streamer_game); i++) {
		if i != game_target
			with (global.streamer_game[i]) alarm[0] = 2;
	}
	
	if (outside && outside_timer >= global.qtetime*2) || (!outside && qte_timer >= global.qtetime) {
		
		if global.last_guess == -1
			with (global.streamer_game[game_target]) alarm[0] = 1 
		
		if global.last_guess == 0 || global.last_guess == -1 {
			scr_streamer_change_state(1, game_target);
			scr_chat_change_state(1, game_target);
		} else {
			scr_streamer_change_state(2, game_target);
			scr_chat_change_state(2, game_target);
		}
		
		gametimer = 0;
		qte_timer = 0;
		outside_timer = 0;
		outside = 0;
		qteing = 0;
		waiting = 1;
		
		randomize();
		gametimer_target = irandom_range(10, 25);
		gametimer_target *= 30;
		
		gametimer = -80;
		
		randomize();
		global.qtetime = irandom_range(5, 10);
		global.qtetime *= 30;
	}
	
}
else {
	for (var i = 0; i < array_length(global.streamer_game); i++) {
		if i != game_target || !waiting {
			with (global.streamer_game[i]) alarm[0] = 2;
		}
	}
}

if wait_timer >= 75 {
	with (global.streamer_game[game_target]) alarm[0] = 1;
	waiting = 0;
	wait_timer = 0;
	global.last_guess = -1;
	scr_streamer_change_state(0, game_target);
	scr_chat_change_state(0, game_target)
}

if global.lives <= 0 && !instance_exists(obj_score) {
	instance_create_depth(0, 0, 0, obj_score);
}