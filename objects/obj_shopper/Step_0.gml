if state == 0 {
	x = lerp(x, 800 - (sprite_width/2), 0.25)
}

if state == 2 {
	x = lerp(x, -sprite_width, 0.25)
}

if x <= -sprite_width
	instance_destroy();