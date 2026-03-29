global.streamer_state = [0]; // Which "state" each of the streamers are in
global.streamer_speed = [2]; // The speed of their movements
global.streamer_speed_norm = [2]; // Their normal speed
global.streamer_speed_fastest = [6] // Their fastest speed

global.chat_state = [0]; // Which "state" each streamer's chat is
global.chat_rate = [30]; // The speed at which each streamer's chat is going
global.chat_rate_norm = [30]; // The normal speed at which each streamer's chat can go
global.chat_rate_fastest = [7] // The fastest speed at which each streamer's chat can go
global.chat_messages[0] = []; // Each streamer's chat's messages

global.streamer_game = [0]; // Which game each streamer is playing
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

global.game_state = 0; // 0 - not watching stream
					   // 1 - watching stream

global.settings_name = [];
global.settings_desc = [];
global.settings_type = [];
global.settings_value = [];
global.settings_options = [];
global.settings_section = [];

global.score = 0;
global.highscore = 0;

global.stream_hovering = -1;

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

window_set_size(1600, 900);
//window_center();