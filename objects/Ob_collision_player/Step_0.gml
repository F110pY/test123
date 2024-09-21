// Проверяем, существует ли объект Ob_player_sp
if (!global.is_attacking) {
    var _right = keyboard_check(ord("D"));
    var _left = keyboard_check(ord("A"));
    var _up = keyboard_check(ord("W"));
    var _down = keyboard_check(ord("S"));
    var _run = keyboard_check(vk_shift);

    global._move_speed = (_left or _right or _up or _down) * 4;
    var _mydir = point_direction(0, 0, _right - _left, _down - _up); 
	
	var is_moving = _left or _right or _up or _down;

var is_moving = _left or _right or _up or _down;

// Уменьшение стамины при беге
if (_run && is_moving && global.stamina > 0) {
    global.stamina -= global.stamina_decrease_rate;
    global.stamina_recovery_timer = 0; // Сбрасываем таймер восстановления
} else {
    // Увеличение таймера восстановления стамины, если не бежит
    global.stamina_recovery_timer += 1;

    // Восстановление стамины после задержки
    if (global.stamina_recovery_timer >= global.stamina_recovery_delay && global.stamina < global.max_stamina) {
        global.stamina += global.stamina_increase_rate;
    }
}

// Ограничение стамины
global.stamina = clamp(global.stamina, 0, global.max_stamina);

    if (_run and (_left or _right or _up or _down) and global.stamina >0) {
        global._move_speed += 3;
    }

    hsp = lengthdir_x(global._move_speed, _mydir);
    vsp = lengthdir_y(global._move_speed, _mydir);

    // Передвижение и столкновения
    move_and_collide(hsp, vsp, Ob_wall);
} else {
    // Если атакуем, скорость движения нулевая
    hsp = 0;
    vsp = 0;
}
