if (isPaused)
{
	draw_text_scribble(410, 160, "[fa_middle][fontspr_promptfont][shake]Paused...")

	bgSurface = surface_create(ResolutionH, ResolutionV)
	surface_set_target(bgSurface)
	draw_clear_alpha(c_black, 0.1)
	surface_reset_target()
}