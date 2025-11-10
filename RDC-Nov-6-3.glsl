#ifdef GL_ES
precision medium float;
#endif


#define PROCESSING_COLOR_SHADER

uniform float t;
uniform vec2 res;
uniform vec2 mouse;
uniform vec2 offset;
uniform float amp;

float random3 (in vec3 st) {
    return fract(sin(dot(st, vec3(12.9898,78.233, 37.719))) * 43758.5453123);
}

float noisee (in vec3 st) {
    vec3 i = floor(st);
    vec3 f = fract(st);

    float a = random3(i);
    float b = random3(i + vec3(1.0, 0.0, 0.0));
    float c = random3(i + vec3(0.0, 1.0, 0.0));
    float d = random3(i + vec3(1.0, 1.0, 0.0));
    float e = random3(i + vec3(0.0, 0.0, 1.0));
    float f1 = random3(i + vec3(1.0, 0.0, 1.0));
    float g = random3(i + vec3(0.0, 1.0, 1.0));
    float h = random3(i + vec3(1.0, 1.0, 1.0));

    vec3 u = f * f * (3.0 - 2.0 * f);

    return mix(
        mix(
            mix(a, b, u.x),
            mix(c, d, u.x),
            u.y
        ),
        mix(
            mix(e, f1, u.x),
            mix(g, h, u.x),
            u.y
        ),
        u.z
    );
}



float fbm3 (in vec3 st , int n) {
    float value = 0.0;
    float amplitude = .5;
    float frequency = 0.;
    for (int i = 0; i < n; i++) {
        value += amplitude * noisee(st);
        st *= 2.;
        amplitude *= .5;
    }
    return value;
}

void main(){
    vec2 pos = gl_FragCoord.xy/res;
    vec3 color = vec3(fbm3(vec3(pos*4+t*0.0005,mouse.x),5));
   
    gl_FragColor = vec4(color,1.0);
}
