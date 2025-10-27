#ifdef GL_ES
precision medium float;
#endif

#define PROCESSING_TEXTURE_SHADER

uniform float t;
uniform vec2 res;
uniform vec2 mouse;
uniform bool estado;
varying vec4 vertTexCoord;
uniform sampler2D texture;
uniform sampler2D textura;
uniform int secuencia;
float V111 = 1.7320508;
uniform float vr[3];
uniform float vg[3];
uniform float vb[3];


void main(){
    vec2 pos = vertTexCoord.st;
    vec3 color = texture2D(texture,pos).rgb;
    
    if(secuencia == 1){
        float v = length(color)/V111;
        float v1 = smoothstep(mouse.x,mouse.x+0.2,v);
        float v2  = texture2D(textura,pos).r;
        if(v1 >= 1){
            
        }
        color = vec3(v1);
        
    }
    if(secuencia == 2){
        color = vec3(1.0);
        
        for(int i = 0; i<3; i++){
            pos = vertTexCoord.st;
            pos -= vec2(i*0.1,0.);
            vec3 colorA = texture2D(texture,pos).rgb;
            float v = length(colorA)/V111;
            float v1 = step(v,mouse.x);
            
            color = mix(color, vec3(vr[i],vg[i],vb[i]),v1);
        }
    }
   
    if(secuencia == 3){
        
        vec2 centro = vec2(0.5);
        float dist = distance(centro, pos);
        float osc = sin(-t*0.002+dist*mouse.x*200)*0.2*mouse.y;
        vec2 dire = pos - centro;
        dire = normalize(dire);
        dire*=osc;
        pos+=dire;
        color = texture2D(texture,pos).rgb;
        
    }
    
    if(secuencia ==4){
        pos = vertTexCoord.st;
        pos-= vec2(0.5);
        float vx = length(pos)/0.5;
        float angulo = atan(pos.y,pos.x);
        float vy = angulo/6.28;
        if(vy<0){
            vy=(angulo + 6.28)/6.28;
        }
        vec2 posT = vec2(vx,vy);
        color = texture2D(texture,posT).rgb;
        
        
    }

    
    gl_FragColor = vec4(color,1.0);
}
