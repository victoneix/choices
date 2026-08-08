var _rm_width = room_width;
var _rm_height = room_height;
var _x1 = _rm_width/2;

draw_set_color(c_black);
draw_set_font(fnt_menu);
draw_set_halign(1);
draw_set_valign(1);

draw_text(_x1, 16, "Selesão de níveis");

draw_text(_x1, 240-28, "(Tecla ESC para voltar)");

draw_set_halign(0);
draw_set_valign(0);
draw_set_font(-1);
draw_set_color(c_white);