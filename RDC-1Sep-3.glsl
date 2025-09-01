#ifdef GL_ES
precision medium float;
#endif


#define PROCESSING_COLOR_SHADER

uniform float t;
uniform vec2 res;
uniform vec2 mouse;
uniform float n[10];
uniform float ancho[10] ;
uniform float velx[10];
uniform float vely[10];
uniform float inten[10];
uniform float r[10];
uniform float g[10];
uniform float b[10];


void main(){
    vec3 color = vec3(0);
    for(int i = 0; i<10; i++){
        vec2 pos = gl_FragCoord.xy/res;
        pos*=n[i];
        pos+= t*vec2(velx[i],vely[i]);
        pos = fract(pos);
        vec2 centro = vec2(0.5);
        float dist = distance(pos,centro);
        float v = step(dist,ancho[i]);
        //color = mix(color, vec3(r[i],g[i],b[i]),v);
        color+=vec3(r[i],g[i],b[i])*v;
    }
    
    gl_FragColor = vec4(color,1.0);
}
