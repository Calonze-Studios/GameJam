function scr_chat_get_random_message_by_state(state = global.chat_state[global.streamer_on]) {
	var random_messages = ["null"];
	switch (state) {
		case 0:
			random_messages = [
				"i feel... NEUTRAL...",
				"so NEUTRALs... so IDLE.",
				"i remember you're... NEUTRALS."
			];
			break;
		case 1:
			random_messages = [
				"i feel... ANGRY...",
				"so GENOCIDEs... so ANGER.",
				"i remember you're... ANGRYS."
			];
		break;
	}
	return random_messages[irandom(array_length(random_messages)-1)];
}