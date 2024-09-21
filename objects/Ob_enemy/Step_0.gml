
if hp <= 0 {
	instance_create_depth(x, y, 0, Ob_dead_enemy)
	instance_destroy(self)
}
if !collision_line(x, y, Ob_collision_player.x, Ob_collision_player.y, Ob_wall, 0, 1) {
	if !is_knockback and distance_to_object(Ob_collision_player) > 30 and !is_dead{
		mp_potential_step_object(Ob_collision_player.x, Ob_collision_player.y, 4, Ob_wall)}
}

// Применяем отталкивание
if (damage_taken) {
	if (knockback_timer > 0) {
	is_knockback = true
    var knockback_x = lengthdir_x(knockback_strength, global.knockback_direction);
    var knockback_y = lengthdir_y(knockback_strength, global.knockback_direction);
    
    // Используем mp_potential_step для отталкивания с учетом столкновений
    if (!place_meeting(x + knockback_x, y, Ob_wall)) {
        x += knockback_x; // Если нет столкновения, применяем отталкивание
    }
    if (!place_meeting(x, y + knockback_y, Ob_wall)) {
        y += knockback_y; // Проверяем по Y
    }
	knockback_timer--; // Уменьшаем таймер
}
}

if (!global.is_attacking) {
	is_knockback = false
    damage_taken = false;  // Сбрасываем флаг, чтобы враг мог получить урон в следующей атаке
}

// Если урон был нанесен, устанавливаем таймер
if (damage_taken && knockback_timer == 0) {
    knockback_timer = knockback_duration; // Устанавливаем таймер отталкивания
}

