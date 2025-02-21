gpu_set_blendenable(false)

if (isPaused)
{
	surface_set_target(application_surface)
	if surface_exists(pausedSurf)
	{
		draw_surface(pausedSurf, 0, 0)
	}
	else
	{
		surface_create(ResolutionH, ResolutionV)
		buffer_set_surface(pausedSurfBUFFER, pausedSurf, 0)
	}
	surface_reset_target();
}


if keyboard_check_pressed(vk_escape)
{
	if (!isPaused)
	{
		isPaused = true
		instance_deactivate_all(true)
		pausedSurf = surface_create(ResolutionH, ResolutionV)
		surface_set_target(pausedSurf)
			draw_surface(application_surface, 0, 0)
		surface_reset_target();
		
		
		if buffer_exists(pausedSurfBUFFER)
		{
			buffer_delete(pausedSurfBUFFER)
		}
		pausedSurfBUFFER = buffer_create(ResolutionH * ResolutionV * 4, buffer_fixed, 1)
		buffer_get_surface(pausedSurfBUFFER, pausedSurf, 0)
	}
	
	else
	{
		isPaused = false
		instance_activate_all();
		if (surface_exists(pausedSurf))
		{
			surface_free(pausedSurf)
		}
		if (buffer_exists(pausedSurfBUFFER))
		{
			buffer_delete(pausedSurfBUFFER)
		}
	}
}

gpu_set_blendenable(true);