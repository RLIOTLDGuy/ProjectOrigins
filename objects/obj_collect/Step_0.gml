/// @desc Magnet effect
if abs(distance_to_object(par_player)) < 25
	gotowardsplayer = true;

if gotowardsplayer
{
	move_towards_point(par_player.x, par_player.y, HspWalk);
	HspWalk++;
}
