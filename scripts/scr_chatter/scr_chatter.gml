function chat_get_random_message_by_state(state = global.chat_state) {
	if state == 0 {
		var _random = irandom(2);
	
		switch _random {
			case 0:
				return "i feel neutral about this!";
				break;
			case 1:
				return "so NEUTRALs... so IDLEs...";
				break;
			case 2:
				return "i remember you're... NEUTRALS...";
				break;
		}
	}
}