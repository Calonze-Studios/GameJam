global.streamer_state = [0]; // Which "state" each of the streamers are in
global.streamer_speed = [1]; // The speed of their movements
global.streamer_speed_norm = [1]; // Their normal speed
global.streamer_speed_fastest = [3] // Their fastest speed

global.chat_state = [0]; // Which "state" each streamer's chat is
global.chat_rate = [60]; // The speed at which each streamer's chat is going
global.chat_rate_norm = [60]; // The normal speed at which each streamer's chat can go
global.chat_rate_fastest = [15] // The fastest speed at which each streamer's chat can go

global.streamer_game = [0]; // Which game each streamer is playing
global.streamer_game_state = [0]; // The state of each streamer's game

global.streamer_sprite = [0] // Which set of sprites each streamer is using
global.streamer_on = 0; // Which streamer you're currently watching
global.streamers_unlocked = 1; // How many streamers you currently have

global.subtitles = ""; // The subtitles
global.chat_messages[0] = []; // Each streamer's chat's messages

global.night_on = 0; // Which night you're currently on

global.font = font_add_sprite_ext(spr_egg_font, "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz.:!?,;'\"()[]{}$@#/\\|%^*-+=<>~01234567890", 0, 1);

window_set_size(912, 513);
window_center();