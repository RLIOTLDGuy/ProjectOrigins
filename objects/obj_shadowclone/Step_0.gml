if (state = stateFree)
{
	if (sprite_index == spr_what && image_index = 21)
		sprite_index = spr_what;
	ds_queue_enqueue(followPlayer, par_player.x);
	ds_queue_enqueue(followPlayer, par_player.y);
	ds_queue_enqueue(followPlayer, par_player.sprite_index);
	ds_queue_enqueue(followPlayer, par_player.image_index);
	if (ds_queue_size(followPlayer > lag))
	{
		x = ds_queue_dequeue(followPlayer);
		y = ds_queue_dequeue(followPlayer);
		sprite_index = ds_queue_dequeue(followPlayer);
		image_index = ds_queue_dequeue(followPlayer);
		image_xscale = ds_queue_dequeue(followPlayer);
	}
if (state == stateFree)
{
	attackCooldown--;
	if image_index = 21
		image_speed = 0;
	if (attackCooldown <= 0)
	{
		x = par_player.x;
		y = par_player.y;
		state = stateFree;
		image_index = 0;
		ds_queue_clear(followPlayer);
		sprite_index = spr_what;
		image_speed = 0.35;
	}
end }