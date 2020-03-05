npc = argument[0];

if (npc.targetIndicator != undefined) {
	instance_destroy(npc.targetIndicator);
	npc.targetIndicator = undefined;
}
if (npc.deathIndicator != undefined) {
	instance_destroy(npc.deathIndicator);
	npc.deathIndicator = undefined;
}
if (npc.alertIndicator != undefined) {
	instance_destroy(npc.alertIndicator);
	npc.alertIndicator = undefined;
}