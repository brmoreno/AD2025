#ifdef GL_ES
precision medium float;
#endif


#define PROCESSING_COLOR_SHADER

uniform float t;
uniform vec2 res;
uniform vec2 mouse;
uniform float px [100];
uniform float py [100];
uniform float inten [100];
uniform float radio [100];

float PI = 3.14159216;

mat2 rotate2d(float _angle){
    return mat2(cos(_angle),-sin(_angle),
                sin(_angle),cos(_angle));
}





void main(){
    vec2 pos = gl_FragCoord.xy/res;
    vec3 color = vec3(0.);
    for(int i = 0; i<100; i++){
        float dist = distance(vec2(px[i],py[i]),pos);
        float limDist = clamp(dist,0.,radio[i])/radio[i];
        float v = (1-limDist)*inten[i];
        color += vec3(v);

    }
    
    
    gl_FragColor = vec4(color,1.0);
}
