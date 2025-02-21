scr_collision_init()
grav = 0.5
usesGravity = true
hsp = 0
vsp = 0
grounded = false

if (grounded && vsp > 0)
{
	hsp = 0;
}
else if (grounded = false)
{
	hsp = approach(hsp, 0, 0.1)
}
