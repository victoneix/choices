id_move = 0;

pressed = function(){
	if(place_meeting(x,y,obj_player) && image_index == 0){
		image_index = 1;
		with(obj_platform_move_w){
			if(id_move == other.id_move) move = true;
		}
	}
}