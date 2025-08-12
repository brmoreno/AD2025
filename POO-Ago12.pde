//VG
float x,y,t;
color c;
color f;
float dx;
float dy;

float x2, y2, t2;
color c2;

float x3, y3, t3;
color c3;

void setup(){
  size(700,700);
  x = width/2;
  y = height/2; 
  t = 200;
  c = color(255,0,0);
  f = color(255);
  dx = 1;
  dy = 2;
  background(f);
  t2 = 200;
  c2 = color(random(255),random(255),random(255));
  
  x3 = width/2;
  y3 = height/2;
  t3 = 100;
  c3 = color(255,1,120);
}

void draw(){
  background(f);
  fill(c);
  noStroke();
  circle(x,y,t);
  x+= dx;
  y+= dy;
  if(x+t/2>=width){
    dx*= -1;
  }  
  if(x<=t/2){
    dx*= -1;
  }   
  if(y+t/2>=height){
    dy*= -1;
  }   
  if(y<t/2){
    dy*= -1;
  } 
  
  
  
  x2 = mouseX;
  y2 = mouseY;  
  if(mousePressed){
    c2 = color(random(255),random(255),random(255));
  }
  fill(c2);
  circle(x2, y2, t2);
  
  
  if(keyPressed){
    switch(key){
      case 'w':
        y3--;
      break;
      case 's':
        y3++;
      break;
      case 'a':
        x3--;
      break;
      case 'd':
        x3++;
      break;
    }
  }
  fill(c3);
  circle(x3,y3,t3);
  
}
