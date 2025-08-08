//variables Globales
color fondo;
color relleno;
float x;
int y;
int t;
float ct;
float dt;
float r;
float cr;
float dr;

float g;
float cg;
float dg;

float b;
float cb;
float db;

void setup(){
  size(700,700);
  fondo = color(random(255),random(255),random(255));
  relleno = color(random(255),random(255),random(255));
  x = 350;
  y = 350;
  t = 700;
  ct= 0;
  dt = 0.1;
  background(255);
  r= 255;
  cr = 0;
  dr+= 0.02;
  g = 90;
  cg = 3;
  dg = 0.013;
  b = 255;
  cb = 5;
  db = 0.16;
}


void draw(){
  ct+=dt;
  cr += dr;
  cg += dg;
  cb += db;
  noStroke();
  fill(r*sin(cr),g*sin(cg),b*sin(cb));
  ellipse(x,y,30,t*sin(ct));
  x+=1;
  x %= 700;
  //y+=1;
}
