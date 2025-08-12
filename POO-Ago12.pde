//VG
float x,y,t;
color c;
color f;

void setup(){
  size(700,700);
  x = width/2;
  y = height/2; 
  t = 200;
  c = color(255,0,0);
  f = color(255);
  background(f);
}

void draw(){
  background(f);
  fill(c);
  noStroke();
  circle(x,y,t);
  x = x+1;
  if(x==width){
    println("el circulo llegó al limite derecho");
    x= x-1;
  }
}
