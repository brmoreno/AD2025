int vx = 0;

void setup(){
  size(600,600);
}

void draw(){
  loadPixels();
for(int i = 0;i<pixels.length; i++){
  pixels[i] = color(255,0,0);
}
  updatePixels();

  miRect(vx,200,100,200,color(0,255,0));
  miRect(300,mouseY,100,200,color(14,255,180));
  vx+=2;
}

void miRect(int px_, int py_, int w_, int h_,color c_){
  loadPixels();
  for(int j = 0; j<h_; j++){
    int pin = px_+(py_+j)*width;
    for(int i = pin; i< pin +w_; i++){
      pixels[i] = c_;
    }
  }  
  updatePixels();
}

void mousePressed(){
  int argb  = pixels[mouseX+mouseY*width];
  int a = argb >> 24 & 0xFF;
  int r = argb >> 16 & 0xFF;
  int g = argb >> 8 & 0xFF;
  int b = argb & 0xFF;
  println(a + " " + r + " " + g +" " + b);
}



