
PShader shader;

float px[] = new float[8];
float py[] = new float[8];
float radio[] = new float[8];
float n[] = new float[8];
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
    px[i] = random(-0.0001,0.0001);
    py[i] = random(-0.0001,0.0001);
    radio[i] = random(0.2,0.9);
    n[i] = random(1,3);
  }
}

void draw(){
  
  background(255);
  fill(255,0,0);
  rect(0,0,width,height);
  shader.set("t",millis()*1f);
  shader.set("res",width*1f,height*1f);
  shader.set("mouse",mouseX*1f/width, 1-mouseY*1f/height);
  shader.set("r",r);
  shader.set("g",g);
  shader.set("b",b);
  shader.set("px",px);
  shader.set("py",py);
  shader.set("radio",radio);
  shader.set("n",n);
  shader(shader);
  println(millis());
}

void keyPressed(){
  for(int i = 0; i<4; i++){
    da[i] = random(- 0.05,0.05);
  }
}
