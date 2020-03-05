scythe = argument[0];

if (scythe.bSlashing == true) {
	return false;
}
scythe.bSlashing = true;
scythe.iSlashingStep = scythe.iSlashingDuration;
scythe.sprite_index = sSlash;
scythe.image_index = 0;
return true;