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
float PI = 3.14159265359;

vec3 cosPalette(  float t,  vec3 a,  vec3 b,  vec3 c, vec3 d ){
    return a + b*cos( 6.28318*(c*t+d) );
}

void main(){
    vec2 pos = vertTexCoord.st;
    pos-= vec2(0.5);
    float vix = (length(pos)/0.5)*4;
    float vx = fract(vix);
    int v = int(floor(vix));
    float angulo = (atan(pos.y,pos.x)+PI);
    float v1 = 0.0001;
    if(v%2 == 0){
        v1*=-1;
    }
    float viy =  angulo/(PI*2.)*(3+v)+t*v1;
    
    
    float vy = fract(viy);
    if(v%2 == 0){
        vy = fract(1-viy);
    }
    
    vec2 posT = vec2(vx,vy);
    vec3 color = texture2D(texture,posT).rgb;
    
        
    

    
    gl_FragColor = vec4(color,1.0);
}
