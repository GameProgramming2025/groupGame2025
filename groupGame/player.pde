class Player {
  float x, y, xVel, yVel, xAcc, yAcc;
  float frames;
  int seconds;
  boolean shotsCD;
  Player() {
    frames = 60;
  }

  void display() {
    x += xVel;
    y += yVel;
    xVel += xAcc;
    yVel += yAcc;
    xVel *= .9;
    yVel *= .9;

    rectMode(CENTER);
    rect(x, y, 50, 50);
    frames--;
    // ANY AND ALL TIMERS GO IN HERE.
    if (frames >= 0);
    //shotsCD
  }

  void keyPressed() {
    if (key == 'w') {
      yAcc = -.6;
      // println("Moving Up");
    }
    if (key == 'a') {
      xAcc = -.6;
      //println("Moving Left");
    }
    if (key == 's') {
      yAcc = .6;
      //println("Moving Down");
    }
    if (key == 'd') {
      xAcc = .6;
      //   println("Moving Right");
    }

    if (key == CODED) {
      if (keyCode == UP) {
        text("shoot up", x, y);
        //   println("Shooting Up");
      } else if (keyCode == DOWN) {
        text("shoot down", x, y);
        // println("Shooting Down");
      } else if (keyCode == LEFT) {
        text("shoot left", x, y);
        //println("Shooting Left");
      } else if (keyCode == RIGHT) {
        text("shoot right", x, y);
        //  println("Shooting Right");
      }
    }
  }

  void keyReleased() {
    if (key == 'w') {
      yAcc = 0;
      //println("Stopped moving up");
    }
    if (key == 'a') {
      xAcc = 0;
      //println("Stopped moving left");
    }
    if (key == 's') {
      yAcc = 0;
      //println("Stopped moving down");
    }
    if (key == 'd') {
      xAcc = 0;
      //println("Stopped moving right");
    }
    if (key == CODED) {
      if (keyCode == UP) {
        // println("Stopped shooting Up");
      } else if (keyCode == DOWN) {
        //println("Stopped shooting Down");
      } else if (keyCode == LEFT) {
        //println("Stopped shooting Left");
      } else if (keyCode == RIGHT) {
        //println("Stopped shooting Right");
      }
    }
  }
}
