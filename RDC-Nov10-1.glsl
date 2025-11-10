#ifdef GL_ES
precision medium float;
#endif


#define PROCESSING_COLOR_SHADER

uniform float t;
uniform vec2 res;
uniform vec2 mouse;
uniform float px[200];
uniform float py[200];
uniform float r[200];
uniform float v[200];

void main(){
    vec2 pos = gl_FragCoord.xy/res;
    float inten = 0;
    for(int i = 0; i<200;i++){
        float dist = distance(pos,vec2(px[i],py[i]));
        float radio = r[i];
        
        if(dist<radio){
            float v1 = v[i]*(1.-(dist/radio));
            inten+=v1;
        }
    }
   
    vec3 color = vec3(step(0.8,inten));
    gl_FragColor = vec4(color,1.0);
}
