#region Debug mode

//Check if in debug mode config
if(os_get_config()=="debug")||(debug_mode){
	global.debugMode=true;
	instance_create_depth(0,0,0,mngrDebug);
	show_debug_message("Welcome to debug mode!");
} else{
	global.debugMode=false;
}

#endregion