function scr_chat_get_random_username() {
	var usernames = [
		"aestheticEasterfella",
		"darkerKnife",
		"emotionalXylograph",
		"nuancedSpecter"
	]
	return usernames[irandom(array_length(usernames)-1)];
}