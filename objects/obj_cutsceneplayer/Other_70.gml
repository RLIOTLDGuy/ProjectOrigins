/// @desc Video check (i.e: if the video stops, remove it from memory and destroy the object)
var _type = async_load[? "type"];

if (_type == "video_start")
{
    obj_cutsceneplayer.display_video = true;
}
else if (_type == "video_end")
{
    obj_cutsceneplayer.display_video = false;
    video_close();
}