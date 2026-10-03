//Show collision layers if in debug mode
if(layer_exists(layer_get_id("Collision"))){
	layer_set_visible(layer_get_id("Collision"),true);
}
else{
	show_debug_message("Room has no layer called \"Collision\"!")
}