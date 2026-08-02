// Inherit the parent event
event_inherited();

move_dir = 0;
move_spd = 0;
move_spd_max = 3;
acc = .3;
dcc = .3;

moving = function(){
	var _left	= keyboard_check(ord("A"));
	var _right	= keyboard_check(ord("D"));
	var _jump	= keyboard_check_pressed(ord("W")); 
	var _move	= _right - _left != 0;
	
	vspd += grav;
	vspd = clamp(vspd, vspd_min, vspd_max);
	
	if(_move){
		move_dir = point_direction(0, 0, _right - _left, 0);
		move_spd = approach(move_spd, move_spd_max, acc);
	} else{
		move_spd = approach(move_spd, 0, dcc);
	}
	move_spd = clamp(move_spd, -8, 8);
	hspd = lengthdir_x(move_spd, move_dir);
	
	
	if(_jump && place_meeting(x,y+1,obj_collision)){
		vspd -= 7;
	}
}

approach = function(val1 = 0, val2 = 0, amount = 0){
	if(val1 < val2){
		val1 += amount
		if(val1 > val2)
			return val2;
	} else{
		val1 -= amount
		if(val1 < val2)
			return val2;
	}
	return val1;
}