target = argument[0];

if (!target.alive) {
	return false;
}
target.alive = false;
target.sprite_index = sDeadBody;
clearNPCIndicators(target);
target.deathIndicator = instance_create_layer(target.x, target.y, "UI", oDeathIndicator);

if (checkLevelComplete()) {
	levelComplete();
}
return true;