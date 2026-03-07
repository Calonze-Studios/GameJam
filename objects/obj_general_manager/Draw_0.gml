if surface_get_target() != application_surface {
	surface_reset_target();
	surface_set_target(application_surface);
}
	
show_debug_message(string(surface_get_target()) + string(application_surface))



draw_sprite(spr_crt_2, 0, 0, 0);
draw_sprite_ext(spr_crt_3, 0, 0, 0, 1, 1, 0, c_white, glow_alpha)

var xscale = 1.002
var yscale = 1.002

if !surface_exists(global.computersurf)
	global.computersurf = surface_create(918, 557)


draw_surface_ext(global.computersurf, global.computersurf_xdraw, global.computersurf_ydraw, 1, 1, 0, c_white, 0.9)
/*
gpu_set_blendmode_ext(bm_src_color, bm_zero);
draw_surface_ext(global.computersurf, global.computersurf_xdraw - (((918 * xscale) - 918) / 2), global.computersurf_ydraw - (((557 * yscale) - 557) / 2), xscale, yscale, 0, c_white, 0.1)

gpu_set_blendmode(bm_normal);