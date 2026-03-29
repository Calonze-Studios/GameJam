function scr_get_thumbnail_by_game(game = global.streamer_game[global.streamer_on]){
	var gamesprites = [
		spr_placeholder_thumbnail
	]
	
	return gamesprites[clamp(game, 0, array_length(gamesprites)-1)]
}