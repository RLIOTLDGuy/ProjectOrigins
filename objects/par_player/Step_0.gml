scr_collision();
//Get The Inputs
if (hasControl)
{
_keyRight = keyboard_check(vk_right);
_keyLeft = keyboard_check(vk_left);
_keyJump = keyboard_check(ord("Z"));
_keyUp = keyboard_check(vk_up);
_keyDown = keyboard_check(vk_down);
_keyAirDash = keyboard_check(ord("X"));
_keyRun = keyboard_check(vk_shift);
}
else
{
	_keyRight = 0;
	_keyLeft = 0;
	_keyJump = 0;
	_keyRun = 0;
}

state();