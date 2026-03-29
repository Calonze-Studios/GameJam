alpha -= 0.1

show_debug_message(room);
show_debug_message(alpha)

if alpha <= 0
	instance_destroy();