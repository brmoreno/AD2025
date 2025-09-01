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


void main(){
    vec2 pos = gl_FragCoord.xy/res;
    pos*=7.0;
    int vx = int(floor(pos.x));
    int vy =  int(floor(pos.y));
    pos = fract(pos);
    //float v = step(pos.x,pos.y);
    //float v = step(sin(pos.x*3.1415),pos.y);
    vec2 centro = vec2(0.5);
    float dist = distance(pos,centro);
    float v = step(dist,0.5);
    vec3 colorA = vec3(r[vx],g[vx],b[vx]);
    vec3 colorB = vec3(r[vy+1],g[vy+1],b[vy+1]);
    vec3 color = mix(colorA,colorB,v);
    gl_FragColor = vec4(color,1.0);
}
