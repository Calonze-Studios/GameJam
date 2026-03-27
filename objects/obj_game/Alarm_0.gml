/// @description Insert description here
// You can write your code in this editor
switch (states[current_state].type){
	case MG_STATE_IDLE:
		if (target_stream != 0) switch_to_random_state(MG_STATE_QTEVENT);
		break;
	case MG_STATE_QTEVENT:
		show_debug_message("failed to backseat");
		switch_to_state_name(states[current_state].wrong_state);
		break;
	case MG_STATE_RESULT:
		switch_to_random_state(MG_STATE_IDLE);
		break;
}







