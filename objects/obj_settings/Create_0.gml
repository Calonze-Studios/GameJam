options_width = 485;
options_maxheight = 401;
options_height = 21;
state = 0;

depth = -102;

options_clicked = 0;

loading_frame = 0;

options_mouse_x_last = 0;
options_mouse_y_last = 0;
options_mouse_grabbed = 0;

alarmed_once = 0;

option_surface = surface_create(477, 1);

x = irandom_range(0, 1600-options_width);
y = irandom_range(18, 900-options_maxheight);

description_width = 485;
description_height = 21;
description_maxheight = 401;
description_x = 0;
description_y = 0;
description_state = -1;

description_mouse_x_last = 0;
description_mouse_y_last = 0;
description_mouse_grabbed = 0;

description_surface = surface_create(477, 1)

description_target = -1;

settings_depth = depth;
description_depth = depth;