global.streamer_state = [0]; // Which "state" each of the streamers are in
global.streamer_speed = [2]; // The speed of their movements
global.streamer_speed_norm = [2]; // Their normal speed
global.streamer_speed_fastest = [6] // Their fastest speed

global.chat_state = [0]; // Which "state" each streamer's chat is
global.chat_rate = [30]; // The speed at which each streamer's chat is going
global.chat_rate_norm = [30]; // The normal speed at which each streamer's chat can go
global.chat_rate_fastest = [7] // The fastest speed at which each streamer's chat can go
global.chat_messages[0] = []; // Each streamer's chat's messages

global.streamer_game = []; // Which game each streamer is playing
global.streamer_game_state = [0]; // The state of each streamer's game
global.streamer_sprite = [0] // Which set of sprites each streamer is using
global.streamer_on = 0; // Which streamer you're currently watching
global.streamers_unlocked = 1; // How many streamers you currently have

global.subtitles = [""]; // Each streamer's subtitles
global.banter_subtitles = 0;
global.subtitle_timer = [0]; // Timer for the subtitles to disappear
global.line_sound = [-1]; // Which sound the subtitles should play

global.streamsurf[0] = surface_create(912, 513);
global.computersurf = surface_create(918, 557);

global.computersurf_xdraw = 382;
global.computersurf_ydraw = 117;

global.night_on = 0; // Which night you're currently on

global.last_guess = -1;

global.hour = 0;
global.rush_hour = 0;
global.timer = 0;
	
randomize();
global.qtetime = irandom_range(5, 10);
global.qtetime *= 30;

global.qteinprogress = 0;

global.game_state = 0; // 0 - not watching stream
					   // 1 - watching stream

global.settings_name = [];
global.settings_desc = [];
global.settings_type = [];
global.settings_value = [];
global.settings_options = [];
global.settings_section = [];
global.settings_key = [];

scr_setting_add("musvolume", "Volume", "Music volume", "The volume of the music! Yea h!!", "real", 100);
scr_setting_add("sfxvolume", "Volume", "Sound effect volume", "The sound effect volume!", "real", 100);

scr_setting_add("fullscreen", "Display", "Full screen", "Enable or disable FULL SCREEN! Full screen is recommended for the game to look better, but not necessary.", "bool", 1)
scr_setting_add("size", "Display", "Game Size", "Change your screen size! 1600x900 recommended, but could cause scaling issues on smaller monitors.", "string", "1600x900", ["1600x900", "800x450"])

global.sfxvolume = 1;
global.musvolume = 1;

global.screen_height = 1600;
global.screen_width = 900;

global.score = 0;
scr_edit_highscore(0);
global.highscore = scr_get_highscore();

global.stream_hovering = -1;

global.lives = 3;
global.immunity = 0;

global.gold = 0;
global.inventory = [];
global.inventory_item_count = [];

global.shop = [];
global.shop_item_count = [];

scr_add_item_to_shop(0, 2);
scr_add_item_to_shop(1, 2);
scr_add_item_to_shop(2, 2);
scr_add_item_to_shop(3, 2);
scr_add_item_to_shop(4, 2);
scr_add_item_to_shop(5, 2);

global.cart = [];
global.cart_item_count = [];

global.in_shop = 0;
global.game_paused = 0;

global.font = font_add_sprite_ext(spr_egg_font, "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz.:!?,;'\"()[]{}$@#/\\|%^*-+=<>~01234567890", 0, 1);
draw_set_font(global.font)
global.font_2x = font_add_sprite_ext(spr_egg_font_2x, "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz.:!?,;'\"()[]{}$@#/\\|%^*-+=<>~01234567890", 0, 1);

window_set_size(1600, 900);
//window_center();