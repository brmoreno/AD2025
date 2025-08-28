#ifdef GL_ES
precision medium float;
#endif


#define PROCESSING_COLOR_SHADER

uniform float t;
uniform vec2 res;
uniform vec2 mouse;
uniform float n[10];
uniform float ancho[10] ;
uniform float vel[10];
uniform float r[10];
uniform float g[10];
uniform float b[10];

mat2 rotate2d(float _angle){
    return mat2(cos(_angle),-sin(_angle),
                sin(_angle),cos(_angle));
}


void main(){
    vec2 pos = gl_FragCoord.xy/res;
  
    float v1 = fract(pos.x+t*0.001);
    
    int vv = int(floor(pos.y*10. + t*0.001))%5;
    
    vec3 color = vec3(r[vv],g[vv],b[vv]);
    gl_FragColor = vec4(color,1.0);
}
