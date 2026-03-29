target_stream = 0;
my_surface = surface_create(640,480);
states = [];

var state = add_minigame_state(id,"idle")
state.add_layer("bg",spr_mg_pkmn_idle_bg,15);
state.add_layer("fg",spr_mg_pkmn_idle_fg,15);
state = add_minigame_state(id,"battle_fire_idle")
state.add_option("Punch",true);
state.add_option("Do nothing",false);
state.correct_state = "battle_fire_win";
state.wrong_state = "battle_fire_lose";
state.add_layer("bg",spr_mg_pkmn_battle_bg,15);
state.add_layer("fg",spr_mg_pkmn_firebattle_idle,15);
state = add_minigame_state(id,"battle_fire_win")
state.add_layer("bg",spr_mg_pkmn_battle_bg,15);
state.add_layer("fg",spr_mg_pkmn_firebattle_win,15);
state = add_minigame_state(id,"battle_fire_lose")
state.add_layer("bg",spr_mg_pkmn_battle_bg,15);
state.add_layer("fg",spr_mg_pkmn_firebattle_lose,15);

function switch_state_to(_name){
	for (var i=0;i<array_length(states);i++){
		if (states[i].name == _name){
			global.streamer_game_state[target_stream] = i;
		}
	}
}