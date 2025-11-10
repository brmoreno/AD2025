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
uniform float g[200];
uniform float b[200];

void main(){
    vec2 pos = gl_FragCoord.xy/res;
    int val = 0;
    float distMin = 2.0;
    for(int i = 0; i<200;i++){
        float dist = distance(pos,vec2(px[i],py[i]));
        if(dist <distMin){
            distMin = dist;
            val = i;
        }
    }
   
    vec3 color = vec3(r[val],g[val],b[val]);
    gl_FragColor = vec4(color,1.0);
}
