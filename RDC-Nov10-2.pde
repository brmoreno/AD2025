class Nodo{
  PVector pos;
  PVector vel;
  float r;
  float g;
  float b;
  
  Nodo(){
    pos = new PVector(random(1),random(1));
    vel = PVector.random2D().mult(0.001);
    r = random(1);
    g = random(1);
    b = random(1);
  }
  
  void mover(){
    pos.add(vel);
  }
}

PShader shader;
PVector offset;
float amp;
ArrayList <Nodo> nodos;
float py[] = new float[200]; 
float px[] = new float[200]; 
float r[] = new float[200]; 
float g[] = new float[200];
float b[] = new float[200];

void setup(){
  size(700,700,P2D);  
  shader = loadShader("miShader.glsl");    
  offset = new PVector(100,0);
  nodos = new ArrayList <Nodo> ();
  for(int i = 0; i<200; i++){
    nodos.add(new Nodo());
  }
}

void draw(){
  for(int i = 0; i<200; i++){
    px[i] = nodos.get(i).pos.x;
    py[i] = nodos.get(i).pos.y;
    r[i] = nodos.get(i).r;
    g[i] = nodos.get(i).g;
    b[i] = nodos.get(i).b;
    nodos.get(i).mover();
  }
  shader(shader);
  shader.set("t",millis()*1f);
  shader.set("res",width*1f,height*1f);
  shader.set("mouse",mouseX*1f/width, 1-mouseY*1f/height);
  shader.set("px",px);
  shader.set("py",py);
  shader.set("r",r);
  shader.set("g",g);
  shader.set("b",b);
  rect(0,0,width,height);
}
