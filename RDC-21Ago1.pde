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

Osc oscs[] = new Osc[6];


void setup(){
  size(600,600,P2D);
  shader = loadShader("miShader.glsl");  
  for(int i = 0; i<6; i++){
    oscs[i] = new Osc();
  }
}

void draw(){
  for(Osc o:oscs){
    o.update();
  }
  background(255);
  fill(255,0,0);
  rect(0,0,width,height);
  shader.set("t",millis()*1f);
  shader.set("res",width*1f,height*1f);
  shader.set("mouse",mouseX*1f/width, mouseY*1f/height);
  shader.set("colorA",oscs[0].getV(),oscs[1].getV(),oscs[2].getV());
  shader.set("colorB",oscs[3].getV(),oscs[4].getV(),oscs[5].getV());

  shader(shader);
  println(millis());
}
