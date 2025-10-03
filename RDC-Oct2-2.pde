import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;
ArrayList<Boundary> boundaries;
ArrayList<Box> boxes;
PShader shader;

void setup() {
  size(600,600,P2D);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -10);
  boxes = new ArrayList<Box>();
  boundaries = new ArrayList<Boundary>();
  boundaries.add(new Boundary(width/4,height-5,width/2-50,10));
  boundaries.add(new Boundary(3*width/4,height-50,width/2-50,10));
  shader = loadShader("miShader.glsl");
}

void draw() {
  background(255); 
  box2d.step();
  if (random(1) < 0.2 && mousePressed && boxes.size()<50) {
    Box p = new Box(mouseX,mouseY);
    boxes.add(p);
  }
  for (Boundary wall: boundaries) {
    wall.display();
  }
  

  // Display all the boxes
  float px[] = new float [50];
  float py[] = new float [50];
  float rota[] = new float [50];
  float w[] = new float [50];
  float h[] = new float [50];
  float r1[] = new float[50];
  float g1[] = new float[50];
  float b1[] = new float[50];
  float r2[] = new float[50];
  float g2[] = new float[50];
  float b2[] = new float[50];
  shader(shader);
  shader.set("res",width*1f,height*1f);
  shader.set("t",millis()*1f);
  for (int i = 0; i<boxes.size();i++) {
    Box b = boxes.get(i);
    Vec2 pos = box2d.getBodyPixelCoord(b.body);
    px[i] = pos.x*1f/width;
    py[i]= 1-pos.y*1f/height;
    rota[i] = b.body.getAngle();
    w[i] = b.w*0.5/width;
    h[i] = b.h*0.5/height;
    r1[i] = b.r1;
    g1[i] = b.g1;
    b1[i] = b.b1;
    r2[i] = b.r2;
    g2[i] = b.g2;
    b2[i] = b.b2;
  }
  shader.set("px",px);
  shader.set("py",py);
  shader.set("rota",rota);
  shader.set("w",w);
  shader.set("h",h);
  shader.set("r1",r1);
  shader.set("g1",g1);
  shader.set("b1",b1);
  shader.set("r2",r2);
  shader.set("g2",g2);
  shader.set("b2",b2);
  rectMode(CORNER);
  rect(0,0,width,height);
  
}

void keyPressed(){
  if(key == 'a'){
    box2d.setGravity(0, -10);
  }
  if(key == 's'){
    box2d.setGravity(0, 0);
  }
  if(key == 'd'){
    box2d.setGravity(0, 10);
  }
}

class Boundary {
  float x;
  float y;
  float w;
  float h;
  Body b;

  Boundary(float x_,float y_, float w_, float h_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;

    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    sd.setAsBox(box2dW, box2dH);
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    b = box2d.createBody(bd);
    b.createFixture(sd,1);
  }

  void display() {
    fill(0);
    stroke(0);
    rectMode(CENTER);
    rect(x,y,w,h);
  }
}

class Box {

  Body body;
  float w;
  float h;
  float r1,g1,b1,r2,g2,b2;

  Box(float x, float y) {
    w = random(40,80);
    h = random(40,80);
    makeBody(new Vec2(x, y), w, h);
    r1 = random(1);
    g1 = random(1);
    b1 = random(1);
    r2 = random(1);
    g2 = random(1);
    b2 = random(1);
  }

  void killBody() {
    box2d.destroyBody(body);
  }

  boolean done() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    if (pos.y > height+w*h) {
      killBody();
      return true;
    }
    return false;
  }

  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    rectMode(CENTER);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    fill(175);
    stroke(0);
    rect(0, 0, w, h);
    popMatrix();
  }

  void makeBody(Vec2 center, float w_, float h_) {
    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w_/2);
    float box2dH = box2d.scalarPixelsToWorld(h_/2);
    sd.setAsBox(box2dW, box2dH);
    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.4;
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(center));
    body = box2d.createBody(bd);
    body.createFixture(fd);
    body.setLinearVelocity(new Vec2(random(-5, 5), 0));
    body.setAngularVelocity(0);
  }
}

