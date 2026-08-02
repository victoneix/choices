// Inherit the parent event
event_inherited();

move_spd = 1.20;
move_dir = 1;

walk = function(){
	var _ground = place_meeting(x, y+1, obj_collision);
	vspd+=grav;
	vspd = clamp(vspd, vspd_min, vspd_max);
	
	if(_ground){
		hspd = move_dir * move_spd;
		image_speed = 1;
	} else{
		hspd = 0;
		image_speed = 0;
	}
	if(place_meeting(x+hspd, y, obj_collision)){
		move_dir*=-1;
	}
	
	//if(!position_meeting(x + (8 * move_dir), y+1, obj_collision)){
	//	move_dir*=-1;
	//}
}