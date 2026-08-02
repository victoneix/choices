hspd = 0;
move_spd = 1;
id_move = 0;
move = false;

platform_move_w = function(){
	if(!move) return;
	
    if (x <= x_min || x >= x_max) {
        hspd = 0;
        return;
    }
	
	hspd = move_dir * move_spd;

	if(place_meeting(x+sign(hspd), y, obj_collision)){
		move_dir*=-1;
	}

	var _coll = place_meeting(x+sign(hspd), y, obj_player) || place_meeting(x, y-1, obj_player);

	if(_coll){
		with(obj_player){
			if(!place_meeting(x+other.hspd, y, obj_collision)){
				x+=other.hspd;
			}
		}
	}

	x+=hspd;
	
}