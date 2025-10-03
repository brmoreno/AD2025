#ifdef GL_ES
precision medium float;
#endif


#define PROCESSING_COLOR_SHADER

uniform float t;
uniform vec2 res;
uniform vec2 mouse;
uniform float px[50];
uniform float py[50];
uniform float rota[50];
uniform float w[50];
uniform float h[50];
uniform float r1[50];
uniform float g1[50];
uniform float b1[50];
uniform float r2[50];
uniform float g2[50];
uniform float b2[50];

float PI = 3.14159216;

mat2 rotate2d(float _angle){
    return mat2(cos(_angle),-sin(_angle),
                sin(_angle),cos(_angle));
}

float sdBox( in vec2 p, in vec2 b )
{
    vec2 d = abs(p)-b;
    return length(max(d,0.0)) + min(max(d.x,d.y),0.0);
}


void main(){
    vec3 color = vec3(0.);
    for(int i = 0; i<50; i++){
        vec2 pos = gl_FragCoord.xy/res;
        pos -= vec2(px[i],py[i]);
        pos *= rotate2d(rota[i]);
        float v = sdBox(pos,vec2(w[i],h[i]));
        float v1 = step(v,0.);
        float dire = 0.003;
        if(i%2 == 0){
            dire*=-1;
        }
        float v2 = step(fract(v*100.0+t*dire),0.5);
        vec3 colorR = mix(vec3(r1[i],g1[i],b1[i]),vec3(r2[i],g2[i],b2[i]),v2);
        color = mix(color,colorR,v1);
    }
    gl_FragColor = vec4(color,1.0);
}
