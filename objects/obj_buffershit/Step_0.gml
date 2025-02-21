if (keyboard_check_pressed(vk_tab)) {
	buffer_seek(buffer, buffer_seek_start, 0);
	
	var _x = buffer_read(buffer, buffer_u16);
	var _y = buffer_read(buffer, buffer_u16);
	var _challengehealth = buffer_read(buffer, buffer_u8);
	var _challengetime = buffer_read(buffer, buffer_u8);
	
	var _text = buffer_read(buffer, buffer_string);
	var _homestuck = buffer_read(buffer, buffer_u16);
	
	show_debug_message("Reading buffer data..." +
	"/nx: " + string(_x) +
	"/ny: " + string(_y) +
	"/nchallengehealth: " + string(_challengehealth) +
	"/nchallengetime: " + string(_challengetime) +
	"/ntext: " + string(_text) +
	"/nhomestuck: " + string(_homestuck));
}