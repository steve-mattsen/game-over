npcCount = instance_number(oNPC);
for (i = 0; i < npcCount; i++) {
	npc = instance_find(oNPC, i);
	clearNPCIndicators(npc);
}
oPlayer.enabled = false;
oPlayer.sprite_index = sDeathCollapse;
oPlayer.image_index = 0;
oPlayer.dyingAnimation = true;