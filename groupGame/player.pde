class Player {

  // position

  float x, y, xVel, yVel, xAcc, yAcc;

  //timers
  float frames;
  int seconds;
  boolean shooting;

  //shooting
  Magic shots[];
  int nextShot;

  // Player Stats
  int HP, shotCD, shotspd, spd, atk, range;

  boolean shotsCD;

  Player() {
    spd = 1;
    shotspd = 5;
    nextShot = 0;
    range = 50;
    frames = 60;
    shots = new Magic[10];
    for (int i = 0; i < 10; i++) {
      shots[i] = new Magic(-4000, -4000, 0, 0);
    }
  }


  void update() {
    if (spd < 1) {
      spd = 1;
    }
    if (shotspd < 1) {
      shotspd = 1;
    }
    x += xVel;
    y += yVel;
    xVel += xAcc;
    yVel += yAcc;
    xVel *= .9;
    yVel *= .9;

    for (Magic m : shots) {
      m.update();
      m.display();
    }
    shotCD--;
    frames--;
    // ANY AND ALL TIMERS GO IN HERE.
    if (frames <= 0) {
      println(seconds);
      frames = 60;
      seconds++;
    }
    if (shotCD <= 0) {
      shooting = false;
    }
  }
  
  void display() {

    rectMode(CENTER);
    rect(x, y, 50, 50);
  }
  
  void keyPressed() {
    if (key == '1') {
      spd++;
    }
    if (key == '2') {
      spd--;
    }
    if (key == '3') {
      shotspd++;
    }
    if (key == '4') {
      shotspd--;
    }
    if (key == 'w') {
      yAcc = -spd;
      // println("Moving Up");
    }
    if (key == 'a') {
      xAcc = -spd;
      //println("Moving Left");
    }
    if (key == 's') {
      yAcc = spd;
      //println("Moving Down");
    }
    if (key == 'd') {
      xAcc = spd;
      //   println("Moving Right");
    }

    if (key == CODED && !shooting) {
      shotCD = 60;
      shooting = true;
      if (keyCode == UP) {
        shots[nextShot] = new Magic(x, y-30, 0, -shotspd + (yVel *.5));
      } else if (keyCode == DOWN) {
        shots[nextShot] = new Magic(x, y+30, 0, shotspd + (yVel *.5));
      } else if (keyCode == LEFT) {
        shots[nextShot] = new Magic(x-30, y, -shotspd + (xVel *.5), 0);
      } else if (keyCode == RIGHT) {
        shots[nextShot] = new Magic(x+30, y, shotspd + (xVel *.5), 0);
      }
      if (nextShot == 9) {
        nextShot = 0;
      }
      nextShot++;
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
