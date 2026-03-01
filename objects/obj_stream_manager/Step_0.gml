////  -- STREAMER STUFF --
/// Testing stuff
if keyboard_check_pressed(ord("0")) && keyboard_check(vk_shift) {
	scr_streamer_change_state(0);
}
if keyboard_check_pressed(ord("1")) && keyboard_check(vk_shift) {
	scr_streamer_change_state(1);
}

if keyboard_check_pressed(vk_right)
	global.streamer_on++
if keyboard_check_pressed(vk_left)
	global.streamer_on--

if keyboard_check_pressed(ord("D")) 
	scr_add_streamer(1, 3, 60, 15, 0, 1)

/// Main stuff
streamer_sprite = asset_get_index("spr_streamer" + string(global.streamer_on) + "_" + scr_get_string_by_state(global.streamer_state[global.streamer_on]));
// Setting the streamer sprite for the streamer you're on

global.streamer_speed[global.streamer_on] -= streamer_adding_rate;
streamer_timer += global.streamer_speed[global.streamer_on];
// Changing the streamer's speed by the adding rate, and the timer by the speed

if streamer_timer >= 30 {
	streamer_frame++
	streamer_timer = 0;
}
// If the streamer timer is more than 30, change
// the frame by 1, and set the timer back to 0

if global.streamer_speed[global.streamer_on] != global.streamer_speed_norm[global.streamer_on] && streamer_alarmed_once == 0 {
	streamer_timer = 0;
	streamer_frame = 0;
	alarm[2] = 90;
	streamer_alarmed_once = 1;
}
// If the streamer speed of the current streamer isn't
// equal to their normal speed, and this hasn't been
// done before, set their timer and frame to 0 and
// make them gradually slow down in 3 seconds

global.streamer_speed[global.streamer_on] = clamp(global.streamer_speed[global.streamer_on], global.streamer_speed_norm[global.streamer_on], global.streamer_speed_fastest[global.streamer_on]);
// Caps the streamer speed of the current streamer

if global.streamer_speed[global.streamer_on] <= global.streamer_speed_norm[global.streamer_on] && streamer_alarmed_once {
	global.streamer_speed[global.streamer_on] = global.streamer_speed_norm[global.streamer_on];
	streamer_adding_rate = 0;
	streamer_alarmed_once = 0;
}
// If the streamer speed is equal to or less than the normal speed
// after alarm[2] has already been triggered
// set the streamer's speed to normal and
// the adding rate to 0

////  -- CHAT STUFF --
/// Testing stuff
if keyboard_check_pressed(ord("0")) && !keyboard_check(vk_shift) {
	scr_chat_change_state(0);
}
if keyboard_check_pressed(ord("1")) && !keyboard_check(vk_shift) {
	scr_chat_change_state(1);
}

/// Main stuff

if global.chat_rate[global.streamer_on] != global.chat_rate_norm[global.streamer_on] && chat_alarmed_once == 0 {
	alarm[1] = 90;
	chat_alarmed_once = 1;
}
// If the chat speed of the current streamer isn't
// equal to their normal speed, and this hasn't been
// done before, set their timer and frame to 0 and
// make them gradually slow down in 3 seconds

global.chat_rate[global.streamer_on] += chat_adding_rate;
// Changing the chat speed by the chat adding rate

global.chat_rate[global.streamer_on] = clamp(global.chat_rate[global.streamer_on], global.chat_rate_fastest[global.streamer_on], global.chat_rate_norm[global.streamer_on]);
if global.chat_rate[global.streamer_on] >= global.chat_rate_norm[global.streamer_on] && chat_alarmed_once {
	chat_adding_rate = 0;
	chat_alarmed_once = 0;
}
// If the chat speed is equal to or less than the normal speed
// after alarm[1] has already been triggered
// set the adding rate to 0