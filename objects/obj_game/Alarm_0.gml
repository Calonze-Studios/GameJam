/// @description Insert description here
// You can write your code in this editor
switch (states[current_state].type){
	case MG_STATE_IDLE:
		switch_to_random_state(MG_STATE_QTEVENT);
		break;
	case MG_STATE_QTEVENT:
		show_debug_message("failed to backseat");
		scr_remove_life();
		scr_streamer_change_state(2,target_stream);
		scr_chat_change_state(2,target_stream);
		switch_to_state_name(states[current_state].wrong_state);
		break;
	case MG_STATE_RESULT:
		switch_to_random_state(MG_STATE_IDLE);
		not_switching = true;
		break;
}







