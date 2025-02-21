if (surface_exists(pausedSurf))
{
	surface_free(pausedSurf)
}
if (buffer_exists(pausedSurfBUFFER))
{
	buffer_delete(pausedSurfBUFFER)
}
if (surface_exists(bgSurface))
{
	surface_free(bgSurface)
}