class Enemigo{
  color c;
  float tam;
  float x,y;
  int comp; //0=estatico, 1= aleatorio, 2 constante

  Enemigo(float x_, float y_, float tam_, int comp_){
    x = x_;
    y = y_;
    tam = tam_;
    comp = comp_;
    float b = random(140);
    c = color(b,b,random(140,255));
  }
    
  void display(){
  }
  
  void mover(){
  }
}

class Item{
  color c;
  float tam;
  float x,y;
  
  Item(float x_, float y_){
    x = x_;
    y = y_;
    tam = 30;
    c = color(0,150,30);
  }
    
  void display(){
  }
}


class Player{
  float tam;
  color c;
  float x,y;
  float v;
  float a;
  
  Player(float v_){
    tam = 100;
    c = color(255,0,0);
    x = width/2;
    y = height/2;
    v = v_;
    a = PI+HALF_PI;
  }
  
  void display(){
    noStroke();
    fill(c);
    circle(x,y,tam);
  }
  
  void mover(){  
    float dx = cos(a)*v;
    float dy = sin(a)*v;
    x+=dx;
    y+=dy;
    
    if(keyPressed){
      if(key == 'a'){
        a-=0.05;
      }
      if(key == 'd'){
        a+=0.05;
      }
    }
    
    x = constrain(x,0+tam/2,width-tam/2);
    y = constrain(y,0+tam/2,height-tam/2);    
  }
  
  void captura(){
  }
  
  void colision(){
  }  
}

Player elPlayer;

void setup(){
  size(800,800);
  elPlayer = new Player(2);
}

void draw(){
  background(255);
  elPlayer.display();
  elPlayer.mover();
}
