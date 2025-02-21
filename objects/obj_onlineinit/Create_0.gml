execute();

randomize();

//connection info
server_ip = "127.0.0.1";
server_port = 3000;

is_server = false;

//Data types
enum ONLINEDATA {
	INIT_ONLINEDATA,
	PLAYER_UPDATESTATUS
}

// Connected clients
clients = ds_list_create();