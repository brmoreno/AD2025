PShader shader;

void setup(){
  size(600,600,P2D);
  shader = loadShader("miShader.glsl");
}

void draw(){
  background(255);
  fill(255,0,0);
  rect(0,0,width,height);
  shader(shader);
}
