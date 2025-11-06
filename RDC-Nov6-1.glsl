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

void main(){
    vec2 pos = gl_FragCoord.xy/res;
    vec3 color = vec3(random2(pos,offset,amp));
   
    gl_FragColor = vec4(color,1.0);
}
