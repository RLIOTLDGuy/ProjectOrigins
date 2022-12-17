grv = 0.2; //gravity
hsp = 0; //current horizontal speed
vsp = 0; //current vertical speed
HspWalk = 3.5; //walking speed
VspJump = -6; //jumping speed
CanJump = 0; //are we in contact with a solid
CanDash = false; //resets in case if jayden or any other character touches a solid
dashDistance = 96;
dashTime = 12;
hasControl = true;




stateFree = function()
{
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

//Work out if we should perform a dash
if (CanDash) && (_keyAirDash)
{
	CanDash = false;
	CanJump = 0;
	dashDirection = point_direction(0,0,_keyRight-_keyLeft,_keyDown-_keyUp);
	dashSpd = dashDistance/dashTime;
	dashEnergy = dashDistance;
	state = stateDash;
}

var _atLedge = false;

//horizontal collision
if (place_meeting(x + hsp, y, obj_solid))
{
	
	//is this a ledge?
	var _horiSolid = instance_place(x + hsp, y, obj_solid);
	if (!position_meeting((sign(hsp) == 1) ? _horiSolid.bbox_left : _horiSolid.bbox_right, _horiSolid.bbox_top - 1, obj_solid))
	{
		_atLedge = true;
		var _ledgeAboveOrBelow = sign(par_player.bbox_top - _horiSolid.bbox_top);
	}
	
	
	while (abs(hsp) > 0.1)
	{
		hsp *= 0.5;
		if (!place_meeting(x + hsp, y, obj_solid)) x += hsp;
	}
	hsp = 0;
}
x += hsp;

//vertical collision
if (place_meeting(x, y + vsp, obj_solid))
{
	if (vsp > 0) CanJump = 10;
	CanDash = true;
	while (abs(vsp) > 0.1)
	{
		vsp *= 0.5;
		if (!place_meeting(x, y + vsp, obj_solid)) y += vsp;
	}
	vsp = 0;
}
y += vsp;

//grab the ledge if we move past one
if (_atLedge) && (_ledgeAboveOrBelow != sign(par_player.bbox_top - _horiSolid.bbox_top))
{
	y = _horiSolid.bbox_top + sprite_get_yoffset(spr_solid);
	state = StateLedge;
}

}

StateLedge = function(){
{
	//work out if we should jump
	if (_keyJump)
	{
		vsp = VspJump;
		state = stateFree;
	}
}



state = stateFree
}

stateDash = function()
{
	//Move via the dash
	hsp = lengthdir_x(dashSpd,dashDirection);
	vsp = lengthdir_y(dashSpd,dashDirection);
	
	//Afterimage effect
	with (instance_create_depth(x,y,depth+1,obj_afterimage))
	{
		sprite_index = other.sprite_index;
		image_blend = c_fuchsia;
		image_alpha = 0.7;
	}
	
	
	//horizontal collision
if (place_meeting(x + hsp, y, obj_solid))
{
	
	//is this a ledge?
	var _horiSolid = instance_place(x + hsp, y, obj_solid);
	if (!position_meeting((sign(hsp) == 1) ? _horiSolid.bbox_left : _horiSolid.bbox_right, _horiSolid.bbox_top - 1, obj_solid))
	{
		_atLedge = true;
		var _ledgeAboveOrBelow = sign(par_player.bbox_top - _horiSolid.bbox_top);
	}
	
	
	while (abs(hsp) > 0.1)
	{
		hsp *= 0.5;
		if (!place_meeting(x + hsp, y, obj_solid)) x += hsp;
	}
	hsp = 0;
}
x += hsp;

//vertical collision
if (place_meeting(x, y + vsp, obj_solid))
{

	while (abs(vsp) > 0.1)
	{
		vsp *= 0.5;
		if (!place_meeting(x, y + vsp, obj_solid)) y += vsp;
	}
	vsp = 0;
}
y += vsp;

//Ending the dash
dashEnergy -= dashSpd;
if (dashEnergy <= 0)
{
	vsp = 0;
	hsp = 0;
	state = stateFree;
}

}
state = stateFree