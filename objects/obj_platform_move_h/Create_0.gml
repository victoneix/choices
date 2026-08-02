vspd = 0;
move_spd = 1;
id_platform = 0;
move = false;

platform_move_w = function(){
	if(!move) return;

	vspd = move_dir * move_spd;

	if(place_meeting(x, y+sign(vspd), obj_collision) || y <= y_min || y >= y_max){
		vspd = 0;
		move = false;
	}

	var _coll = place_meeting(x, y+sign(vspd), obj_player) || place_meeting(x, y-1, obj_player);

	if(_coll){
		with(obj_player){
			if(!place_meeting(x, y+other.vspd, obj_collision)){
				y+=other.vspd;
			}
		}
	}

	y+=vspd;
	y=clamp(y, y_min, y_max);
}