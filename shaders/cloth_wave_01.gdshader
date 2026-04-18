shader_type spatial;
render_mode cull_disabled;

uniform float amplitude_u = 0.05;
uniform float frequency_u = 20.0; 
uniform float speed_u = 5.0;

uniform float amplitude_v = 0.10;
uniform float frequency_v = 10.0;
uniform float speed_v = 2.0;

float get_height(vec2 uv) {
    float phase_u = TIME * speed_u + uv.x * frequency_u;
    float phase_v = TIME * speed_v + uv.y * frequency_v;

    float wave_u = sin(phase_u);
    float wave_v = sin(phase_v);

    return (wave_u * amplitude_u + wave_v * amplitude_v);
}

void vertex() {
	float height = get_height(UV);
	VERTEX += NORMAL * height;
}

void fragment() {
	ALBEDO = vec3(UV.x, UV.y, 0.0);
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
