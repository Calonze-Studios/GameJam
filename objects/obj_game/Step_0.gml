if (alarm[0] > 0) {
	if (global.game_paused) { // stop the alarm while paused
		alarm[0]++;
	} else if (global.in_shop) { // halve the speed while in shop
		alarm[0] += 0.5;
	} else if (not_switching) { // while the game isnt active stop alarm
		alarm[0]++;
	}
}