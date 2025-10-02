#ifdef GL_ES
precision medium float;
#endif


#define PROCESSING_COLOR_SHADER

uniform float t;
uniform vec2 res;
uniform vec2 mouse;


float PI = 3.14159216;

mat2 rotate2d(float _angle){
    return mat2(cos(_angle),-sin(_angle),
                sin(_angle),cos(_angle));
}





void main(){
    vec2 pos = gl_FragCoord.xy/res;
    
    vec3 colorA = vec3(1.0,0.,0.);
    vec3 colorB = vec3(0.,0.,1.);
    vec3 colorC = vec3(0.,1.0,0.);
    vec3 colorD = vec3(1.0,1.0,0.);
    
    vec3 colorE = mix(colorA,colorB,pos.x);
    vec3 colorF = mix(colorC,colorD,pos.x);
    vec3 color = mix(colorE,colorF,pos.y);
    
    
    
    gl_FragColor = vec4(color,1.0);
}
