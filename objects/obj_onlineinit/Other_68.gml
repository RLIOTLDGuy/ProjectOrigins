var type = async_load[? "type"];

// Connected to game session
if (type == network_type_connect) {
	var socket = async_load[? "socket"];
	
	//Send player info
	var buffer = buffer_create(2, buffer_fixed, 1);
	
	buffer_write(buffer, buffer_u8, ONLINEDATA.INIT_ONLINEDATA);
	buffer_write(buffer, buffer_u8, ds_list_size(clients));
	
	network_send_packet(socket, buffer, buffer_get_size(buffer));
	buffer_delete(buffer);
	
	onlinePlayerID = ds_list_size(clients);
	is_local = false;
	
	// Add to list
	ds_list_add(clients, socket);
}
// Data
else if (type == network_type_data) {
	var buffer = async_load[? "buffer"];
	
	buffer_seek(buffer, buffer_seek_start, 0);
	
	var data = buffer(buffer, buffer_u8);
	
	// INIT DATA
	if (data == ONLINEDATA.INIT_ONLINEDATA) {
		var count = buffer_read(buffer, buffer_u8);
		
		// Set player ID
		par_player.onlinePlayerID = count;
	}
}