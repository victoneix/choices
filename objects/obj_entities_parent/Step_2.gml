//	Checando se eu colidir no meu x no objeto colisão
repeat(abs(hspd)){
	if(place_meeting(x+sign(hspd), y, obj_collision)){
		hspd = 0;
		break;
	} else{
		x+=sign(hspd);
	}
}
	
//	Checando se eu colidir no meu y no objeto colisão
repeat(abs(vspd)){
	if(place_meeting(x, y+sign(vspd), obj_collision)){
		vspd = 0;
		break;
	} else{
		y+=sign(vspd);
	}
}