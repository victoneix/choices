// Inherit the parent event
event_inherited();

move_dir = 0;
move_spd = 0;
move_spd_max = 3;
acc = .3;
dcc = .3;

jump_height = 6;
coyote_time_max = 10;
coyote_time = 0;

x_scale = 1;
y_scale = 1;

respawn_max = 60;
respawn = respawn_max;

sound_length_max = audio_sound_length(snd_dead);
sound_length = sound_length_max;

state = "stop";

moving = function(){
	var _left		= keyboard_check(ord("A"));
	var _right		= keyboard_check(ord("D"));
	var _jump_down	= keyboard_check(ord("W")); 
	var _jump		= keyboard_check_pressed(ord("W"));
	var _move		= _right - _left != 0;
	var _ground		= place_meeting(x,y+1,obj_collision);
	
	vspd += grav;
	vspd = clamp(vspd, vspd_min, vspd_max);
	
	if(_move){
		sprite_index = spr_player_walk;
		move_dir = point_direction(0, 0, _right - _left, 0);
		move_spd = approach(move_spd, move_spd_max, acc);
	} else{
		sprite_index = spr_player_idle;
		move_spd = approach(move_spd, 0, dcc);
	}
	move_spd = clamp(move_spd, -8, 8);
	hspd = lengthdir_x(move_spd, move_dir);
	
	if(hspd != 0){
		x_scale = sign(hspd);
	}
	
	if(!_jump_down && vspd < 0){
		vspd = max(vspd, -jump_height / 2)
	}
	
	if(_ground){
		coyote_time = coyote_time_max;
	} else{
		coyote_time--;
		if(vspd < 0){
			sprite_index = spr_player_jump;
		} else if(vspd > 0){
			sprite_index = spr_player_fall;
		}
	}
	
	if(_jump && coyote_time > 0){
		coyote_time = 0;
		vspd = 0;
		vspd -= jump_height;
		audio_play_sound(snd_jump, 0, 0);
	}
	
	if(!_ground && vspd > 0){
		var _cenemy = instance_place(x,y+1,obj_enemy);
		if(_cenemy){
			vspd = 0;
			vspd -= jump_height;
			instance_destroy(_cenemy.id);
			audio_play_sound(snd_hit, 0, 0);
		}
	}
	
	var _cenemy = instance_place(x+hspd,y,obj_enemy);
	if(_cenemy){
		state = "dead";
	}
	
	var _cspike = instance_place(x,y,obj_spike);
	if(_cspike){
		state = "dead";
	}
}

dead = function(){
	if(state == "dead"){
		if(sound_length > 0) audio_play_sound(snd_dead, 0, 0);
		sound_length--;
		sprite_index = spr_player_dead;
		vspd = 0;
		hspd = 0;
		respawn--;
		if(respawn < 1){
			room_restart();
			respawn = respawn_max;
			state = "free";
		}
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