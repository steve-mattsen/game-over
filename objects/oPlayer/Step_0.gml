/// @description Insert description here
// You can write your code in this editor
key_left = keyboard_check(vk_numpad4) | keyboard_check(ord("A"));
key_right = keyboard_check(vk_numpad6) | keyboard_check(ord("D"));
key_up = keyboard_check(vk_numpad8) | keyboard_check(ord("W"));
key_down = keyboard_check(vk_numpad5) | keyboard_check(ord("S"))
key_fire = keyboard_check(vk_numpad0) | keyboard_check(vk_space);

if (!enabled) {
	if (dyingAnimation) {
		if (image_index >= 28) {
			image_speed = 0;
			dyingAnimation = false;
			dyingFall = true;
		}
	} else if (dyingFall) {
		fallspeed = 4;
		if (place_meeting(x, y+fallspeed, oWall)) {
			for(i = fallspeed -1; i >= 0; i--) {
				if (place_meeting(x, y+fallspeed, oWall)) {
					y += i;
					break;
				}
			}
			dyingFall = false;
			image_index = 29;
			dyingWait = 30;
		} else {
			y+=4;
		}
		scythe.y = y-1;
	} else if (winDelay > 1) {
		winDelay--;
	} else if (winDelay == 1) {
		sprite_index = sDeathCollapse;
		image_index = 28;
		image_speed = 0;
		image_yscale = -1;
		y -= 4;
		scythe.y = y;
		if (y < -80) {
			room_goto_next();
		}
	} else if (dyingWait-- == 1) {
		room_restart();
	} else if (dyingWait >=0) {
		if (key_left | key_right | key_up | key_down | key_fire) {
			room_restart();
		}
	}
	return false;
}

if (mouseEnabled) {
	key_left = key_left | mouse_x < x + mouseDeadZone;
	key_right = key_right | mouse_x > x - mouseDeadZone;
	key_up = key_up | mouse_y < y + mouseDeadZone;
	key_down = key_down | mouse_y > y - mouseDeadZone;
	key_fire = key_fire | mouse_check_button_pressed(mb_left);
}
var moveX = key_right - key_left;
var moveY = key_down - key_up;

//Movement
if (moveX == 0) {
	if (hsp != 0) {
		beforeSign = sign(hsp);
		hsp -= moveIncr * sign(hsp);
		if (sign(hsp) != beforeSign) {
			hsp = 0;
		}
	}
} else {
	if (sign(moveX) != sign(hsp)) {
		//Slow us down faster if we're trying to go the opposite direction.
		hsp += moveX * moveIncr * 4;
	} else {
		hsp += moveX * moveIncr;
	}
	if (abs(hsp) > abs(moveMax)) {
		//Limit our top speed.
		hsp = sign(hsp) * moveMax;
	}
}

if (moveY == 0) {
	if (vsp != 0) {
		beforeSign = sign(vsp);
		vsp -= moveIncr * sign(vsp);
		if (sign(vsp) != beforeSign) {
			vsp = 0;
		}
	}
} else {
	if (sign(moveY) != sign(vsp)) {
		//Slow us down faster if we're trying to go the opposite direction.
		vsp += moveY * moveIncr * 4;
	} else {
		vsp += moveY * moveIncr;
	}
	if (abs(vsp) > abs(moveMax)) {
		//Limit our top speed.
		vsp = sign(vsp) * moveMax;
	}
}

//Collision
i = 0;
while (place_meeting(x+hsp,y,oWall)) {
	if (i++ > 2) {
		hsp = 0;
		break;
	}
	hsp /= 2;
}

x = x + hsp;

i = 0;
while (place_meeting(x,y+vsp,oWall)) {
	if (i++ > 2) {
		vsp = 0;
		break;
	}
	vsp /= 2;
}
y = y + vsp;

//Animation
if (moveX != 0) {
	//Turn whatever way the player is inputting.
	image_xscale = moveX;
}

//Scythe / Slash
scythe.x = x;
scythe.y = y-1;
scythe.image_xscale = image_xscale;

if (key_fire) {
	slash(scythe);
}

//Light Level Detection.
if (place_meeting(x,y,oLight)) {
	//Check if the player is in the light.
	npcCount = instance_number(oNPC);
	for (i = 0; i < npcCount; i++) {
		//Run through all NPCs.
		npc = instance_find(oNPC, i);
		if (npcSeesPlayer(npc, self)) {
			alertNpc(npc);
		}
	}
}