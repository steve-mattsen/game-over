/// @description Insert description here
// You can write your code in this editor

if (bSlashing) {
	iSlashingStep--;
	if (iSlashingStep <= 0) {
		//Display the scythe sprite.
		oScythe.sprite_index = sScythe;
	} else {
		//Slash is still effective.
		target = instance_place(x, y, oNPCTarget) 
		if (target != noone){
			//A target was hit.
			killTarget(target);
		}
	}
	if (iSlashingStep <= -iSlashingCooldown) {
		bSlashing = false;
	}
}