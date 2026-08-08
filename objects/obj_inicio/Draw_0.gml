

var _rm_width = room_width;
var _rm_height = room_height;
var _x1 = 8;
var _y1 = _rm_height / 2;


draw_set_font(fnt_menu);	

if(pag_index == 0){
	
	draw_sprite_ext(spr_logo, 0, _rm_width/2, 48, 2.8, 2.8, 0, c_white, 1);

	for(var i = 0; i < op_max; i++){
		draw_set_halign(0);
		draw_set_valign(1);
	
		if(index == i){
			draw_set_color(c_white);
		} else{
			draw_set_color(c_black);
		}
	
		draw_text_ext_transformed(_x1, _y1 + (26*i) - 16, options[i], 0, 9999, 1.2, 1.2, 0);
	}

	draw_set_color(c_white);
	draw_set_halign(1);
	draw_set_valign(2);

	draw_text_ext_transformed_color(_rm_width/2, 240-28, "(Use as setas do teclado)", 0, 999, 1, 1, 0, c_black, c_black, c_black, c_black, 1);
}

if(pag_index == 1){
	draw_set_halign(1);
	draw_set_valign(1);
	draw_text_color(_rm_width/2, 16, "Créditos", c_black, c_black, c_black, c_black, 1);
	
	draw_text_ext_color(_rm_width/2, _rm_height/2, "Todas as sprites do jogo foram feitas por mim. A programação também, juntamnete com a música. Tudo criador por (Victoneix) que sou eu =3 Não tive criatividade para fazer uma tela de inicio =|", 20, 320-32,c_black, c_black, c_black, c_black, 1);
}

if(pag_index == 2){
	draw_set_halign(1);
	draw_set_valign(1);
	draw_text_color(_rm_width/2, 16, "Instruções", c_black, c_black, c_black, c_black, 1);
	
	if(index_inst == 0){
		draw_text_ext_color(_rm_width/2, _rm_height/2, "Para controlar o jogador use as teclas (WASD) ou as SETAS do teclado para se movimentar, com a tecla R você pode reiniciar o nível. Com a tecla ESC, você pode voltar para a tela de selesão de niveis.", 18, 340-32,c_black, c_black, c_black, c_black, 1);
	} else if(index_inst == 1){
		draw_text_ext_color(_rm_width/2, _rm_height/2, "Para ativar as plataforma basta encostar nos botões, mas tome cuidado, não fique em baixo das plataformas. E para matar os inimigos, pule em cima deles.", 18, 340-32,c_black, c_black, c_black, c_black, 1);
	}
	
	draw_text_ext_transformed_color(_rm_width/2, 240-48, "(" + string(index_inst) + "/" + "1" + ")", 0, 999, 1, 1, 0, c_black, c_black, c_black, c_black, 1);
}

if(pag_index > 0) draw_text_ext_transformed_color(_rm_width/2, 240-16, "(Tecla ESC para voltar)", 0, 999, 1, 1, 0, c_black, c_black, c_black, c_black, 1);

draw_set_halign(0);
draw_set_valign(0);
draw_set_font(-1);
