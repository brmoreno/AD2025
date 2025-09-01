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
uniform float inten[10];
uniform float r[10];
uniform float g[10];
uniform float b[10];

mat2 rotate2d(float _angle){
    return mat2(cos(_angle),-sin(_angle),
                sin(_angle),cos(_angle));
}


vec3 palette( in float t, in vec3 a, in vec3 b, in vec3 c, in vec3 d )
{
    return a + b*cos( 6.283185*(c*t+d) );
}

void main(){
    float inte = 0;
    for(int i = 0; i<10; i++){
        vec2 pos = gl_FragCoord.xy/res;
        pos*= n[i] ;
        float v1 = fract(pos.x+t*vel[i]);
        if( i%2 ==0){
            v1 = fract(pos.y+t*vel[i]);
        }
        float v2 = step(ancho[i], v1);
        inte += inten[i]*v2;
    }
    
    int vv1 = int(floor(inte))%3;
    int vv2 = int(ceil(inte))%3;
    
    vec3 color1 = vec3(r[vv1],g[vv1],b[vv1]);
    vec3 color2 = vec3(r[vv2],g[vv2],b[vv2]);
    
    //vec3 color = mix(color1, color2,fract(inte));
    vec3 a = vec3(0.5);
    vec3 b = vec3(0.5);
    vec3 c = vec3(2.0,1.0,0.);
    vec3 d = vec3(0.5, 0.2, 0.25);
    vec3 color = palette(inte,a,b,c,d);
    
    gl_FragColor = vec4(color,1.0);
}
