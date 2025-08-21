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
    float dist = distance(mouse,pos);
    //vec3 color = mix(colorA,colorB,dist);
    
    //dist*=10.0;
    //dist-=t*0.001;
    //float v1 = fract(dist);
    //float v2 = step(0.5, v1);
    //vec3 color = mix(colorA,colorB,v2);
    
    
    pos-=vec2(mouse);
    pos*=rotate2d(dist*3.0+t*0.001);
    float angulo = 3.141592+(atan(pos.y,pos.x));
    float v1 = fract((angulo/6.28)*10. );
    float v2 = step(0.5,v1);
    vec3 color = mix(colorA,colorB,v2);
    
    gl_FragColor = vec4(color,1.0);
}
