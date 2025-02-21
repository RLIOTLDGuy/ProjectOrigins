/// @description
// Online session room
if (room == rm_onlinesessionselect) {
	// Host
	if (keyboard_check_pressed(vk_f4)) {
		server = network_create_server(network_socket_tcp, server_port, 4);
		
		// epic failure
		if (server < 0) {
			show_error("Could not create server. Sorry!", false);
		}
		// Creation
		else {
			room_goto(hub_roomOUTSIDE);
			
			is_server = true;
		}
	}
	//Join
	else if (keyboard_check_pressed(vk_f4)) {
		server = network_create_socket(network_socket_tcp);
		var res network_connect(server, server_ip, server_port);
		
		// epic failure 2 electric goobaloo
		if (res < 0) {
			show_error("Could not connect to the Game Session. Sorry!", false);
		}
		// Connected
		else {
			room_goto(hub_roomOUTSIDE);
		}
	}
}