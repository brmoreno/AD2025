PShader shader;
PVector offset;
float amp;

void setup(){
  size(700,700,P2D);  
  shader = loadShader("miShader.glsl");    
  offset = new PVector(100,0);
  amp = 3;
}

void draw(){
  
  shader(shader);
  shader.set("t",millis()*1f);
  shader.set("res",width*1f,height*1f);
  shader.set("mouse",mouseX*1f/width, 1-mouseY*1f/height);
  shader.set("offset", offset.x,offset.y);
  shader.set("amp",amp);
  rect(0,0,width,height);
  
  if(keyPressed){
    if(key=='q'){
      offset.rotate(0.01);
    }
    if(key=='a'){
      offset.rotate(-0.01);
    }
    if(key == 'w'){
      offset.setMag(offset.mag()+2);
    }
    if(key == 's'){
      offset.setMag(offset.mag()-2);
    }
    
    if(key == 'e'){
      amp += 0.5;
    }
    if(key == 'd'){
      amp -=0.5;
    }
  }
}

