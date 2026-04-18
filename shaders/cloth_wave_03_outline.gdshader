shader_type spatial;
render_mode unshaded, cull_front;

uniform float amplitude_u = 0.05;
uniform float frequency_u = 62.83185307179586 ; // = 10 * 2PI; 
uniform float speed_u = 5.0;

uniform float amplitude_v = 0.05;
uniform float frequency_v = 10.0;
uniform float speed_v = 2.0;

// outline stuff
uniform float weight = 0.0025;
uniform vec4 color : source_color = vec4(0.0, 0.0, 0.0, 1.0);

float get_height(vec2 uv, float w) {
    float phase_u = TIME * speed_u + uv.x * frequency_u;
    float phase_v = TIME * speed_v + uv.y * frequency_v;

    float wave_u = sin(phase_u);
    float wave_v = sin(phase_v);

    return (wave_u * amplitude_u + wave_v * amplitude_v) * w;
}

void vertex() {
	float height = get_height(UV, COLOR.x);
    vec3 nrm = NORMAL * height;
	VERTEX += NORMAL * weight + nrm;
}

void fragment() {
    ALBEDO = color.rgb;
}

