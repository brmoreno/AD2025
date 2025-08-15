float x[] = new float[500];
float y[] = new float[500];
float t[] = new float[500];
color c[] = new color[500];
float dx[] = new float[500];
float dy[] = new float[500];


void setup() {
  size(700, 700);
  background(255);
  for(int i = 0; i<500;i ++){
    x[i] = random(width);
    y[i] = random(width);
    t[i] = random(50,100);
    c[i] = color(random(255),random(255),random(255));
    dx[i] = random(-1,1);
    dy[i] = random(-1,1);
  }
}

void draw() {
  noStroke();
  background(255);
  for (int i = 0; i <500; i++) {
    x[i] += dx[i];
    y[i] += dy[i];
    fill(c[i]);
    circle(x[i],y[i],t[i]);
  }
}
