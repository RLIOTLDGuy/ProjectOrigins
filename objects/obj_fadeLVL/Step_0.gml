
if fadeout
{
	image_alpha = approach(image_alpha, 1, 0.1);
	if image_alpha >= 1
	{
		fadeout = false;
		with par_player
			room_goto(TargetRoom);
	}
}
else
{
	image_alpha = approach(image_alpha, 0, 0.1);
	if image_alpha <= 0
		instance_destroy();
}
