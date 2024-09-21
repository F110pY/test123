/// @description Вставьте описание здесь
// Вы можете записать свой код в этом редакторе
_right = keyboard_check(ord("D"))
_left = keyboard_check(ord("A"))
_up = keyboard_check(ord("W"))
_down = keyboard_check(ord("S"))
_attack = mouse_check_button_pressed(mb_left)

x = Ob_collision_player.x
y = Ob_collision_player.y

if (_right || _left || _up || _down) {
	sprite_index = Sp_walk_pl
	image_speed = 0.5
	
    // Перемещение и расчет угла на основе направления
    var _angle = point_direction(0, 0, _right - _left, _down - _up);

    // Обновляем угол поворота персонажа
    image_angle = set_angle(image_angle, _angle, 8);
} else {    
	if _attack == 0 {sprite_index = Sp_idle_pl}
}
var _angle_sprite = point_direction(0, 0, _right - _left, _down - _up);
if (_attack) {
	instance_create_depth(x, y, 0, Ob_zone_damage)
	draw_sprite_ext(Sp_attack_pl, 0, x, y, 1, 1, _angle_sprite, 0, 1)
	
}

 