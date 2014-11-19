int count = 13;

float []x = new float[count];
float []y = new float[count];

PVector d;
PVector v;
PVector a;
float sz;


void setup() {
  colorMode(HSB, 360, 100, 100, 100);
  size(500, 500);

  d=new PVector(width/20, 19*height/20);

  v=new PVector(0, 0);

  a=new PVector(0, 0);

  x[count-1] = d.x;
  y[count-1] = d.y;

  sz=20;
}

void draw() {
  background(0);

  v.add(a);
  d.add(v);


  x[count-1] = d.x;
  y[count-1] = d.y;

  for (int j = 0; j<count-1; j++) {
    x[j]=x[j+1];
    y[j]=y[j+1];
  }

  for (int i = count-1; i>=0; i--) {
    fill(255, 0, 0);
    ellipse(x[i], y[i], i*2, i*2);
    noFill();
  }

  fill(frameCount%360, 100, 100);
  stroke(frameCount%360, 100, 100);
  ellipse(d.x, d.y, sz, sz);

  if (d.x+sz/2>=width) {
    v.x*=-1;
  }
  if (d.x-sz/2<=0) {
    v.x*=-1;
  }
  if (d.y+sz/2>=height) {
    d.y=height-sz/2;
    v.y*=-1;
  }
  if (d.y-sz/2<=0) {
    d.y=sz/2;
    v.y*=-1;
  }
}

void mousePressed() {
  a=new PVector(0, .03);
  v=new PVector((mouseX-d.x)/70,-(d.y-mouseY)/70);
}
