scr_collision_init();
grav = 0.2; //gravity
bankInit();
levelDataLookup();

////terminalVelocity = 3 //speed for events like getting flinged by an octowhirl ink bomb
//hsp = 0; //current horizontal speed
//vsp = 0; //current vertical speed
HspWalk = 4.5; //walking speed
VspJump = -10; //jumping speed
CanJump = 0; //are we in contact with a solid
CanDash = false; //resets in case if jayden or any other character touches a solid
CanRun = false;
dashDistance = 105;
dashTime = 10;
is_local = true;
onlinePlayerID = -1;
verticalpos = 0;
TargetRoom = 0;
TargetDoor = "A";
hasControl = true;
grounded = false;
groundedSlope = false;
global.lapJanitor = false
global.Round2Count = 0
global.font = font_add_sprite_ext(fontspr_promptfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz,.!?:;\"'/-_+=1234567890@#$%^&*()[]", 1, 1)
moveSpeed = 0
xscale = 1
yscale = 1
fadeTXT = false
fadeoutTXT = false
global.saveRoom = ds_list_create();
global.PanicRunback = false;
runSpeed = 11
CanSwim = false

stateFree = function()
{
//Work out where to move horizontally
hsp = (_keyRight - _keyLeft) * HspWalk;

if keyboard_check(vk_shift)
{
	hsp = (_keyRight - _keyLeft) * runSpeed;
	sprite_index = spr_playerJD_run
	if keyboard_check_released(vk_shift)
		{
			sprite_index = spr_playerJD_idle
		}

	with (instance_create_depth(x,y,depth+1,obj_afterimage))
	{
		sprite_index = other.sprite_index;
		image_blend = c_aqua;
		image_alpha = 0.7;
	}
}

if keyboard_check(vk_down)
{
	mask_index = spr_playerJD_MASKCrouch
}

//Work out where to move vertically
if (vsp < terminalVelocity)
{
	vsp += grav
}

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

if place_meeting(x, y + vsp, par_collision)
{
	if (vsp > 0) CanJump = 10;
		CanDash = true;
}

if place_meeting(x + sign(hsp), y, obj_solid)
{
	state = stateWallSlide;
	sprite_index = spr_playerJD_wallslide;
	vsp = min(vsp, 0);
	exit;
}

if place_meeting(x, y, obj_watertemp)
{
	state = stateSwimming;
	exit;
}
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
		image_blend = c_aqua;
		image_alpha = 0.7;
	}

//Ending the dash
dashEnergy -= dashSpd;
if (dashEnergy <= 0)
{
	vsp = 0;
	hsp = 0;
	state = stateFree;
}

/*else place_meeting(x, y, obj_watertemp && dashEnergy <= 0)
{
	vsp = 0;
	hsp = 0;
	state = stateSwimming;
}/*/

}

stateWallSlide = function()
{
	if (grounded)
	{
		state = stateFree;
		return;
	}
	vsp = min(vsp, -15)
	
	sprite_index = vsp > 0 ? spr_playerJD_wallslidedown : spr_playerJD_wallslide;
	
	if !place_meeting(x, y, obj_solid)
		{
			vsp = -14
			state = stateFree;
			sprite_index = spr_playerJD_idle
		}
}

stateSwimming = function()
{
	hsp = (_keyRight - _keyLeft) * HspWalk
	vsp = (_keyDown - _keyUp) * HspWalk
	
	/*if (CanDash) && (_keyAirDash)
	{
		CanDash = false;
		CanJump = 0;
		dashDirection = point_direction(0,0,_keyRight-_keyLeft,_keyDown-_keyUp);
		dashSpd = dashDistance/dashTime;
		dashEnergy = dashDistance;
		state = stateDash;
	}/*/

if (!place_meeting(x, y, obj_watertemp))
{
	hsp = 0
	vsp = 0
	state = stateFree
}
}
state = stateFree
//fmod_listener_setPosition(0, x, y, 0);