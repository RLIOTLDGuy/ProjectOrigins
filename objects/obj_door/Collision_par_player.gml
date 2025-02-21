with other
{
	TargetRoom = other.TargetRoom;
	TargetDoor = other.TargetDoor;
	
	x = lerp(other.bbox_left, other.bbox_right, 0.5);
	
	if !instance_exists(obj_fadeLVL) && keyboard_check(vk_up)
		instance_create(0, 0, obj_fadeLVL);
}
