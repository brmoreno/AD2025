#ifdef GL_ES
precision medium float;
#endif


#define PROCESSING_COLOR_SHADER

uniform float t;
uniform vec2 res;
uniform vec3 col1;
uniform vec3 col2;
uniform vec3 col3;
uniform vec3 col4;


void main(){
    vec2 pos = gl_FragCoord.xy/res;
    
    //cambio con t
    //float rojo = sin(t*0.001)*0.5+0.5;
    //float verde = sin(t*0.004)*0.6+0.4;
    //float azul = mod(t*0.001,1.);
    //vec3 color = vec3(rojo,verde,azul);
    
    
    //cambio con vec de posición
    //float rojo = sin(t*0.005+pos.x*60.0)*0.5+0.5;
    //float verde = sin(-t*0.005+pos.x*30.0)*0.7+0.5;;
    //float azul = 0.;
    
    
    //vec3 color = vec3(rojo,verde,azul);
    vec3 ci1 =mix(col1,col2,pos.x);
    vec3 ci2 = mix(col3,col4,pos.x);
    vec3 color = mix(ci1,ci2,pos.y);
    
    gl_FragColor = vec4(color,1.0);
}
