PShader shader;
PVector col1;
PVector col2;
PVector col3;
PVector col4;

void setup(){
  size(600,600,P2D);
  shader = loadShader("miShader.glsl");
  col1 = new PVector(random(1),random(1),random(1));
  col2 = new PVector(random(1),random(1),random(1));
  col3 = new PVector(random(1),random(1),random(1));
  col4 = new PVector(random(1),random(1),random(1));

}

void draw(){
  background(255);
  fill(255,0,0);
  rect(0,0,width,height);
  shader.set("t",millis()*1f);
  shader.set("res",width*1f,height*1f);
  shader.set("col1",col1);
  shader.set("col2",col2);
  shader.set("col3",col3);
  shader.set("col4",col4);
  shader(shader);
  println(millis());
}
