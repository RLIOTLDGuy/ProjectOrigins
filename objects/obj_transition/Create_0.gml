/// @desc size variables and mode setup

w = display_get_gui_width();
h = display_get_gui_height();
h_half = h/2 * 0.5;
enum TRANSITION_MODE
{
	OFF,
	NEXT,
	GOTO,
	RESTART,
	INTRO
}
mode = TRANSITION_MODE.INTRO
percent = 1;
TargetRoom = room;
