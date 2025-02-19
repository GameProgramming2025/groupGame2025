class Player {
  //W
  //Item
  HighNoon h;
  // position

  float x, y, xVel, yVel, xAcc, yAcc;
  float tempX, tempY;

  //timers
  float frames;
  int seconds;
  boolean shooting;

  //shooting
  Magic shots[];
  int nextShot;

  // Player Stats
  int HP, shotCD, shotsCD, shotspd, spd, atk, range; //<>//

  Player() {
    spd = 1;
    shotspd = 5;
    nextShot = 0;
    range = 300;
    frames = 60;
    shotsCD = 60;
    shots = new Magic[10];
    h = new HighNoon(x,y);
    for (int i = 0; i < 10; i++) {
      shots[i] = new Magic(-4000, -4000, 0, 0);
    }
  }

  void update() {
    print(shooting);
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
      if (m.x > 0 && m.y > 0) {
        if (dist(tempX, tempY, m.x, m.y)>range) {
          m.x = -4000;
          m.y = -4000;
        }
      }
      m.display();
    }
    shotCD--;
    frames--;
    // ANY AND ALL TIMERS GO IN HERE.
    if (frames <= 0) {

      frames = 60;
      seconds++;
    }
    if (shotCD <= 0) {
      shooting = false;
    }

    //not a timer but it counts lul
    if(h.collected == true){
      shotsCD += h.shotsCD;
      atk += h.atk;
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
    if (key == '5') {
      range++;
    }
    if (key == '6') {
      range--;
    }
    if (key == 'w') {
      yAcc = -spd;
    }
    if (key == 'a') {
      xAcc = -spd;
    }
    if (key == 's') {
      yAcc = spd;
    }
    if (key == 'd') {
      xAcc = spd;
    }

    //shooting
    if (key == CODED && !shooting) {
      println(tempX, " ", tempY);
      shooting = true;
      shotCD = shotsCD;
      tempX = x;
      tempY = y;
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
    }
    if (key == 'a') {
      xAcc = 0;
    }
    if (key == 's') {
      yAcc = 0;
    }
    if (key == 'd') {
      xAcc = 0;
    }
    if (key == CODED) {
      if (keyCode == UP) {
        //
      } else if (keyCode == DOWN) {
        //
      } else if (keyCode == LEFT) {
        //
      } else if (keyCode == RIGHT) {
        //
      }
    }
  }
}
