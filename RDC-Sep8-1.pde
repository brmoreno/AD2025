
PShader shader;
float angulos [] = {QUARTER_PI,QUARTER_PI+HALF_PI,QUARTER_PI+PI,-QUARTER_PI}; 
float r[] = new float[8];
float g[] = new float[8];
float b[] = new float[8];
float da[] = {0.01,-0.01,0.01,-0.01};
void setup(){
  size(600,600,P2D);
  shader = loadShader("miShader.glsl");  
  for(int  i = 0; i<8; i++){
    r[i] = random(1);
    g[i] = random(1);
    b[i] = random(1);
  }
}

void draw(){
  for(int i = 0; i<4; i++){
    angulos[i]+=da[i];
  }
  background(255);
  fill(255,0,0);
  rect(0,0,width,height);
  shader.set("t",millis()*1f);
  shader.set("res",width*1f,height*1f);
  shader.set("mouse",mouseX*1f/width, 1-mouseY*1f/height);
  shader.set("angulos",angulos);
  shader.set("r",r);
  shader.set("g",g);
  shader.set("b",b);
  shader(shader);
  println(millis());
}

void keyPressed(){
  for(int i = 0; i<4; i++){
    da[i] = random(- 0.05,0.05);
  }
}
