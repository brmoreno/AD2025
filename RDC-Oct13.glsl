#ifdef GL_ES
precision medium float;
#endif

#define PROCESSING_TEXTURE_SHADER

uniform float t;
uniform vec2 res;
uniform vec2 mouse;
uniform bool estado;
uniform int secuencia;
uniform vec3 cambCanal;
varying vec4 vertTexCoord;
uniform sampler2D texture;


void main(){
    vec2 pos = vertTexCoord.st;
    vec3 color = texture2D(texture,pos).rgb;
    
    if(secuencia == 1){
        if(estado){
            float rojo = 1.0-color.r;
            float verde = 1.0- color.g;
            float azul = 1.0- color.b;
            color = vec3(rojo,verde,azul);
        }
    }
    if(secuencia == 2){
        float rojo = texture2D(texture,pos+vec2(cambCanal.x,0.)).r;
        float verde = texture2D(texture,pos+vec2(cambCanal.y,0.)).g;
        float azul = texture2D(texture,pos+vec2(0.,cambCanal.z)).b;
        color = vec3(rojo,verde,azul);
    }
    if(secuencia == 3){
        float v1 = mouse.x * 100;
        float v2 = mouse.y * 0.1;
        pos = pos + vec2(sin(t*0.01+pos.y*v1)*v2,0.0);
        color = texture2D(texture,pos).rgb;
    }
    if(secuencia == 4){
        int vx = int(floor(mouse.x*res.x));
        int vy = int(floor(mouse.y*res.y));
        float x = floor(pos.x*vx)/vx ;
        float y = floor(pos.y*vy)/vy;
        color = texture2D(texture,vec2(x,y)).rgb;
    }
    
    if(secuencia == 5){
        color += vec3(-0.2,0.1,0.3)*sin(t*0.01+pos.y*100.);
    }
    
    gl_FragColor = vec4(color,1.0);
}
