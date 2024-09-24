// Событие Draw для Ob_tree
shader_set(Shader_Tree);


// Получаем uniform'ы
var u_player_pos = shader_get_uniform(Shader_Tree, "u_player_pos");
var camera_x = camera_get_view_x(view_camera[0]);
var camera_y = camera_get_view_y(view_camera[0]);

var u_radius = shader_get_uniform(Shader_Tree, "u_radius");


// Передаем значения
shader_set_uniform_f(u_player_pos, Ob_collision_player.x - camera_x + 129, Ob_collision_player.y - camera_y + 87);

shader_set_uniform_f(u_radius, 200); // Установите радиус по вашему желанию


// Рисуем спрайт
draw_sprite(Sp_tree, 0, x, y);


// Сбрасываем шейдер
shader_reset();