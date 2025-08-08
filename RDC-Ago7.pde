class Rect{
  float x, y;
  int w, h;
  color c;
  float dx, dy;

  Rect(float x_, float y_, int w_, int h_){
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    c = color(random(255),random(255),random(255));
    dx = random(-1,1);
    dy = random(-1,1);
  }
  
  Rect(){
    x = random(width);
    y = random(height);
    w = floor(random(100,200));
    h = w;
    c = color(random(100),random(100),random(100));
    dx = random(-1,1);
    dy = random(-1,1);
  }
  
  void display(){
    miRect(round(x),round(y),w,h,c);
  }
  
  void mover(){
    x+=dx;
    y+=dy;
  }
  
  
  void miRect(int px_, int py_, int w_, int h_,color c_){
  loadPixels();
  float cx =px_+w_/2;
  float cy = py_+h_/2;
  float r = w_/2;
  for(int j = py_>0? py_:0; j<py_+h_ && j<height; j++){  
    for(int i = px_ >0?px_:0 ; i< px_ +w_ && i<width; i++){
      float dist = dist(cx,cy,i,j);
      if(dist<r){
      int colorActual = pixels[i + j*width];
      int rA = colorActual >> 16 & 0xFF;
      int gA = colorActual >> 8 & 0xFF;
      int bA = colorActual & 0xFF;
      
      int rB = c_ >> 16 & 0xFF;
      int gB = c_ >> 8 & 0xFF;
      int bB = c_ & 0xFF;
      float inten = map(dist,0,r,1,0);
      pixels[i + j*width] = color(rA+rB*inten,gA+gB*inten,bA+bB*inten);
      }
    }
  }  
  updatePixels();
}
}


Rect uno;
ArrayList <Rect> rects; 
int vx = 0;
void setup(){
  size(600,600);
  uno = new Rect(200,200,100,100);
  rects = new ArrayList<Rect>();
  for(int i = 0; i<300; i++){
    rects.add(new Rect());
  }
}

void draw(){
  loadPixels();
for(int i = 0;i<pixels.length; i++){
  pixels[i] = color(0);
}
  updatePixels();
  uno.display();
  uno.mover();
  for(Rect r:rects){
    r.display();
    r.mover();
  }
  println(frameRate);
}

void miRect(int px_, int py_, int w_, int h_,color c_){
  loadPixels();
 
  for(int j = py_>0? py_:0; j<py_+h_ && j<height; j++){  
    for(int i = px_ >0?px_:0 ; i< px_ +w_ && i<width; i++){
      pixels[i + j*width] = c_;
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


