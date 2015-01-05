class Spark { //Spark class
  PVector loc, vel, acc;
  float sz;
  Spark(float x_, float y_, float vx_, float vy_, //constructor
  float ax_, float ay_, float sz_) {
    loc = new PVector(x_, y_);
    vel = new PVector(vx_, vy_);
    acc = new PVector(ax_, ay_);
    sz = sz_;
  }

  Spark() { //default constructor
    loc = new PVector(0, 0);
    vel = new PVector(random(-8, 8), random(-8, 8));
    acc = new PVector(random(-.08, .08), random(-.08, .08));
    sz = 1;
  }

  void draw() {
    sound.play(); //sound starts at the beginning of each explosion
    x[Tail-1]= loc.x; //so the tail particles follow the sparks
    y[Tail-1]= loc.y;
    stroke(R, B, G, 10);
    fill(R, B, G, 10);
    ellipse(loc.x, loc.y, sz, sz);
    for (int i = 0; i<Tail-1; i++) { //ForLoop that creates "Tail"
      x[i]=x[i+1];
      y[i]=y[i+1];
    }  
    for (int i = Tail-1; i>=0; i--) { //ForLoop that changes the size of "Tail"
      ellipse(x[i], y[i], .125*i, .125*i);
    }
    stroke(0);
    fill(0);
  }

  void move() {
    vel.add(acc);
    loc.add(vel);
  }
} 

