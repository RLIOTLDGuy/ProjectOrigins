/// @desc Hallway fixing
show_debug_message("Room Start Triggered. Current Room: " + string(room) + ", TargetRoom: " + string(TargetRoom));
var door_obj = noone;
with par_doortriggers
{
	if door == other.TargetDoor
	{
		door_obj = id;
		break;
	}
}

if door_obj
{
	x = door_obj.x + 16;
	y = door_obj.y - 14;
	
	var hallway = instance_place(x, y, obj_hallway);
	if hallway
		x = hallway.x + hallway.sprite_width + (-sign(hallway.image_xscale) * 200);
	
	var hallway = instance_place(x, y, obj_verticalhallway);
	if hallway
	{
		trace(verticalpos);
		
		x = hallway.x + (hallway.sprite_width * verticalpos);
		var bbox_size = abs(bbox_right - bbox_left);
		x = clamp(x, hallway.x + bbox_size, hallway.bbox_right - bbox_size);
		
		if hallway.image_yscale < 0
			y = hallway.bbox_bottom + 32;
		else
			y = hallway.bbox_top - 78;
		
		vsp = VspJump;
	}
}