//Get The Inputs
if (hasControl)
{
_keyRight = keyboard_check(vk_right);
_keyLeft = keyboard_check(vk_left);
_keyJump = keyboard_check(vk_space);
_keyUp = keyboard_check(vk_up)
_keyDown = keyboard_check(vk_down)
_keyAirDash = keyboard_check(vk_alt)
}
else
{
	_keyRight = 0;
	_keyLeft = 0;
	_keyJump = 0;
}

state();