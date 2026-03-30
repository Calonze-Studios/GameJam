description = ""
description_xoffset = 0;

option_sel = -1;

description_alpha = 1;

description_on = -1;

state = 0;

beginning_alarm_counter = 7;

lasthover = -1;
pressing = 0;

settinged = 0;

dark_rec_alpha = 0;
alarm_triggered = 0;

mus_command_on = 0;
mus_commands = [vk_up, vk_up, vk_down, vk_down, vk_left, vk_right, vk_left, vk_right, ord("B"), ord("A"), vk_enter];

if !instance_exists(obj_persistent_settings_manager)
	instance_create_depth(0, 0, 0, obj_persistent_settings_manager);