/// @description Insert description here
// You can write your code in this editor
if (!is_undefined(target)) {
	cam = view_camera[0];
	xpos = camera_get_view_x(cam)+camera_get_view_width(cam);
	ypos = camera_get_view_y(cam);
	//xpos = view_xport[0] + view_wport[0];
	//ypos = view_yport[0];
	xpos -= (iconId + 1) * 7;
	x = xpos;
	y = ypos;
	if (target.alive) {
		sprite_index = sIconTargetAlive;
		//draw_sprite(sIconTargetAlive, 0, xpos, ypos);
	} else if (winDelay == 1 || winDelay == -1) {
		sprite_index = sHeart;
		y+=4;
	} else {
		sprite_index = sIconTargetDead;
		//draw_sprite(sIconTargetDead, 0, xpos, ypos);
	}
}