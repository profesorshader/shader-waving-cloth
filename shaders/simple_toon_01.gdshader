shader_type spatial;

render_mode diffuse_toon, specular_disabled;

uniform sampler2D albedo_tex : source_color;
uniform vec4 tint : source_color = vec4(1.0);
uniform float shade_levels = 3.0;

void fragment() {
    vec3 albedo = texture(albedo_tex, UV).rgb * tint.rgb;
    ALBEDO = albedo;
}

void light() {
    float ndl = max(dot(NORMAL, LIGHT), 0.0);
    float toon = floor(ndl * shade_levels) / shade_levels;
    DIFFUSE_LIGHT += ALBEDO * toon * LIGHT_COLOR;
}