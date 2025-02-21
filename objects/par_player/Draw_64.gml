/// @description debug values or some shit... make sure to comment out this fuck by the time the game comes out
draw_set_color(c_white);
draw_set_font(font_console);

draw_text(20,50, "horizontalSpeed" + string(hsp));
//draw_text(60,50, hsp);

draw_text(20,80, "verticalSpeed" + string(vsp));
//draw_text(60,80, vsp);

draw_text(20,140, "x" + string(x));
//draw_text(60,140, x);

draw_text(20,170, "y" + string(y));
//draw_text(60,170, y);

//draw_text_scribble(20, 510, "[fontspr_promptfont][fa_left][shake]This is a test")