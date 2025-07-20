function camera_addShake(mag, time, decel = 0)
{
	with (obj_camera)
	{
		ds_list_add(camShakeList, new addCamShake(mag, time / room_speed, decel))
	}
}