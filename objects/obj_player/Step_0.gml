if(state == "free"){
	moving();
} else if(state == "dead"){
	dead();
}

show_debug_message(respawn);
if(keyboard_check_pressed(ord("R"))) room_restart();