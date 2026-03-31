// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_load_minigame(streamer){
	states = [];
	current_state = 0;
	previous_state = 0;
	
	streamer = 1;
	
	switch (streamer){
		case 1:
			var state = add_minigame_state(id,"idle");
			state.add_layer("bg",spr_mg_vrchat_idle_bg,0);
			state.add_layer("fg",spr_mg_vrchat_idle_fg,5);
			
			state = add_minigame_state(id,"friend_idle");
			state.add_layer("bg",spr_mg_vrchat_qte_bg,0);
			state.add_layer("fg",spr_mg_vrchat_friend_neutral,0);
			state.add_layer("ui",spr_mg_vrchat_friend_ui,0);
			state.add_option("Add friend!",true);
			state.add_option("Block",false);
			state.wrong_state = "friend_fail";
			state.correct_state = "friend_success";
			state.type = MG_STATE_QTEVENT;
			
			state = add_minigame_state(id,"friend_fail")
			state.add_layer("bg",spr_mg_vrchat_qte_bg,0);
			state.add_layer("bg",spr_mg_vrchat_friend_fail,0);
			state.add_layer("ui",spr_mg_vrchat_friend_ui,0);
			state.type = MG_STATE_RESULT;
			
			state = add_minigame_state(id,"friend_success")
			state.add_layer("bg",spr_mg_vrchat_qte_bg,0);
			state.add_layer("bg",spr_mg_vrchat_friend_win,0);
			state.add_layer("bg",spr_mg_vrchat_friend_winfx,5);
			state.add_layer("ui",spr_mg_vrchat_friend_ui,0);
			state.type = MG_STATE_RESULT;
			
			state = add_minigame_state(id,"ragebaiter_idle");
			state.add_layer("bg",spr_mg_vrchat_qte_bg,0);
			state.add_layer("fg",spr_mg_vrchat_ragebait_neutral,5);
			state.add_layer("ui",spr_mg_vrchat_ragebait_ui,0);
			state.add_option("Add friend!",false);
			state.add_option("Block",true);
			state.wrong_state = "ragebaiter_fail";
			state.correct_state = "ragebaiter_success";
			state.type = MG_STATE_QTEVENT;
			
			state = add_minigame_state(id,"ragebaiter_fail")
			state.add_layer("bg",spr_mg_vrchat_qte_bg,0);
			state.add_layer("bg",spr_mg_vrchat_ragebait_fail,0);
			state.add_layer("ui",spr_mg_vrchat_ragebait_ui,0);
			state.type = MG_STATE_RESULT;
			
			state = add_minigame_state(id,"ragebaiter_success")
			state.add_layer("bg",spr_mg_vrchat_qte_bg,0);
			state.add_layer("bg",spr_mg_vrchat_ragebait_win,0);
			state.add_layer("ui",spr_mg_vrchat_ragebait_blocked,0);
			state.type = MG_STATE_RESULT;
		
			break;
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