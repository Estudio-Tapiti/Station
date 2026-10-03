#region Movement

//Get input
keyRight=InputCheck(INPUT_VERB.RIGHT);
keyLeft=InputCheck(INPUT_VERB.LEFT);
keyUp=InputCheck(INPUT_VERB.UP);
keyDown=InputCheck(INPUT_VERB.DOWN);

//Add input to h and vsp
hsp=keyRight-keyLeft;
vsp=keyDown-keyUp;

//Clamp diagonal movement
if(hsp !=0 || vsp!=0){
	//Get movement angle
	var _dir=point_direction(0,0,hsp,vsp);
	
	//Clamp directional walking speed to player walk speed
	var _hspd=lengthdir_x(walkSpeed,_dir);
	var _vspd=lengthdir_y(walkSpeed,_dir);
	
	//Apply walking and collide with wall tiles
	move_and_collide(_hspd,_vspd, collisionMap);
}


#endregion