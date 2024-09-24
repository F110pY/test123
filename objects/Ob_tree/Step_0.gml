	
    var u_player_pos = shader_get_uniform(Shader_Tree, "u_player_pos");
    var camera_x = camera_get_view_x(view_camera[0]);
    var camera_y = camera_get_view_y(view_camera[0]);

    // Обновляем позицию игрока для всех деревьев
    shader_set_uniform_f(u_player_pos, Ob_collision_player.x - camera_x, Ob_collision_player.y - camera_y);
