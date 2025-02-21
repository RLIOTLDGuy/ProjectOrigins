scr_collision();
if place_meeting(x, y, par_player)
	instance_destroy();

if (usesGravity == true)
{
	if !(place_meeting(x, y, obj_solid)) || !(place_meeting(x, y, obj_platform))
	{
		vsp += 0.5
		grounded = false
	}
	else
	{
		grounded = true
		vsp = 0
	}
}
/*if (!grounded)
{
	y = floor(vsp)
}
	x = floor(hsp)
}