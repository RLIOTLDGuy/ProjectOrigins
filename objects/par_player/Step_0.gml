//Get The Inputs
var _keyRight = keyboard_check(vk_right);
var _keyLeft = keyboard_check(vk_left);
var _keyJump = keyboard_check(vk_space);

//Work out where to move horizontally
hsp = (_keyRight - _keyLeft) * HspWalk;

//Work out where to move vertically
vsp = vsp + grv

//Work out if we should perform a jump
if (CanJump-- > 0) && (_keyJump)
{
	vsp = VspJump;
	CanJump = 0
}

//Colliding and Moving
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
	if (vsp > 0) CanJump = 10;
	while (abs(vsp) > 0.1)
	{
		vsp *= 0.5;
		if (!place_meeting(x, y + vsp, obj_solid)) y += vsp;
	}
	vsp = 0;
}
y += vsp;