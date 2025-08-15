float dx;
float dz;
void setup(){
  size(700,700);
}

void draw(){
  dx+=0.01;
  dz+= 0.01;
  noStroke();
  for(int j = 0; j<height; j+= 10){
    for(int i = 0; i<700; i+=10){
      float r = noise(dx+i*0.005,j*0.005,dz)*300;
      float g = noise(6+i*0.005,8+j*0.005+dx,3+dz)*300;
      float b = noise(10+i*0.005,12+j*0.005,6+ dz)*300;
      fill(r,g,b);
      rect(i,j,10,10);
    }
  }
}
