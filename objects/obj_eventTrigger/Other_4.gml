if (ds_list_find_index(Flags.saveRoom, id) != -1)
{
	if Flags.performSave
	{
		if (!Flags.performOncePerSave)
		{
			self.output()
			Activated = true
		}
	}
}
