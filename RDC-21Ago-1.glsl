#ifdef GL_ES
precision medium float;
#endif


#define PROCESSING_COLOR_SHADER

uniform float t;
uniform vec2 res;
uniform vec2 mouse;
uniform vec3 colorA;
uniform vec3 colorB;

mat2 rotate2d(float _angle){
    return mat2(cos(_angle),-sin(_angle),
                sin(_angle),cos(_angle));
}


void main(){
    vec2 pos = gl_FragCoord.xy/res;
    pos-=vec2(0.5);
    pos*=10.;
    pos = pos*rotate2d(mouse.x*7.);
    pos.x+= t*-0.002;
    float v1 = fract(pos.x);
    float v2 = step(0.7,v1);

    vec3 color = mix(colorA,colorB,v2);
    
    gl_FragColor = vec4(color,1.0);
}
