var _rm_width = room_width;
var _rm_height = room_height;
var _x1 = _rm_width/2;
var _y1 = _rm_height/2;

draw_set_color(c_black);
draw_set_font(fnt_menu);
draw_set_halign(1);
draw_set_valign(1);

draw_text_ext_transformed(_x1, _y1-16, "Muito obrigado por jogar <3 espero que tenha gostado. o jogo é curto, mais fiz ele com muito amor e carinho. Muito obrigado a todos que jogaram, dessejo a todos boa sorte na nonejam13. E muito obrigado none, você é o melhor professor <3", 20, 320-24, 0.8, 0.8, 0);

draw_set_halign(0);
draw_set_valign(0);
draw_set_font(-1);
draw_set_color(c_white);