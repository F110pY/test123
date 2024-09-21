/// @description Вставьте описание здесь
// Вы можете записать свой код в этом редакторе
var stamina_bar_width = 100; // Ширина полосы стамины
var stamina_bar_height = 10; // Высота полосы стамины
var stamina_x = Ob_collision_player.x - stamina_bar_width / 2; // Центрирование полосы
var stamina_y = Ob_collision_player.y + 30; // Положение полосы над персонажем

// Фон полосы стамины
draw_set_color(c_black);
draw_rectangle(stamina_x, stamina_y, stamina_x + stamina_bar_width, stamina_y + stamina_bar_height, false);

// Заполнение полосы стамины
draw_set_color(c_green);
draw_rectangle(stamina_x, stamina_y, stamina_x + (global.stamina / global.max_stamina) * stamina_bar_width, stamina_y + stamina_bar_height, false);

draw_text(20,20, global._move_speed)
if instance_exists(Ob_enemy)
	draw_text(50, 50, Ob_enemy.hp);