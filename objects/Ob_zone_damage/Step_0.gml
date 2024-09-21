
image_angle = Ob_player_sp.image_angle - 90


if (place_meeting(x, y, Ob_enemy)) {
    var enemy = instance_place(x, y, Ob_enemy); // Находим врага

    // Проверяем, был ли уже нанесен урон этому врагу в текущей атаке
    if (!enemy.damage_taken) {
        enemy.hp -= 2;              // Наносим урон
        enemy.damage_taken = true;  // Устанавливаем флаг, что урон был нанесен
		
		// Вычисляем направление отталкивания
            var player_x = Ob_collision_player.x;
            var player_y = Ob_collision_player.y;
            global.knockback_direction = point_direction(player_x, player_y, x, y);
    }
}

// Сброс флага после окончания атаки
if (global.animation_attack) {
    global.animation_attack = false;
    
    // Сбрасываем флаг damage_taken для всех врагов
    with (Ob_enemy) {
        damage_taken = false; // Сбрасываем флаг для каждого врага
    }
}