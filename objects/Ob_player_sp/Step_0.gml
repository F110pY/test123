/// @description Вставьте описание здесь
// Вы можете записать свой код в этом редакторе
var _right = keyboard_check(ord("D"))
var _left = keyboard_check(ord("A"))
var _up = keyboard_check(ord("W"))
var _down = keyboard_check(ord("S"))

x = Ob_collision_player_1.x
y = Ob_collision_player_1.y

if (_right || _left || _up || _down) {
    // Перемещение и расчет угла на основе направления
    var _angle = point_direction(0, 0, _right - _left, _down - _up);

    // Обновляем угол поворота персонажа
    image_angle = set_angle(image_angle, _angle, 8);
}

