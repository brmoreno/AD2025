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
    vec3 color = vec3 (0);
    for(int i = 0; i<10; i++){
        vec2 pos = gl_FragCoord.xy/res;
        pos*= n[i] ;
        float v1 = fract(pos.x+t*vel[i]);
        if( i%2 ==0){
            v1 = fract(pos.y+t*vel[i]);
        }
        float v2 = step(ancho[i], v1);
        //color = mix(color,vec3(r[i],g[i],b[i]),v2);
        color += vec3(r[i],g[i],b[i])*v2;
        
    }
    
    gl_FragColor = vec4(color,1.0);
}
