draw_set_font(ftMenu);
draw_set_halign(fa_center);
draw_set_valign(fa_center);

var gui_width = display_get_gui_width();
var gui_height = display_get_gui_height();

var x_half = gui_width / 2;
var y_half = gui_height / 2;

draw_set_color(c_white);
draw_set_alpha(0.25);

draw_rectangle(x_half - box_width / 2, box_y - box_height / 2, x_half + box_width / 2, box_y + box_height / 2, false);

draw_set_alpha(1);
draw_set_color(c_white);

for (var i = 0; i < option_max; i++) {
    draw_text(x_half, y_half + (distance * i), options[i]);
}

draw_set_font(-1);