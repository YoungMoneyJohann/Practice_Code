int count = 15;

float []x = new float[count];
float []y = new float[count];

PVector d;
PVector v;
PVector a;
float sz;
float f;

float theta;


void setup() {
  colorMode(HSB, 360, 100, 100, 100);
  size(500, 500);

  d=new PVector(0, height);

  v=new PVector(0, 0);

  a=new PVector(0, 0);

  x[count-1] = d.x;
  y[count-1] = d.y;

  sz=20;
  f=.8;
}

void draw() {
  background(360);

  theta=atan2(mouseY-height, mouseX-0);

  v.add(a);
  d.add(v);


  x[count-1] = d.x;
  y[count-1] = d.y;

  for (int j = 0; j<count-1; j++) {
    x[j]=x[j+1];
    y[j]=y[j+1];
  }

  fill(0);
  stroke(0);
  ellipse(d.x, d.y, sz, sz);

  for (int i = count-1; i>=0; i--) {
    fill(40-i*3, 360, 360, 10);
    noStroke();
    ellipse(x[i], y[i], i*2, i*2);
  }

  fill(0);
  
  translate(0, height);
  rotate(theta);
  rect(0, -25, 140, 50);
  

  if (d.x+sz/2>=width) {
    v.x=0;
    v.y=0;
    d.x=0;
    d.y=height;
  }
  //if (d.x-sz/2<=0) {
   // v.x=0;
  //  v.y=0;
   // d.x=0;
  //  d.y=height;
 // }
  if (d.y+sz/2>=height) {
    d.y=height-sz/2;
    v.y*=-1*f;
  }
  if (d.y-sz/2<=0) {
    d.y=sz/2;
    v.y*=-1*f;
  }
  fill(70);
  ellipse(0,0,100,100);
}

void mouseClicked() {
  a=new PVector(0, .09);
  v=new PVector((mouseX-d.x)/50, -(d.y-mouseY)/50);
}

