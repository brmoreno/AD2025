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
  
  boolean colision( Enemigo e_ ){
    boolean resultado = false;
    float distancia = dist(this.x,this.y, e_.x, e_.y);
    float sumaRadios = tam/2 + e_.tam/2;
    if(distancia <sumaRadios){
      resultado = true;
    }
    return resultado;
  }
  
  void captura(){
    //TODO
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
    noStroke();
    fill(c);
    circle(x,y,tam);
  }  
}


class Enemigo{
  color c;
  float tam;
  float x,y;
  int comp; //0=estatico, 1= aleatorio, 2=constante

  Enemigo(float x_, float y_, float tam_, int comp_){
    x = x_;
    y = y_;
    tam = tam_;
    comp = comp_;
    float b = random(140);
    c = color(b,b,random(140,255));
  } 
  
  void display(){
    noStroke();
    fill(c);
    circle(x,y,tam);
  }
  
  void mover(){
    switch(comp){
      case 0:
        estatico();
      break;
      case 1:
        aleatorio();
      break;
      case 2:
        constante();
      break;
    }
  } 
  
  void estatico(){
  }
  
  void aleatorio(){
    x+=random(-2,2);
    y+=random(-2,2);
  }
  
  void constante(){
    //TODO
  }
}


Player elPlayer;

Enemigo uno;
Enemigo dos;

void setup(){
  size(800,800);
  elPlayer = new Player(2);
  uno = new Enemigo(100,100,150,0);
  dos = new Enemigo(700,700,200,1);
}

void draw(){
  background(255);
  elPlayer.display();
  elPlayer.mover();
  
  if(elPlayer.colision(uno)){
    println("colision con Enemigo uno");
  }
  else if(elPlayer.colision(dos)){
    println("colision con Enemigo dos");
  }
  else{
    println(" ");
  }
  
  uno.display();
  dos.display();
  uno.mover();
  dos.mover();
}
