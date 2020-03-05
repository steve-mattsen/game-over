/// @description Insert description here
// You can write your code in this editor
key_left = keyboard_check(vk_numpad4) | keyboard_check(ord("A"));
key_right = keyboard_check(vk_numpad6) | keyboard_check(ord("D"));
key_up = keyboard_check(vk_numpad8) | keyboard_check(ord("W"));
key_down = keyboard_check(vk_numpad5) | keyboard_check(ord("S"))
key_fire = keyboard_check(vk_numpad0) | keyboard_check(vk_space);

if (!transitionComplete) {
	y += 4;
	if (y >= 0) {
		y = 0;
		transitionComplete = true;
	};
}

if (instructions != undefined) {
	if (!instructions.transitionComplete) {
		y -= 4;
	}
}

if (key_left | key_right | key_up | key_down | key_fire) {
	if (!transitionComplete) {
		return false;
	}
	if (!instructionsShow) {
		instructionsShow = true;
		instructions = instance_create_layer(0, 0, "Instances", oInstructions);
		instructions.depth = depth - 1;
	} else if (instructions.transitionComplete) {
		room_goto_next();
	}
}