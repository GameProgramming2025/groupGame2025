class Player { //<>// //<>// //<>//
  //W
  //Item
  HighNoon h;
  // position

  float x, y, xVel, yVel, xAcc, yAcc;
  float tempX, tempY;

  //timers
  float frames;
  int seconds;
  int animation;
  boolean shooting;

  //shooting
  Magic shots[];

  int nextShot;

  // Player Stats
  int HP, shotCD, shotsCD, shotspd, spd, atk, range;

  //Player Images
  PImage sprites[];
  int currentSprite;
  int firstSprite;
  int frame;

  Player() {
    HP = 10;
    spd = 1;
    shotspd = 5;
    nextShot = 0;
    range = 300;
    frames = 60;
    animation = 15;
    shotsCD = 60;
    shots = new Magic[10];
    h = new HighNoon(width/4, height/4);
    for (int i = 0; i < 10; i++) {
      shots[i] = new Magic(-4000, -4000, 0, 0);
    }

    currentSprite = 0;
    firstSprite = 0;
    frame = 0;
    sprites = new PImage[36];
    PImage spritesheet = loadImage("Sprites/PlayerUno.png");

    sprites[0] = spritesheet.get(0, 0, 96, 96);
    sprites[1] = spritesheet.get(96, 0, 96, 96);
    sprites[2] = spritesheet.get(192, 1, 96, 96);
    sprites[3] = spritesheet.get(0, 96, 96, 96);
    sprites[4] = spritesheet.get(96, 97, 96, 96);
    sprites[5] = spritesheet.get(192, 96, 96, 96);
    sprites[6] = spritesheet.get(0, 193, 96, 96);
    sprites[7] = spritesheet.get(94, 192, 96, 96);
    sprites[8] = spritesheet.get(192, 192, 96, 96);
    sprites[9] = spritesheet.get(0, 288, 96, 96);
  }

  void update() {
    //print(shooting);
    if (HP < 0) {
      text("YOU DIED", width/2, height/2);
    }
    //println(p1.y);
    //right side
    if (x > 1450 && y < 550) {//top left wall
      x = 1450;
    } else if (x > 1450 && y > 725) {//bottom left wall
      x = 1450;
    } else if (x > width) {//right
      x = 40;
      currentI++;
    }

    //left side
    if (x < 250 && y < 550) {//top left wall
      x = 250;
    } else if (x < 250 && y > 725) {//bottom left wall
      x = 250;
    } else if (x < 0) {//left
      p1.x = width-40;
      currentI--;
    }

    if (y > height) {//down
      y = 40;
      currentJ++;
    }
    if (y < 0) {//up
      y = height-40;
      currentJ--;
    }
    if (currentI == 4) {
      currentI = 0;
    }
    if (currentI == -1) {
      currentI = 3;
    }
    if (currentJ == 4) {
      currentJ = 0;
    }
    if (currentJ == -1) {
      currentJ = 3;
    }
    spd = constrain(spd, 1, 3);
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
    if (animation <= 0) {
      animation = 15;
    }

    if (frames <= 0) {

      frames = 60;
      seconds++;
    }
    if (shotCD <= 0) {
      shooting = false;
    }
    h.render();
    //not a timer but it counts lul
    if (h.collected == true) {
      shotsCD += h.shotsCD;
      atk += h.atk;
    }

    x = constrain(x, 0, width);
    y = constrain(y, 0, height);

    if (Math.abs(xVel) < 0.3) {
      xVel = 0;
    }
    if (Math.abs(yVel) < 0.3) {
      yVel = 0;
    }
  }


  void display() {
    println(yVel);
    println(xVel);
    if (xVel == 0 && yVel == 0) {
      currentSprite = 0;
    }
    if (yVel > 0 && xVel == 0) {
      animation--;
      currentSprite = 1;
      if (animation <= 5) {
        currentSprite = 0;
      }
    }
    if (yVel < 0 && xVel == 0) {
      animation--;
      currentSprite = 5;
      if (animation <= 5) {
        currentSprite = 4;
      }
    }
    if (yVel == 0 && xVel > 0) {
      animation--;
      currentSprite = 3;
      if (animation <= 5) {
        currentSprite = 2;
      }
    }
    if (yVel == 0 && xVel < 0) {
      animation--;
      currentSprite = 7;
      if (animation <= 5) {
        currentSprite = 6;
      }
    }
    if (HP == 0) {
      currentSprite = 9;
    }

    //else if (){
    //
    //}

    push();
    translate(x, y);
    imageMode(CENTER);

    image(sprites[currentSprite], 0, 0);
    pop();
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
    if (key == '7') {
      HP--;
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
      // println(tempX, " ", tempY);
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

    switch (key) {
    case 'w':

      //firstSprite = 30;
      //currentSprite = 30;
      break;
    case 's':

      //firstSprite = 18;
      //currentSprite = 18;
      break;
    case 'a':

      //firstSprite = 24;
      //currentSprite = 24;
      break;
    case 'd':

      //firstSprite = 24;
      //currentSprite = 24;
      break;
    }
  }



  void keyReleased() {
    if (key == 'w') {
      yAcc = 0;

      firstSprite = 0;
      currentSprite = 0;
    }
    if (key == 'a') {
      xAcc = 0;

      firstSprite = 0;
      currentSprite = 0;
    }
    if (key == 's') {
      yAcc = 0;

      firstSprite = 0;
      currentSprite = 0;
    }
    if (key == 'd') {
      xAcc = 0;

      firstSprite = 0;
      currentSprite = 0;
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
