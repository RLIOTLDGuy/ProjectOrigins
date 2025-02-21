// Game session start
if (room == hub_roomOUTSIDE) {
	onlinePlayerID = 0;
	// Add server to clients list
	if (is_server) {
		ds_list_add(clients, -1);
	}
}