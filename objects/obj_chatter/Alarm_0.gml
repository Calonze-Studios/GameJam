var font_width = 3;
var font_width_on = 0;
var maxwidth = floor(max_chatwidth/font_width)
var storedspace = 0;
var textarray = []

for (var d = 0; d < global.streamers_unlocked; d++) {
	randomize()
	var name = scr_chat_get_random_username();
	var msg = scr_chat_get_random_message_by_state(global.chat_state[d]);

	var finished_message = string(name) + ": " + string(msg)
	for (var a = 0; a < string_length(finished_message); a++) {
		textarray[a] = string_char_at(finished_message, a+1);
	}

	for (var i = 1; i <= string_length(finished_message); i++) {
		font_width_on += font_width;
	
		if string_char_at(finished_message, i) == " "
			storedspace = i;
		
		if font_width_on > maxwidth && storedspace != 0 {
			show_debug_message(font_width_on)
			show_debug_message(maxwidth)
			font_width_on = 0;
			textarray[storedspace-1] = "\n";
			i = storedspace;
		}

	
	}

	finished_message = ""
	for (var b = 0; b < array_length(textarray); b++;) {
		finished_message += textarray[b];
	}

	array_push(global.chat_messages[d], finished_message);

	if array_length(global.chat_messages) > 21 {
		for (var c = 0; c < array_length(global.chat_messages[d])-1; c++) {
			global.chat_messages[d][c] = global.chat_messages[d][c+1]
		}

		array_delete(global.chat_messages[d], 21, 1);
	}
}

alarm[0] = global.chat_rate[global.streamer_on] + irandom_range(-5, 5);