/// @desc Lap Janitor physics and sprite switching.
if lapJanitorState == 0
{
	if ds_queue_size(lapJanitorQueue) >= 80
	{
		Lerp = approach(Lerp, 1, 0.01)
		x = lerp(x, ds_queue_dequeue(lapJanitorQueue), Lerp)
		y = lerp(y, ds_queue_dequeue(lapJanitorQueue), Lerp)
	}
	ds_queue_enqueue(lapJanitorQueue, par_player.x, par_player.y);
}
else
{
	ds_queue_clear(lapJanitorQueue);
	Lerp = 0;
}

///sprite switcher
if x != xprevious or y != yprevious
	sprite_index = spr_lapJanitor_move;
else
	sprite_index = spr_lapJanitor_idle;

if x != xprevious
	image_xscale = sign(x - xprevious);
