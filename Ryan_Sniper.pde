float x = int(random(100, 900));
float y = int(random(100, 400));
int r = int(random(0, 255));
int b = int(random(0, 255));
int g = int(random(0, 255));

int wxb;
int wyb;
int dxb;
int dyb;

float distx;
float disty;

float wx = int(random(-wxb, wxb+1))*10;
float wy = int(random(-wyb, wyb+1))*10;
float dx = int(random(-dxb, dxb+1))*.2;
float dy = int(random(-dyb, dyb+1))*.05;

int kc = 0;
int sc = 0;

boolean easy = false;
boolean medium = true;
boolean hard = false;
boolean challenging = false;

int kp = 0;

String wind;
String windx;
String windy;

String KillCount;
String ShotCount;

String Score;
String Difficulty;

String DistanceX;
String DistanceY;

int f;

String Timer;

void setup() {
  size(1000, 500);
}

void draw() {

  background(0);
  noCursor();


  fill(255);
  stroke(255);
  ellipse(mouseX, mouseY, 200, 200);

  if (mousePressed==true && mouseX>250 && mouseX<330
    && mouseY>9 && mouseY<29) {
    easy = true;
    medium = false;
    hard = false;
    challenging = false;
    sc--;
    wx = int(random(-wxb, wxb+1))*10;
    wy = int(random(-wyb, wyb+1))*10;
    dx = int(random(-dxb, dxb+1))*.2;
    dy = int(random(-dyb, dyb+1))*.05;
  }

  if (mousePressed==true && mouseX>350 && mouseX<430
    && mouseY>9 && mouseY<29) {
    easy = false;
    medium = true;
    hard = false;
    challenging = false;
    sc--;
    wx = int(random(-wxb, wxb+1))*10;
    wy = int(random(-wyb, wyb+1))*10;
    dx = int(random(-dxb, dxb+1))*.2;
    dy = int(random(-dyb, dyb+1))*.05;
  }

  if (mousePressed==true && mouseX>450 && mouseX<530
    && mouseY>9 && mouseY<29) {
    easy = false;
    medium = false;
    hard = true;
    challenging = false;
    sc--;
    wx = int(random(-wxb, wxb+1))*10;
    wy = int(random(-wyb, wyb+1))*10;
    dx = int(random(-dxb, dxb+1))*.2;
    dy = int(random(-dyb, dyb+1))*.05;
  }

  if (mousePressed==true && mouseX>550 && mouseX<670
    && mouseY>9 && mouseY<29) {
    easy = false;
    medium = false;
    hard = false;
    challenging = true;
    sc--;
    wx = int(random(-wxb, wxb+1))*10;
    wy = int(random(-wyb, wyb+1))*10;
    dx = int(random(-dxb, dxb+1))*.2;
    dy = int(random(-dyb, dyb+1))*.05;
  }

  if (mousePressed==true && mouseX>820 && mouseX<900
    && mouseY>85 && mouseY<105) {
    sc=-1;
    kc=0;
    kp=0;
  }

  if (challenging == true) {
    Difficulty = "Difficulty: Challenging";
    wxb=3;
    wyb=3;
    dxb=10;
    dyb=5;
  }
  if (easy == true) {
    Difficulty = "Difficulty: Easy";
    wx=0;
    wy=0;
    dx=0;
    dy=0;
  }
  if (medium == true) {
    Difficulty = "Difficulty: Medium";
    wxb=2;
    wy=0;
    dy=0;
    dxb=5;
  }
  if (hard == true) {
    Difficulty = "Difficulty: Hard";
    wxb=2;
    wyb=2;
    dxb=7;
    dyb=2;
  }


  if (dist(mouseX, mouseY, x, y)<95) {
    fill(r, b, g);
    stroke(0);
  } else if (dist(mouseX, mouseY, x, y)>95) {
    fill(0);
    stroke(0);
  }


  ellipse(x, y, 10, 10);
  x=x+dx;
  y=y+dy;
  if (x>=width-100 || x<100) {
    dx*=-1;
  }
  if (y>=height-100 || y<100) {
    dy*=-1;
  }
  if (mousePressed==true && dist(mouseX, mouseY, 
  x+wx*2, y-wy*2)<5) {


    fill(r, b, g);
    stroke(0);
    ellipse(x, y, 12, 12);
    line(x, y+5, x, y+15);
    line(x, y+15, x-3, y+20);
    line(x, y+15, x+3, y+20);
    line(x, y+8, x-3, y+10);
    line(x, y+8, x+3, y+10);

    stroke(255, 0, 0);

    fill(255, 0, 0);
    ellipse(x, y, 14, 14);
    ellipse(x-10, y-12, 5, 5);
    ellipse(x+8, y+6, 4, 4);
    ellipse(x+9, y-7, 4, 4);
    fill(0);
    stroke(0);

    kc++;

    if (easy == true) {
      kp=kp+11;
    } else if (medium == true) {
      kp=kp+21;
    } else if (hard == true) {
      kp=kp+31;
    } else if (challenging == true) {
      kp=kp+51;
    }

    x = int(random(100, 900));
    y = int(random(100, 400));
    r = int(random(0, 255));
    b = int(random(0, 255));
    g = int(random(0, 255));
    wx = int(random(-wxb, wxb+1))*10;
    wy = int(random(-wyb, wyb+1))*10;
    dx = int(random(-dxb, dxb+1))*.2;
    dy = int(random(-dyb, dyb+1))*.05;
  }

  if (mousePressed==true) {
    sc++;
  }

  fill(0, 255, 0);
  rect(250, 9, 80, 20);
  fill(0);
  textSize(16);
  text("Easy", 272, 9, 80, 20);

  fill(0, 255, 0);
  rect(350, 9, 80, 20);
  fill(0);
  textSize(16);
  text("Medium", 360, 9, 80, 20);

  fill(0, 255, 0);
  rect(450, 9, 80, 20);
  fill(0);
  textSize(16);
  text("Hard", 470, 9, 80, 20);

  fill(0, 255, 0);
  rect(550, 9, 120, 20);
  fill(0);
  textSize(16);
  text("Challenging", 564, 9, 100, 20);

  fill(255, 255, 0);
  rect(820, 85, 80, 20);
  fill(0);
  textSize(16);
  text("Reset", 840, 85, 100, 20);

  noFill();
  stroke(255, 0, 0);
  ellipse(mouseX, mouseY, 200, 200);

  stroke(255, 0, 0);

  line(mouseX, mouseY-100, mouseX, mouseY+100);
  line(mouseX-100, mouseY, mouseX+100, mouseY);

  for (int i = -60; i < 80; i+=20)
    line(mouseX + i, mouseY - 7, mouseX + i, mouseY + 7);

  for (int i = -60; i < 80; i+=20)
    line(mouseX -7, mouseY + i, mouseX + 7, mouseY + i);

  textSize(10);
  text("10", mouseX -7, mouseY - 25, 20, 20);
  text("20", mouseX -7, mouseY - 45, 20, 20);
  //text("30", mouseX -7, mouseY - 65, 20,20);
  text("10", mouseX -7, mouseY + 15, 20, 20);
  text("20", mouseX -7, mouseY + 35, 20, 20);
  //text("30", mouseX -7, mouseY + 55, 20,20);

  text("10", mouseX -25, mouseY - 7, 20, 20);
  text("20", mouseX -45, mouseY - 7, 20, 20);
  //text("30", mouseX -65, mouseY - 7, 20,20);
  text("10", mouseX +15, mouseY - 7, 20, 20);
  text("20", mouseX +35, mouseY - 7, 20, 20);
  //text("30", mouseX +55, mouseY - 7, 20,20);

  textSize(16);
  text("N", mouseX -6, mouseY - 90, 20, 20);
  text("S", mouseX -4, mouseY + 70, 20, 20);
  text("W", mouseX -85, mouseY - 9, 20, 20);
  text("E", mouseX +75, mouseY - 9, 20, 20);

  distx = dist(x,0,mouseX,0);
  disty = dist(0,y,0,mouseY);
  DistanceX = str(distx);
  DistanceY = str(disty);
  fill(0);
  textSize(8);
  text(DistanceX, mouseX -60, mouseY - 75, 40, 20);
  text(DistanceY, mouseX -60, mouseY - 65, 40, 20);
  noFill();

  stroke(0);
  line(x, y+5, x, y+15);
  line(x, y+15, x-3, y+20);
  line(x, y+15, x+3, y+20);
  line(x, y+8, x-3, y+10);
  line(x, y+8, x+3, y+10);


  if (wx<0) {
    windx=str(abs(wx))+" mph East";
  }
  if (wx>0) {
    windx=str(abs(wx))+" mph West";
  }
  if (wx==0 && wy!=0) {
    windx=str(abs(wx))+" mph";
  }
  if (wy<0) {
    windy=str(abs(wy))+" mph North";
  }
  if (wy>0) {
    windy=str(abs(wy))+" mph South";
  }
  if (wy==0 && wx!=0) {
    windy=str(abs(wy))+" mph";
  }



  if (wx==0 && wy==0) {
    wind = "Wind Speed: 0.0 mph";
  } else if (wx!=0 && wy==0) {
    wind = "Wind Speed: " + windx;
  } else if (wx==0 && wy!=0) {
    wind = "Wind Speed: " + windy;
  } else {
    wind = "Wind Speed: " + windx + " and " + windy;
  }

  KillCount = "Kill Count: " + str(kc);
  ShotCount = "Shot Count: " + str(sc);

  Score = "Score: "+str(kp-sc);


  fill(0, 255, 0);
  textSize(12);
  text(wind, 10, 10, 200, 120);
  text(KillCount, 10, 70, 500, 180);
  text(ShotCount, 10, 100, 500, 210);
  text(Score, 810, 10, 1000, 120);
  text(Difficulty, 810, 40, 1000, 150);

  if (mousePressed==true) {
    f=frameCount; 
    if (f>2) {
      mousePressed=false;
      frameCount=0;
    }
  }
}
