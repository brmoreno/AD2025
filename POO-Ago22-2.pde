float x[] = new float[100];
float y[] = new float[100];
float t[] = new float[100];
int n[] = new int[100];
color c[] = new color[100];
color c2[] = new color[100];
float dx[] = new float[100];
float dy[] = new float[100];

void setup(){
  size(800,800);
  for(int i = 0; i<100; i++){
    x[i] = random(800);
    y[i] = random(800);
    t[i] = random(50,200);
    c[i] = color(random(255),random(255),random(255));
    c2[i] = color(random(255),random(255),random(255));
    n[i] = round(random(4,10));
    dx[i] = random(-1,1);
    dy[i] = random(-1,1);
  } 
}

void draw(){
  background(255);
  noStroke();
  for(int i = 0; i<100; i++){
    
    circuloConcentrico(x[i],y[i],t[i],n[i],c[i],c2[i]);
    x[i]+=dx[i];
    y[i]+=dy[i];
    
    if(x[i]<0 || x[i]>800){
      dx[i] *= -1;
    }
    if(y[i]<0 || y[i]>800){
      dy[i] *= -1;
    }
  }
}


void circuloConcentrico(float x_, float y_, float t_, int n_, color uno_, color dos_){
  for(int i = 0; i<n_; i++){
    fill(uno_);
    if(i%2 == 0){
     fill(dos_);
    }
    circle(x_,y_,t_-i*(t_/n_));
  }
}


