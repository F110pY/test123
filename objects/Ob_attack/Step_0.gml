/// @description Вставьте описание здесь
// Вы можете записать свой код в этом редакторе
if (Ob_player_sp._right || Ob_player_sp._left || Ob_player_sp._up || Ob_player_sp._down) {
	
    // Перемещение и расчет угла на основе направления
    var _angle = point_direction(0, 0, Ob_player_sp._right - Ob_player_sp._left, Ob_player_sp._down - Ob_player_sp._up);

    // Обновляем угол поворота персонажа
    image_angle = set_angle(image_angle, _angle, 8);
}