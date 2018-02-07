#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

vec3 color1 = vec3(0.,0.,0.);
vec3 color2 = vec3(1.,1.,1.);
vec4 bl = vec4(0.007,1.000,0.924,1.000);
vec4 br = vec4(0.005,1.000,0.904,1.000);
vec4 tl = vec4(0.971,0.023,0.980,1.000);
vec4 tr = vec4(1.000,0.053,0.982,1.000);

vec2 GetGradient(vec2 intPos, float t) {
    float rand = fract(sin(dot(intPos, vec2(12.9898, 78.233))) * 0.213213);;
    float angle = 6.283185 * rand + 4.0 * t * rand;
    return vec2(cos(angle), sin(angle));
}


float Pseudo3dNoise(vec3 pos) {
    vec2 i = floor(pos.xy);
    vec2 f = pos.xy - i;
    vec2 blend = f * f * (3.0 - 2.0 * f);
    float noiseVal =
        mix(
            mix(
                dot(GetGradient(i + vec2(0, 0), pos.z), f - vec2(0, 0)),
                dot(GetGradient(i + vec2(1, 0), pos.z), f - vec2(1, 0)),
                blend.x),
            mix(
                dot(GetGradient(i + vec2(0, 1), pos.z), f - vec2(0, 1)),
                dot(GetGradient(i + vec2(1, 1), pos.z), f - vec2(1, 1)),
                blend.x),
        blend.y
    );
    return noiseVal / 0.7; // normalize to about [-1..1]
}


void main() {
    vec2 st = gl_FragCoord.xy/u_resolution.xy;
    float noiseVal = 0.5 + 0.5 * Pseudo3dNoise(vec3(st * 5., u_time / 2.));
	noiseVal = mod(noiseVal, .1) * 10.;

    gl_FragColor = mix(
        mix(bl, br, st.x),
        mix(tl, tr, st.y),
        noiseVal
    );
}
