size(700,700);
background(255);
noStroke();
fill(255,0,0);
for(int i=0; i<700; i++){
  fill(i*0.3,255-i*0.2,i%255);
  rect(i,width/2+sin(i*0.04)*200,5,10+i*0.5);
}
