class Shell { // Shell class
  PVector loc, vel, acc;
  float sz;
  PImage shell;
  Shell(float x_, float y_, float vx_, float vy_, //constructor
  float ax_, float ay_, float sz_) {
    loc = new PVector(x_, y_);
    vel = new PVector(vx_, vy_);
    acc = new PVector(ax_, ay_);
    sz = sz_;
    shell = loadImage("Firework.png");
  }

  Shell() { // default constructor 
    loc = new PVector(width/2, height);
    vel = new PVector(0, -random(5.2, 7.2));
    acc = new PVector(random(-50, 50)*.03, .04);
    sz = 5;
    shell = loadImage("Firework.png");
  }

  void draw() {
    float theta = atan2(vel.y,vel.x); //angle change based on velocity
    fill(50);
    if (loc.y<480) { //so the shells appear to be coming from behind the buildings
      shell.resize(0, 20);
      pushMatrix(); //rotation coding so the shell can tilt appropriatly
      translate(loc.x, loc.y);
      rotate(PI/6.0+theta+PI/2.0);
      image(shell, -(shell.width)/2, -(shell.height)/2);
      popMatrix();
    }
  }

  void move() {
    vel.x = constrain(vel.x, -.25, .25); //limit on x component velocity and acceleration
    vel.add(acc);
    loc.add(vel);
  }
}

