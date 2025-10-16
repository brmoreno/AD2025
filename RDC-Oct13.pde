PShader shader;
PImage img;
int cuenta;
boolean estado;
int secuencia; 
PVector cambCanal;

void setup(){
  size(400,600,P2D);
  shader = loadShader("miShader.glsl");
  img = loadImage("gato.png");
  cambCanal = new PVector();
}

void draw(){ 
  cuenta++;
  if(cuenta%3 == 0){
    estado = !estado;
  }
  cambCanal.x = random(-0.1,0.1);
  cambCanal.y = random(-0.1,0.1);
  cambCanal.z = random(-0.1,0.1);
  shader.set("t", millis()*1f);
  shader.set("res",img.width*1f,img.height*1f);
  shader.set("mouse", mouseX*1f/width,1.0-mouseY*1f/height);
  shader.set("estado",estado);
  shader.set("secuencia", secuencia);
  shader.set("cambCanal",cambCanal);
  shader(shader);
  image(img,0,0);
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
