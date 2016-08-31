import processing.serial.*;

Quadra squash;

float x = 150;
float y = 150;
float speedX;
float speedY;
int diam = 20;
int rectSize = 150;
Serial myPort;
String val;
float valor;

Joystick joy;
Bolinha ball;
Raquete raq;


void setup() {
  println(Serial.list());
  myPort = new Serial(this, Serial.list()[0], 9600); // biblioteca serial, método list (check documents)
  squash = new Quadra ();
  raq = new Raquete ();
  ball = new Bolinha ();
  joy = new Joystick ();
  
}


void draw() {
  if (x > width)
  {
    squash.resetgame();
  }
  squash.mostra ();
  joy.potread();
  
}



class Quadra {

  Quadra () {
    size(500, 500);
    ball.initMove();
  }
  void mostra () {
    background(0);
    raq.move();
    ball.move();
  }

  void resetgame () {
    // resets things if you lose
    x = 150;
    y = 150;
    speedX = random(3, 5);
    speedY = random(3, 5);
    rectSize = 150;
  }
}




class Bolinha {

  Bolinha () {
    fill(255);
    noStroke();
    ellipseMode(CENTER);
    
  }

  void initMove()
  {
    speedX = random(3, 5);
    speedY = random(3, 5);
  }
  
  void move () {
    x = x + speedX;
    y = y + speedY;
ellipse(x, y, diam, diam);
    // if ball hits movable bar, invert X direction and apply effects
    if ( x > width - 30 - diam/2 && x < width -20 + diam/2 && y > valor-rectSize/2 && y < valor+rectSize/2 ) {
      speedX = speedX * -1;
      x = x + speedX;
    }

    // if ball hits wall, change direction of X
    else if (x < 0 + diam/2) {
      speedX = speedX * -1.1;
      x = x + speedX;
    }

    // if ball hits up or down, change direction of Y  
    if ( y > height - diam/2 || y < 0 + diam/2 ) {
      speedY = speedY * -1;
      y = y + speedY;
    }
  }
}

class Raquete {

  Raquete () {
  }

  void move () {
    rect(width-30, valor-rectSize/2, 10, rectSize);
  }
}

class Joystick {
  Joystick () {
  }
  void potread () {
    if ( myPort.available() > 0) {                // If data is available,
      val = myPort.readStringUntil('\n');         // read it and store it in val
    }
    if (val != null)
    {
      println(val);                               //print it out in the console
      valor = float(val);
      valor = map(valor, 0, 1023, 0, height);
    }
  }
}

