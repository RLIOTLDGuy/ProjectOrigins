var _cutsceneData = video_draw(); //processes the cutscene
var _cutsceneStatus = _cutsceneData[0];
if _cutsceneStatus = 0 { //playing with no errors
{
	//draw surface that captured current cutscene frame
	draw_surface(_cutsceneData[1], room_width,room_height);
}

}