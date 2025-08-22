
float r;
float s;
void setup(){
  size(500,500);
  r = 0;
  s = 1;
}

void draw(){
  background(255);
  
  if(mousePressed){
    r+=0.1;
  }
  
  if(keyPressed){
    if(key == 'q'){
      s+=0.01;
    }
    if(key == 'w'){
      s-=0.01;
    }
  }
  gato(mouseX,mouseY,r,s);
  fill(255,0,0);
  ellipse(100,400,200,100);
  println(mouseX + " " + mouseY);
}

void gato(int x_, int y_, float r_, float s_){
  noStroke();
  pushMatrix();
  
  
   

  translate(x_,y_);
  rotate(r_);
  scale(s_);
  translate(-100,-100);
 
  fill(120);
  ellipse(100,85,120,100);
  triangle(57,16,51,55,92,46);
  triangle(135,19,150,61,113,46);
  fill(0);
  ellipse(100,100,20,10);
  circle(80,80,10);
  circle(120,80,10);
  fill(0);
  for(int i = 0 ; i<3; i++){
    rect(115,100 +i*5,30,2);
    rect(85,100 +i*5,-30,2);
  }
  popMatrix();
}
