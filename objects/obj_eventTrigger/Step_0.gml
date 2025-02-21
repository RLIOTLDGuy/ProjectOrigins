/// @desc Condition handling.
/// If the condition is not equal to -4 and the event trigger detects the condition flag, it will run a block of code.
/// If the event trigger is not activated and the flags variable isn't set to performOnce, it shall detect an output.
/// If the Flags variable is set to performSave and the Flags variable is also set to saveRoom, the eventTrigger with a saveRoom variable will be added to a ds_list and then be activated.
if (condition != -4 && self.condition())
	if ((!Activated) || (!Flags.performOnce))
	{
		self.output()
		if (Flags.performSave && ds_list_find_index(Flags.saveRoom, id) == -1)
		ds_list_add(Flags.saveRoom, id)
		Activated = true
	}
	
/// However, if the reverseOutput is not set to -4 and the condition is not set to -4 while the condition variable is detected, it will run a block of code.
/// If the event trigger is activated but the Flags variable is not set to performOnce, it shall then set the reverse output, and then activated shall be set to false.
else if (reverseOutput != -4 && condition != -4 && (self.condition()))
	if ((Activated) || (!Flags.performOnce))
	{
		self.reverseOutput()
		//if (Flags.performSave && ds_list_find_index(Flags.saveRoom, id) == -1)
		//ds_list_add(Flags.saveRoom, id)
		Activated = false
	}
	
/// Self explanatory.
if (Activated && Flags.performOnce)
{
	instance_destroy()
}