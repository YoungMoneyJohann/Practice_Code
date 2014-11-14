int count = 10;

float []x = new float[count];
float []y = new float[count];

float dx;
float dy;
float ax;
float ay;
float sz;

void setup() {
  size(500, 500);
  x[count-1] = width/2;
  y[count-1] = height/2;
  dx = .25;
  dy = 0;
  ax = 0;
  ay = .01;
  sz = count*2+10;
}

void draw() {
  background(255);

  for (int j = 0; j<count-1; j++) {
    x[j]=x[j+1];
    y[j]=y[j+1];
    dy+=ay;
    x[count-1]+=dx;
    y[count-1]+=dy;
  }

  for (int i = count-1; i>=0; i--) {
    fill(255-(20*i), 255, (20*i));
    ellipse(x[i], y[i], i*2+10, i*2+10);
  }

  if (y[count-1]+sz/2>height) {
    y[count-1]=height-sz/2;
    dy=-abs(dy);
  }
  if (x[count-1]-sz/2<0 || x[count-1]+sz/2>width) {
    dx*=-1;
  }
}

