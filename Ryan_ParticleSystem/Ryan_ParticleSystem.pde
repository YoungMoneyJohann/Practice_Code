import ddf.minim.spi.*;  //import minim for sound usage (I had to research this)
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim; //variables for sound
AudioPlayer sound;


ArrayList<Shell> shells = new ArrayList<Shell>(); //arraylists
ArrayList<Spark> sparks = new ArrayList<Spark>();

int Tail = 70; //the number of particles in the tail of sparks
int R, G, B; //color variables
float[] x = new float[Tail];
float[] y = new float[Tail];

int Particles; //# of sparks that come out each shell

PImage city;


void setup() {
  size(1024, 683);
  Particles = 10;
  city = loadImage("79932992.jpg");
  colorMode(HSB, 360, 100, 100, 100);
  minim = new Minim(this); //initialized sound
  sound = minim.loadFile("exp.mp3");
}

void draw() {
  background(city);
  R = int(random(0, 360));
  G = int(random(0, 360));
  B = int(random(0, 360));
  for (int i = shells.size ()-1; i>=0; i--) { //forLoop for shells
    Shell s = shells.get(i);
    s.draw();
    s.move();
    if (s.vel.y < 0.5 && s.vel.y > -.05) { //when velocity is in between this range, the shell reaches the approximate maximum of its y-displacement and should explode 
      for (int k = 0; k < Particles; k++) { //forLoop that creates sparks and removes shells
        float dx = random(-10, 10); // floats that give random directions to the sparks
        float dy = random(-10, 10);
        sparks.add(new Spark(s.loc.x, s.loc.y, dx, dy, -dx*.04, -dy*.04, 5)); //new spark added
      }
      shells.remove(i);
    }
  }
  for (int j = sparks.size ()-1; j>=0; j--) { //forLoop for sparks
    Spark e = sparks.get(j);
    e.draw();
    e.move(); 
    if (e.vel.mag() < 1) { //same reasoning as seen above in line 43
      sparks.remove(j);
      if (j==0) {
        sound = minim.loadFile("exp.mp3"); //sound reloads after all sparks disappear
      }
    }
  }
}

void mousePressed() { //shell is added with every click
  shells.add(new Shell());
}

