iTargets = instance_number(oNPCTarget);
for (i = 0; i < iTargets; i++) {
	target = instance_find(oNPCTarget, i);
	if (target.alive) {
		return false;
	}
}
return true;