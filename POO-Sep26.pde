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

class Nivel{ 
  Player elPlayer;
  Item elItem;
  ArrayList <Enemigo> enemigos;  
  int estado; //0=sigo jugando, 1=gané, 2 = perdí 
  
  Nivel(float v_, float x_, float y_, ArrayList <Enemigo> enemigos_){
    elPlayer = new Player(v_);
    elItem = new Item(x_,y_);  
    enemigos = enemigos_;
  }

  
  void funcion(){
    background(255);
    elPlayer.display();
    elPlayer.mover();
    elItem.display();
    if(elPlayer.captura(elItem)){
      estado =1;
    }
    for(Enemigo e:enemigos){
      FunEnemigos(e);
    }
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



class Juego{
  //aributos
  int estado; //0: inicio, 1 Juego, 2 Gané, 3 Perdí,4 terminé, 5 Gameover
  int nivel;
  int vidas;
  Nivel n;
  
  //constructor
  
  Juego(){
    estado = 0;
    nivel = 1;
    vidas = 3;
    ArrayList <Enemigo> enemigos = new ArrayList <Enemigo> ();
    enemigos.add(new Enemigo(700,700,200,0));
    n = new Nivel(2,100,100,enemigos);
  }
  
  //métodos
  void display(){
    switch(estado){
      case 0:
        background(255);
      break;
      case 1:
        n.funcion();
        if(n.estado == 1){
          estado = 2;
        }
        if(n.estado == 2){
          estado = 3;
        }
      break;
      case 2:
        background(0,255,0);
      break;
      case 3:
        background(255,0,0);
      break;
      case 4:
        background(0,0,255);
      break;
      case 5:
        background(0);
      break;
    }
  }
  
  void enKeyPressed(){
    switch(estado){
      case 0:
        if(key == 'n'){
          estado = 1;
        }
      break;
      case 1:
      break;
      case 2:
        if(key == 'n'){
          nivel ++;
          if(nivel == 5){
            estado = 4;
          }
          else{
          generarNivel();
          estado = 1;
          }
        }
      break;
      case 3:
       if(key == 'n'){
         vidas --;
         if(vidas < 0){
           estado = 5;
         }
         else{
           generarNivel();
           estado = 1;
         }
       }
      break;
      case 4:
       if(key == 'n'){
         estado = 0;
        nivel = 1;
        vidas = 3;
        generarNivel();
       }
      break;
      case 5:
      if(key == 'n'){
         estado = 0;
        nivel = 1;
        vidas = 3;
        generarNivel();
       }
      break;
    }    
  }
  
  void generarNivel(){
    ArrayList <Enemigo> enemigos = new ArrayList <Enemigo> ();
    enemigos.add(new Enemigo(700,700,200,0));
    n = new Nivel(2,100,100,enemigos);
    switch(nivel){
      case 2:
        enemigos.add(new Enemigo(100,700,200,1));
        n = new Nivel(2,100,100,enemigos);
      break;
      case 3:
        enemigos.add(new Enemigo(100,700,200,1));
        enemigos.add(new Enemigo(700,100,200,2));
        n = new Nivel(2,100,100,enemigos);
      break;
      case 4:
        enemigos.add(new Enemigo(100,700,200,2));
        enemigos.add(new Enemigo(700,100,200,2));
        enemigos.add(new Enemigo(700,400,200,2));
        n = new Nivel(2,100,100,enemigos);
      break;
      
    }
  }
  
}


Juego j;

void setup(){
  size(800,800);
  j = new Juego();
}

void draw(){
  j.display();
}

void keyPressed(){
  j.enKeyPressed();
}
