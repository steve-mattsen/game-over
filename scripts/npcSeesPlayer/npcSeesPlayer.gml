npc = argument[0];
ply = argument[1];

if (!npc.alive) {
	//Quick throw-away of dead NPCs.
	return false;
}
if (abs(npc.x - ply.x) > ply.iDetectionRangeX) {
	//Quick throw-away of all distant NPCs.
	return false;	
}
if ((npc.y - ply.y) > ply.iDetectionRangeY) {
	//If you're not on the same level as NPCs, throw away.
	return false;
}
if (sign(npc.image_xscale) != sign(ply.x - npc.x)) {
	//Is the NPC not facing the player?
	return false;
}
if (collision_line(ply.x,ply.y, npc.x, npc.y, oWall, false, false) != noone) {
	//There's a wall in the way.
	return false;
}
return true;