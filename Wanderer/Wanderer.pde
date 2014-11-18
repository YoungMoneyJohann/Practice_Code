PVector d;

PVector v;

PVector a;

float sz;

boolean keys[] = new boolean[255];

void setup() {
  colorMode(HSB,360,100,100,100);
  background(0);
  size(500,500);
  
  d=new PVector(width/2,height/2);
  
  v=new PVector(0,0);

  a=new PVector(0,0);
  
  sz=20;
}

void draw() {
  
  updatePlayers();
  
  v.add(a);
  d.add(v);
  
  v.limit(3);
  fill(frameCount%360,100,100);
  stroke(frameCount%360,100,100);
  ellipse(d.x,d.y,sz,sz);
  
  if (d.x-sz/2>width) {
    d.x=-sz/2;
  }
  if (d.x+sz/2<0) {
    d.x=width+sz/2;
  }
  if (d.y-sz/2>height) {
    d.y=-sz/2;
  }
  if (d.y+sz/2<0) {
    d.y=height+sz/2;
  }
}

void keyPressed() {
  if (key==CODED) {
    keys[keyCode] = true;
  } else if (key!=CODED) {
    keys[key] = true;
  }
}

void keyReleased() {
  if (key==CODED) {
    keys[keyCode] = false;
  } else if (key!=CODED) {
    keys[key] = false;
  }
}

void updatePlayers() {

  //ARROW KEY INPUT
  if (keys[UP]) {
    a.y=-0.05;
  } 
  if (keys[DOWN]) {
    a.y=0.05;
  } 
  if (keys[LEFT]) {
    a.x=-0.05;
  } 
  if (keys[RIGHT]) {
    a.x=0.05;
  }

}

