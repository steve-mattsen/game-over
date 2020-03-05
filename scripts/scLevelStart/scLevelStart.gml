iTargets = instance_number(oNPCTarget);
for( i = 0; i < iTargets; i++) {
	obj = instance_find(oNPCTarget, i);
	icon = instance_create_layer(-50, -50, "UI", oTargetIcon);
	icon.target = obj;
	icon.iconId = i;
}