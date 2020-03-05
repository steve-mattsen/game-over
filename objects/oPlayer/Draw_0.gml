/// @description Insert description here
// You can write your code in this editor
cam = view_camera[0];
camW = camera_get_view_width(cam);
camH = camera_get_view_height(cam);
xpos = x - camW / 2;
ypos = y - camH / 2;
if (xpos < 0) {
	xpos = 0;
} else if (xpos > room_width - camW) {
	xpos = room_width - camW;
}

if (ypos < 0) {
	ypos = 0;
} else if (ypos > room_height - camH) {
	ypos = room_height - camH;
}
camera_set_view_pos(cam, xpos, ypos);
draw_sprite_ext(sprite_index, -1, x, y-1, image_xscale, image_yscale, 0, c_white, 1);