function scr_chat_get_random_message_by_state(state = global.chat_state[global.streamer_on]) {
	var random_messages = ["i can't believe it's not placeholder"];
	switch (state) {
		case 0:
			random_messages = [
				"man this game BORING as HELL",
				"bro is playing video games",
				"boriiing!!!",
				"You couldn't pay me to watch this.",
				"bro is bald",
				"you're such a good streamer i love watching you.",
				"marry me streamer!! marry me!!!",
				"When does this game get good",
				"did anyone else see that?",
				"hey my stream is kinda lagging is it just me"
			];
		break;
		case 1:
			random_messages = [
				"god DAMN you're stupid",
				"rigged!!",
				"i believed in you...",
				"what?? it was so obvious????",
				"this streamer stupid af",
				"go play another game dude.",
				"Are you 5 years old?",
				"oh my LORD...",
				"people still watch this guy?",
				"good guess sherlock",
				"don't worry... i still love you..."
			];
		break;
		case 2:
			random_messages = [
				"you did it?? well whaddya know...",
				"rigged!!",
				"i always believed in you!!!",
				"it was easy to guess...",
				"why'd that take you so long",
				"go play another game dude.",
				"This 5 year old is a GENIUS...?",
				"congrats!!",
				"people still watch this guy?",
				"good guess watson",
				"I LOVE YOU!! I LOVE YOU!!!!"
			];
		break;
			
		case 3:
			random_messages = [
				"you don't even have to think about this...",
				"i know some stuff nobody else knows about.",
				"you can do it!! i believe in you!!",
				"it's literally so obvious dude.",
				"this streamer stupid af",
				"just go play something else.",
				"You can do it 5 year old.",
				"i love Flinch(tm)! i love Flinch(tm)!",
				"people still watch this guy?",
				"you can do it sherlock",
				"i love you!! you can do it!!! with the power of love!!!!!"
			];
		break;
	}
	return random_messages[irandom(array_length(random_messages)-1)];
}