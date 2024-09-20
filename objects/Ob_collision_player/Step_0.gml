/// @description Вставьте описание здесь
// Вы можете записать свой код в этом редакторе
var _right = keyboard_check(ord("D"))
var _left = keyboard_check(ord("A"))
var _up = keyboard_check(ord("W"))
var _down = keyboard_check(ord("S"))

var _move_speed = (_left or _right or _up or _down) * 4;

var _mydir = point_direction(0, 0, _right -_left, _down -_up)

hsp = lengthdir_x(_move_speed, _mydir)
vsp = lengthdir_y(_move_speed, _mydir)

move_and_collide(hsp, vsp, Ob_wall)
