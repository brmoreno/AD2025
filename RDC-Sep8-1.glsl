#ifdef GL_ES
precision medium float;
#endif


#define PROCESSING_COLOR_SHADER

uniform float t;
uniform vec2 res;
uniform vec2 mouse;
uniform float angulos [4];
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
    vec2 pos = gl_FragCoord.xy/res;
    pos*=6.;
    pos.x+=t*0.001;
    //pos.y+= sin(pos.x*1.5 +t*0.001)*0.7;
    int vx = int(floor(pos.x))%2;
    int vy = int (floor(pos.y))%2;
    int vv = vx +vy*2;
    pos= fract(pos);
    pos-= vec2(.5);
  
    pos*=rotate2d(angulos[vv]);
    float v = step(0.,pos.x);
    vec3 colorA = vec3(r[vv],g[vv],b[vv]);
    vec3 colorB = vec3(r[4+vv],g[4+vv],b[4+vv]);;
    color = mix(colorA,colorB,v);
    gl_FragColor = vec4(color,1.0);
}
