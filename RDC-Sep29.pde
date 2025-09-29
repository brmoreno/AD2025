class Brillo{
  PVector p;
  float inten;
  float radio;
  
  Brillo(){
    p = new PVector(random(1),random(1));
    inten = random(0.1,0.6);
    radio = random(0.01, 0.2);
  }  
}

class Brillo1 extends Brillo{
  PVector v;
  float v2;
  Brillo1(){
    super();
    v = new PVector(-0.001,0.);
    v2 = random(0.0005,0.002);
  }
  
  void mover(){
    v = PVector.fromAngle(noise(p.x,p.y,vzNoise)*TWO_PI*2);
    v.mult(v2);
    p.add(v);
    if(p.x<-radio){
      p.x = 1+radio;
      p.y = random(1);
    }
    
    if(p.x>1 +radio){
      p.x = -radio;
      p.y = random(1);
    }
    
    if(p.y<-radio){
      p.x = random(1);
      p.y = 1+radio;
    }
    
    if(p.y>1 +radio){
      p.x = random(1);
      p.y = -radio;
    }
  }  
}

class Brillo2 extends Brillo{
  PVector aux;
  float dr;
  Brillo2(){
    super();
    aux = PVector.random2D().mult(random(0.2,0.7));
    dr = random(-0.01,0.01);
  }
  
  void mover(){
    p = new PVector(0.5,0.5);
    aux.rotate(dr);
    p.add(aux);
  } 
  
}


class Brillo3 extends Brillo{
  PVector pobj;
  float v;
  Brillo3(PVector pobj_){
    super();
    pobj = pobj_;
    v = random(0.001,0.01);
  }
  
  void mover(){
    float dist = PVector.dist(pobj,p);
    if(dist>v){
    PVector dir = PVector.sub(pobj,p);
    dir.normalize().mult(v);
    p.add(dir);
    }
  }
  
  void asignaObj(PVector obj_){
    pobj = obj_;
  }  
}

float vzNoise;
ArrayList <Brillo3> brillos;
PShader shader;
PVector pr;
void setup(){
  size(700,700,P2D);  
  shader = loadShader("miShader.glsl");    
  brillos = new ArrayList <Brillo3> ();
  pr = new PVector(0.4,0);
  for( int i = 0; i<100; i++){
    
    brillos.add(new Brillo3(pr.copy().add(0.5,0.5)));
    pr.rotate(TWO_PI/100);
  }
}

void draw(){
  vzNoise+=0.001;
  float px[] = new float [100];
  float py[] = new float [100];
  float inten[] = new float [100];
  float radio[] = new float [100];
  
  for(int i = 0; i<100; i++){
    Brillo3 b = brillos.get(i);
    b.mover();
    px[i]  = b.p.x;
    py[i] = b.p.y;
    inten[i] = b.inten;
    radio[i] = b.radio;
  }
  
  shader(shader);
  shader.set("t",millis()*1f);
  shader.set("res",width*1f,height*1f);
  shader.set("mouse",mouseX*1f/width, 1-mouseY*1f/height);
  shader.set("px",px);
  shader.set("py",py);
  shader.set("inten",inten);
  shader.set("radio",radio);
  rect(0,0,width,height);
}

void mousePressed(){
  for(Brillo3 b:brillos){
    b.asignaObj(new PVector(mouseX*1f/width, 1-mouseY*1f/height));
  }
}
