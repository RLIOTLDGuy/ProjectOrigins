/// @desc move to next room

with (par_player)
{
	if (hasControl)
	{
		hasControl = false;
		scr_slidetransition(TRANSITION_MODE.GOTO,other.TargetRoom);
	}
}
