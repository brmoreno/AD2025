#ifdef GL_ES
precision medium float;
#endif


#define PROCESSING_COLOR_SHADER

uniform float t;
uniform vec2 res;
uniform vec2 mouse;
uniform float px [8];
uniform float py [8];
uniform float radio [8];
uniform float n [8];
uniform float r[8];
uniform float g[8];
uniform float b[8];


float PI = 3.14159216;
mat2 rotate2d(float _angle){
    return mat2(cos(_angle),-sin(_angle),
                sin(_angle),cos(_angle));
}


void main(){
    vec3 color = vec3(0);
    float v = 0;
    for(int i = 0; i<8; i++){
        vec2 pos = gl_FragCoord.xy/res;
        pos+=vec2(t*px[i],t*py[i]);
        pos*=n[i];
        pos = fract(pos);
        pos-=vec2(0.5);
        float vv = clamp(radio[i] - length(pos),0.,radio[i])*radio[i]*3.;
        v+=vv;
    }
    int c1 = int(floor(v));
    int c2 = int(ceil(v));
    vec3 colorA = vec3(r[c1],g[c1],b[c1]);
    vec3 colorB = vec3(r[c2],g[c2],b[c2]);
    color = mix(colorA,colorB,fract(v));
    gl_FragColor = vec4(color,1.0);
}
