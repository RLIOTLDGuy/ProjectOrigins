//Get Inputs
var _keyRight = keyboard_check(vk_right);
var _keyLeft = keyboard_check(vk_left);
var _keyJump = keyboard_check(vk_space);

//Work out where to move horizontally
hsp = (_keyRight - _keyLeft) * hspwalk;

//Work out where to move vertically
vsp = vsp + grv

//Work out if we should jump
if (canjump-- > 0) && (_keyJump)
{
	vsp = vspjump;
	canjump = 0
}

//Collide and Move
if (place_meeting(x + hsp, y, obj_solid))
{
	while (abs(hsp) > 0.1)
	{
		hsp *= 0.5;
		if (!place_meeting(x + hsp, y, obj_solid)) x += hsp;
	}
	hsp = 0;
}
x += hsp;

if (place_meeting(x, y + vsp, obj_solid))
{
	if (vsp > 0) canjump = 10;
	while (abs(vsp) > 0.1)
	{
		vsp *= 0.5;
		if (!place_meeting(x, y + vsp, obj_solid)) y += vsp;
	}
	vsp = 0;
}
y += vsp;