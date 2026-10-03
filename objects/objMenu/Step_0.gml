if (keyboard_check_pressed(ord("S")) && index < option_max - 1) {
    index++;
}

if (keyboard_check_pressed(ord("W")) && index > 0) {
    index--;
}

var y_half = display_get_gui_height() / 2;
var target_y = y_half + (distance * index);
var selected_text = options[index];

var target_width = string_width(selected_text) + 60;
var target_height = string_height(selected_text) + 24;

box_y = lerp(box_y, target_y, 0.2);
box_width = lerp(box_width, target_width, 0.2);
box_height = lerp(box_height, target_height, 0.2);