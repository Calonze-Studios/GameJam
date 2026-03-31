// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_load_minigame(streamer){
	states = [];
	current_state = 0;
	previous_state = 0;
	
	switch (streamer){
		default:
			var state = add_minigame_state(id,"idle")
			state.add_layer("bg",spr_mg_pkmn_idle_bg,30);
			state.add_layer("fg",spr_mg_pkmn_idle_fg,30);

			state.set_timer_seconds(5);

			state = add_minigame_state(id,"battle_fire_idle")
			state.add_option("Attack the Fire!",true);
			state.add_option("Jus sit there doing nothing like a dumbass",false);
			state.correct_state = "battle_fire_win";
			state.wrong_state = "battle_fire_lose";
			state.add_layer("bg",spr_mg_pkmn_battle_bg,2);
			state.add_layer("fg",spr_mg_pkmn_firebattle_idle,2);
			state.type = MG_STATE_QTEVENT;

			state = add_minigame_state(id,"battle_fire_win")
			state.add_layer("bg",spr_mg_pkmn_battle_bg,2);
			state.add_layer("fg",spr_mg_pkmn_firebattle_win,2);
			state.type = MG_STATE_RESULT;

			state = add_minigame_state(id,"battle_fire_lose")
			state.add_layer("bg",spr_mg_pkmn_battle_bg,2);
			state.add_layer("fg",spr_mg_pkmn_firebattle_lose,2);
			state.type = MG_STATE_RESULT;
			break;
	}
}