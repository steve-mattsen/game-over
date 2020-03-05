/// @description Insert description here
// You can write your code in this editor
if (winDelay > 1) {
	winDelay--;
} else if (winDelay == 1) {
	winDelay = -1;
	instance_create_layer(oPlayer.x, oPlayer.y, "UI", oDeathIndicator);
}