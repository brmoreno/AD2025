PShader shader;
PImage img;
int secuencia = 0;
PImage textura;
float vr[] = new float[3];
float vg[] = new float[3];
float vb[] = new float[3];


void setup(){
  size(600,600,P2D);
  shader = loadShader("miShader.glsl");
  img = loadImage("gato.png");
  textura = loadImage("textura.png");
  for(int i = 0; i<3; i++){
    vr[i] = random(1);
    vg[i] = random(1);
    vb[i] = random(1);    
  }
}

void draw(){ 
   
  shader.set("t", millis()*1f);
  shader.set("res",img.width*1f,img.height*1f);
  shader.set("mouse", mouseX*1f/width,1.0-mouseY*1f/height);
  shader.set("secuencia",secuencia);
  shader.set("textura",textura);
  shader.set("vr", vr);
  shader.set("vg", vg);
  shader.set("vb", vb);
  shader(shader);
  image(img,0,0,width,height);
 
}

void keyPressed(){
  if(key == 'a'){
    secuencia = 0;
  }
  if(key == 's'){
    secuencia = 1;
  }
  if(key == 'd'){
    secuencia = 2;
  }
  if(key == 'f'){
    secuencia = 3;
  }
  if(key == 'g'){
    secuencia = 4;
  }
  if(key == 'h'){
    secuencia = 5;
  }
}
