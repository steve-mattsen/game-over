/// @description Insert description here
// You can write your code in this editor
hsp = 0;
vsp = 0;
moveIncr = 0.3;
moveMax = 6;
mouseDeadZone = 10;
mouseEnabled = false;
iDetectionRangeX = 36;
iDetectionRangeY = 16;
enabled = true;
dyingAnimation = false;
dyingFall = false;
dyingWait = 0;
winDelay = 0;

scythe = instance_create_layer(x, y, "Player", oScythe);
scythe.image_xscale = image_xscale;