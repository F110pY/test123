// Получаем ввод от клавиатуры и мыши
_right = keyboard_check(ord("D"));
_left = keyboard_check(ord("A"));
_up = keyboard_check(ord("W"));
_down = keyboard_check(ord("S"));
_attack = mouse_check_button_pressed(mb_left);
_roll = keyboard_check(vk_space)

// Получаем координаты от объекта столкновений
x = Ob_collision_player.x;
y = Ob_collision_player.y;


// Если игрок не атакует и есть движение, изменяем спрайт на ходьбу
    if (!global.is_attacking) {
		if (_right || _left || _up || _down and !Ob_collision_player.is_rolling) {
			if Ob_collision_player.is_rolling {
				sprite_index = Sp_roll_pl; // Устанавливаем спрайт переката
				image_speed = 1; // Устанавливаем скорость анимации
			} else {
				show_debug_message("спрайт заменен на обычный");
				sprite_index = Sp_walk_pl;
				image_speed = 0.5;
			}
			
			// Расчет угла на основе направления
			var _angle = point_direction(0, 0, _right - _left, _down - _up);

			// Плавное вращение
			image_angle = set_angle(image_angle, _angle, 8);
		} else {
			if Ob_collision_player.is_rolling {
				show_debug_message("спрайт заменен");
				sprite_index = Sp_roll_pl; // Устанавливаем спрайт переката
				image_speed = 1; // Устанавливаем скорость анимации
			} else {
				// Если игрок не двигается и не атакует, используем спрайт ожидания
				sprite_index = Sp_idle_pl;
			}
		}
	}
	
// Уменьшаем счетчик задержки атаки (cooldown)
if (global.attack_cooldown > 0) {
    global.attack_cooldown -= 1;
}


// Логика атаки
if (_attack && global.attack_cooldown <= 0 && !global.is_attacking) {
    // Начало атаки
    sprite_index = Sp_attack_pl;   // Спрайт с анимацией удара
    image_speed = 0.5;             // Скорость анимации
    image_index = 0;               // Начало анимации с первого кадра
    global.is_attacking = true;    // Устанавливаем флаг атаки
    global.attack_cooldown = 30;   // Задержка между ударами

    // Определение угла атаки (используем угол персонажа)
    var attack_distance = 32;  // Расстояние до зоны атаки от персонажа (регулируется)
    var attack_angle = image_angle;  // Угол персонажа (куда он смотрит)

    // Определение позиции зоны атаки перед персонажем
    var attack_x = x + lengthdir_x(attack_distance, attack_angle);
    var attack_y = y + lengthdir_y(attack_distance, attack_angle);

    // Создаем зону удара перед персонажем
    instance_create_depth(attack_x, attack_y, 0, Ob_zone_damage);
}

// Логика завершения атаки
if (global.is_attacking) {
    // Если анимация завершилась (последний кадр спрайта)
    if (image_index >= image_number - 1) {
        global.is_attacking = false;  // Сбрасываем флаг атаки
        sprite_index = Sp_idle_pl;    // Возвращаемся к состоянию покоя
    }
}

if (image_index == image_number - 1) {
    global.animation_attack = false; // Сброс флага завершения анимации
}