varying vec2 v_vTexcoord;
uniform sampler2D gm_Texture;
uniform vec2 u_player_pos;
uniform float u_radius; // радиус

void main() {
    vec4 color = texture2D(gm_Texture, v_vTexcoord);

    // Вычисление расстояния до игрока
    float dist = distance(gl_FragCoord.xy, u_player_pos);

    // Установка прозрачности на основе расстояния
    if (dist < u_radius) {
        color.a *= 0.35; // Прозрачность 50% в радиусе
    }

    gl_FragColor = color;
}