vspd = 0;
move_spd = 1;
id_platform = 0;
move = false;

platform_move_w = function(){
	if(!move) return;

	vspd = move_dir * move_spd;

	if(place_meeting(x, y+sign(vspd), obj_collision)){
		vspd = 0;
	}
	
	var _cplayer = place_meeting(x, y+1, obj_player) || place_meeting(x, y-1, obj_player);
	var _cenemy = place_meeting(x, y+1, obj_enemy) || place_meeting(x, y-1, obj_enemy);

	if(_cplayer){
		with(obj_player){
			y+=other.vspd;
		}
	}
	
	if(_cenemy){
		with(obj_enemy){
			y+=other.vspd;
		}
	}

	y+=vspd;
	y=clamp(y, y_min, y_max);
	if(y <= y_min || y >= y_max){
		vspd = 0;
		move = false;
	}
}