chat_adding_rate = 0; // The rate at which the chat speed turns to normal after changing
chat_alarmed_once = 0; // Variable to see if you've triggered alarm[1] already

streamer_timer = [0]; // Timer for the streamer to change frames
streamer_frame = [0]; // Which frame the streamer sprite is on
streamer_sprite = [asset_get_index("spr_streamer" + string(global.streamer_sprite[0]) + "_" + scr_get_string_by_state(global.streamer_state[0]))]; // The streamer's sprite
streamer_adding_rate = [0]; // The rate at which the streamer speed turns to normal after changing
streamer_alarmed_once = [0]; // Variable to see if you've triggered alarm[2] already
streamer_trigger = [0]
streamer_trigger_timer = [0]

chatsurf = surface_create(259, 323)