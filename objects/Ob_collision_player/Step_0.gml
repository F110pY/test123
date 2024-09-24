
if (!global.is_attacking) {
    var _right = keyboard_check(ord("D"));
    var _left = keyboard_check(ord("A"));
    var _up = keyboard_check(ord("W"));
    var _down = keyboard_check(ord("S"));
    var _run = keyboard_check(vk_shift);
	var _roll = keyboard_check_pressed(vk_space)

    global._move_speed = (_left or _right or _up or _down) * my_speed;
    var _mydir = point_direction(0, 0, _right - _left, _down - _up); 
	
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
        global._move_speed += 2; //изменить скорость спринта
    }


	// Перекат
	if (_roll and is_rolling == false and global.stamina >66) {
		show_debug_message("Перекат начат!");

		is_rolling = true; // Включаем флаг переката
		global.stamina -= global.max_stamina/3
		roll_timer = roll_duration; // Устанавливаем таймер переката
		
		// Расчет направления переката
		roll_direction = point_direction(0, 0, _right - _left, _down - _up);
    if (roll_direction == 0) {
        roll_direction = Ob_player_sp.image_angle; // Если персонаж не движется, используем текущий угол
    }
	}

	// Если игрок перекатывается
	if (is_rolling) {
		if (roll_timer > 0) {
        show_debug_message("Игрок перекатывается!");

        // Расчет направления переката
        var roll_x = lengthdir_x(roll_distance, roll_direction);
        var roll_y = lengthdir_y(roll_distance, roll_direction);

        // Проверяем столкновения во время переката
        if (!place_meeting(x + roll_x, y, Ob_wall)) {
            x += roll_x; // Перемещаем игрока
        }
        if (!place_meeting(x, y + roll_y, Ob_wall)) {
            y += roll_y; // Перемещаем игрока
        }
		if (global.stamina_recovery_timer >= global.stamina_recovery_delay && global.stamina < global.max_stamina) {
			global.stamina += global.stamina_increase_rate;
		}
		global.stamina_recovery_timer = 0
        roll_timer--; // Уменьшаем таймер
    } else {
        is_rolling = false; // Завершаем перекат
    }
} else {
    // Логика обычного движения
	hsp = lengthdir_x(global._move_speed, _mydir);
    vsp = lengthdir_y(global._move_speed, _mydir);

    // Передвижение и столкновения
    move_and_collide(hsp, vsp, Ob_wall);
}
} else {
    // Если атакуем, скорость движения нулевая
    hsp = 0;
    vsp = 0;
}
