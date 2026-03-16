draw_set_alpha(0.25 * clamp((800 - (sprite_width/2)) / x, 0, 1));
draw_set_color(c_black);
//depth = 100;
draw_rectangle(0, 0, 1600, 900, 0)

draw_set_color(c_white);
draw_set_alpha(1)
//depth = 97;
draw_self()