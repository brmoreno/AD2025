class Osc{
  float fase;
  float fq;
  
  Osc(){
    fase = random(TWO_PI);
    fq = random(0.05);
  }
  
  void update(){
    fase+=fq;
  }
  
  float getV(){
    return sin(fase)*0.5 + 0.5;
  }
}

PShader shader;
float n[] = new float[10];
float ancho[] = new float[10];
float vel[] = new float[10];
float r[] = new float[10];
float g[] = new float[10];
float b[] = new float[10]; 


void setup(){
  size(600,600,P2D);
  shader = loadShader("miShader.glsl");  
  for(int i = 0; i<10; i++){
    n[i] = random(8,10);
    ancho[i] = random(0.2,0.5);
    vel[i] = random(-0.001,0.001);
    r[i] = random(0.2);
    g[i] = random(0.2);
    b[i] = random(0.2);
  }
}

void draw(){
  
  background(255);
  fill(255,0,0);
  rect(0,0,width,height);
  shader.set("t",millis()*1f);
  shader.set("res",width*1f,height*1f);
  shader.set("mouse",mouseX*1f/width, 1-mouseY*1f/height);
  shader.set("n", n);
  shader.set("ancho", ancho);
  shader.set("vel",vel);
  shader.set("r",r);
  shader.set("g",g);
  shader.set("b",b);
  shader(shader);
  println(millis());
}
