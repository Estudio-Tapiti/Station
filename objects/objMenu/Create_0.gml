title = "Placeholder";

options = ["Play", "Settings", "Exit"];
option_max = array_length(options);

index = 0;

distance = 64;

var y_half = display_get_gui_height() / 2;

box_y = y_half;
box_width = string_width(options[index]) + 60;
box_height = string_height(options[index]) + 24;