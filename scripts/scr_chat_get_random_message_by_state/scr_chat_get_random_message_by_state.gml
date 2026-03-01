function scr_chat_get_random_message_by_state(state = global.chat_state[global.streamer_on]) {
	
	if state == 0 {
		var _random = irandom_range(0, 2);
	
		if _random == 0
			return "i feel... NEUTRAL...";
		if _random == 1
			return "so NEUTRALs... so IDLE.";
		if _random == 2
			return "i remember you're... NEUTRALS.";
	} else if state == 1 {
		var _random = irandom_range(0, 2);
	
		if _random == 0
			return "i feel... ANGRY...";
		if _random == 1
			return "so GENOCIDEs... so ANGER.";
		if _random == 2
			return "i remember you're... ANGRYS.";
	}
}