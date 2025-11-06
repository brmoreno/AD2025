#ifdef GL_ES
precision medium float;
#endif


#define PROCESSING_COLOR_SHADER

uniform float t;
uniform vec2 res;
uniform vec2 mouse;
uniform vec2 offset;
uniform float amp;

float random (vec2 st) {
    return fract(sin(dot(st.xy,
                         vec2(12.9898,78.233)))*
        43758.5453123);
}

float random2 (vec2 st, vec2 offset, float amp ){
    return fract(sin(dot(st.xy,offset))*amp);
}

float noise (in vec2 st) {
    vec2 i = floor(st);
    vec2 f = fract(st);

    // Four corners in 2D of a tile
    float a = random(i);
    float b = random(i + vec2(1.0, 0.0));
    float c = random(i + vec2(0.0, 1.0));
    float d = random(i + vec2(1.0, 1.0));

    vec2 u = f * f * (3.0 - 2.0 * f);

    return mix(a, b, u.x) +
            (c - a)* u.y * (1.0 - u.x) +
            (d - b) * u.x * u.y;
}

float fbm (in vec2 st , int n) {
    
    float value = 0.0;
    float amplitude = .5;
    float frequency = 0.;
    for (int i = 0; i < n; i++) {
        value += amplitude * noise(st);
        st *= 2.;
        amplitude *= .5;
    }
    return value;
}

void main(){
    vec2 pos = gl_FragCoord.xy/res;
    vec3 color = vec3(fbm((pos+t*0.0001)*4.,6));
   
    gl_FragColor = vec4(color,1.0);
}
