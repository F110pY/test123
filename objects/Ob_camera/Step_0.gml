
if follow != noone {
	xto = follow.x
	yto = follow.y
}

x += (xto - x)/10
y += (yto - y)/10

// Ограничиваем координаты камеры по X и Y так, чтобы она не выходила за пределы комнаты
x = clamp(x, cam_wight / 2, room_width - cam_wight / 2);
y = clamp(y, cam_height / 2, room_height - cam_height / 2);

camera_set_view_pos(view_camera[0], x-(cam_wight*0.5), y-(cam_height*0.5))
