/// @desc Var init and I/O handling.
condition = -4;
output = -4;
reverseOutput = -4;
instanceNumber = instance_number(obj_eventTrigger)

default_condition = function()
{
	return place_meeting(x, y, par_player)
}

default_output = function()
{
	show_debug_message("Event Trigger:" + string(id) + " - Seems to have a missing output...")
}

Flags =
{
	performOnce: true,
	performSave: true,
	performOncePerSave: true,
	saveRoom: global.saveRoom
}

Activated = false;
condition = default_condition;
output = default_output;
reverseOutput = -4