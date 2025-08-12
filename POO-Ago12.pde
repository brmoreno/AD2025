//VG
float x,y,t;
color c;
color f;
float dx;

void setup(){
  size(700,700);
  x = width/2;
  y = height/2; 
  t = 200;
  c = color(255,0,0);
  f = color(255);
  dx = 1;
  background(f);
}

void draw(){
  background(f);
  fill(c);
  noStroke();
  circle(x,y,t);
  x+= dx;
 
  if(x+t/2>=width){
    println("el circulo llegó al limite derecho");
    dx*= -1;
  } 
}
