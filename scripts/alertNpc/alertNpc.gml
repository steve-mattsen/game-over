npc = argument[0];

if (npc.alerted) {
	return false;
}
npc.alerted = true;
clearNPCIndicators(npc);
npc.alertIndicator = instance_create_layer(npc.x,npc.y, "UI", oAlertIndicator);
npc.image_speed = 0;
npc.image_index = 0;
return true;