if surface_get_target() != application_surface {
	surface_reset_target();
	surface_set_target(application_surface);
}

draw_set_alpha(1);
draw_sprite(spr_crt_2, 0, 0, 0);
draw_sprite_ext(spr_crt_3, 0, 0, 0, 1, 1, 0, c_white, glow_alpha)

if !surface_exists(global.computersurf)
	global.computersurf = surface_create(918, 557)

// the bulge shader
//shader_set(shd_bulge);
draw_surface_ext(global.computersurf, global.computersurf_xdraw, global.computersurf_ydraw, 1, 1, 0, c_white, 0.9)
//shader_reset();