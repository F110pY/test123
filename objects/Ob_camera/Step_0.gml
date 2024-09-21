
if follow != noone {
	xto = follow.x
	yto = follow.y
}

x += (xto - x)/10
y += (yto - y)/10

camera_set_view_pos(view_camera[0], x-(camWight*0.5), y-(camHeight*0.5))
