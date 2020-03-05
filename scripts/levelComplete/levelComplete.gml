//Activate all target icons to turn into hearts one at a time.
icons = instance_number(oTargetIcon);
winDelay = 10;
for (i = 0; i < icons; i++) {
	icon = instance_find(oTargetIcon, i);
	icon.winDelay = (i+1) * winDelay;
}
//Set the player to wait the appropriate time, then launch upwards into the sky.
oPlayer.enabled = false;
oPlayer.winDelay = (i+2) * winDelay;