spd = 2;
hspd = 0;
vspd = 0;
grav = 0.3;

moving = function(){
	//	Variaveis que guardão minhas teclas
	var _right	= keyboard_check(ord("D")) || keyboard_check(vk_right);
	var _left	= keyboard_check(ord("A")) || keyboard_check(vk_left);
	var _jump	= keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up);
	var _move = (_right - _left)*spd;
	
	vspd+=grav;						//	Adicionando velocidade da minha gravidade
	hspd = _move;					//	Velocidade da minha direção
	vspd = clamp(vspd, -8, 8);		//	Limitando a minha velocidade vertical

	// Se eu estiver colidindo com o objeto colisão
	//	E se eu precionar minha tecla de pulo
	if(_jump && place_meeting(x,y+1,obj_collision)){
		vspd-=6;					//	Eu posso pular
	}

}

collision = function(){
	
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
}