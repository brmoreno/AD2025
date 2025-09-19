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
  
  boolean captura( Item i_){
    boolean resultado = false;
    float dist = dist(this.x,this.y,i_.x, i_.y);
    float sumaRadios = this.tam/2 + i_.tam/2;
    if(dist < sumaRadios){
      resultado = true;
    }
    return resultado;
  }     
}


class Nivel{
  
  Player elPlayer;
  Item elItem;
  Enemigo uno;
  Enemigo dos;
  Enemigo tres;
  
  int estado; //0=sigo jugando, 1=gané, 2 = perdí 
  
  Nivel(float v_, float x_, float y_, Enemigo uno_){
    elPlayer = new Player(v_);
    elItem = new Item(x_,y_);  
    uno = uno_;
  }
  
  Nivel(float v_, float x_, float y_, Enemigo uno_, Enemigo dos_){
    elPlayer = new Player(v_);
    elItem = new Item(x_,y_);  
    uno = uno_;
    dos = dos_;
  }
  
  Nivel(float v_, float x_, float y_, Enemigo uno_, Enemigo dos_, Enemigo tres_){
    elPlayer = new Player(v_);
    elItem = new Item(x_,y_);  
    uno = uno_;
    dos = dos_;
    tres = tres_;
  }
  
  void funcion(){
    background(255);
    elPlayer.display();
    elPlayer.mover();
    elItem.display();
    if(elPlayer.captura(elItem)){
      estado =1;
    }
    FunEnemigos(uno);
    FunEnemigos(dos);
    FunEnemigos(tres);
  }
  
  
  void FunEnemigos(Enemigo e_){
    if(e_ != null){
      e_.display();
      e_.mover();    
      if(elPlayer.colision(e_)){
        estado = 2;
      }
    }  
    
   
    
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
  float dx;
  float dy;
  
  Enemigo(float x_, float y_, float tam_, int comp_){
    x = x_;
    y = y_;
    tam = tam_;
    comp = comp_;
    float b = random(140);
    c = color(b,b,random(140,255));
    dx = random(-2,2);
    dy = random(-2,2);
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
    x+=dx;
    y+=dy;
    if(x>width-tam/2){
      dx*=-1;
    }
    if(x<tam/2){
      dx*=-1;
    }
    if(y>height-tam/2){
      dy*=-1;
    }
    if(y<tam/2){
      dy*=-1;
    }
  }
}

Nivel elNivel;

void setup(){
  size(800,800);
  Enemigo uno = new Enemigo(700,700,150,2);
  Enemigo dos = new Enemigo(100,700,150,2);
  Enemigo tres = new Enemigo(700,100,150,2);
  elNivel = new Nivel(2,100,100,uno,dos,tres);
  
}

void draw(){
  elNivel.funcion();
  println(elNivel.estado);
}

