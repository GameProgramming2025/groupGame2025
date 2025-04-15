class Player { //<>//
  //Items //<>//
  Item inventory[];
  int equippedItem;
  HighNoon h;

  EmptyItem e;
  float x, y, xVel, yVel, xAcc, yAcc, xSize, ySize;
  float tempX, tempY;

  //timers
  float frames;
  int seconds;
  int animation;
  int finalAnimation;
  boolean shooting;

  //shooting
  Heatseeker bullets[];
  //heatseeker variables
  float farthestDistance;
  float farthestEnemyX;
  float farthestEnemyY;

  // Player Stats
 //<>//
  int HP, shotCD, shotsCD, shotspd, spd, maxspd, atk, range;

  Magic shots[]; //<>//

  int nextShot;
  int nextItem;

  //Player Images

  PImage sprites[];
  int currentSprite;
  int firstSprite;
  int frame;

  Player() {
    xSize = 96;
    ySize = 96;
    HP = 10;
    spd = 1;
    shotspd = 35;
    nextShot = 0;
    range = 500;
    frames = 60;
    animation = 30;
    finalAnimation = 60;
    shotsCD = 60;
    maxspd = 1000000;
    shots = new Magic[10];
    bullets = new Heatseeker[10];
    inventory= new Item[5];

    nextItem = 0;

    h = new HighNoon(width/4, height/4);
    e = new EmptyItem(x, y);
    inventory = new Item[5];

    for (int j = 0; j < 5; j++) {
      inventory[j] = new EmptyItem(x, y);
    }


    for (int i = 0; i < 10; i++) {
      shots[i] = new Magic(-4000, -4000, 0, 0);
    }

    for (int i = 0; i < 10; i++) {
      bullets[i] = new Heatseeker();
    }

    currentSprite = 0;
    firstSprite = 0;
    frame = 0;
    sprites = new PImage[36];

    PImage spritesheet = loadImage("Sprites/PlayerOne.png");



    sprites[0] = spritesheet.get(0, 0, 96, 96);
    sprites[1] = spritesheet.get(96, 0, 96, 96);

    sprites[2] = spritesheet.get(192, 0, 96, 96);
    sprites[3] = spritesheet.get(288, 0, 96, 96);
    sprites[4] = spritesheet.get(384, 0, 96, 96);

    sprites[5] = spritesheet.get(0, 96, 96, 96);
    sprites[6] = spritesheet.get(96, 96, 96, 96);
    sprites[7] = spritesheet.get(192, 96, 96, 96);
    sprites[8] = spritesheet.get(288, 96, 96, 96);
    sprites[9] = spritesheet.get(384, 96, 96, 96);

    sprites[10] = spritesheet.get(0, 192, 96, 96);
    sprites[11] = spritesheet.get(96, 192, 96, 96);
    sprites[12] = spritesheet.get(192, 192, 96, 96);
    sprites[13] = spritesheet.get(288, 192, 96, 96);
    sprites[14] = spritesheet.get(384, 192, 96, 96);

    sprites[15] = spritesheet.get(0, 288, 96, 96);
    sprites[16] = spritesheet.get(96, 288, 96, 96);
    sprites[17] = spritesheet.get(192, 288, 96, 96);
    sprites[18] = spritesheet.get(288, 288, 96, 96);
    sprites[19] = spritesheet.get(384, 288, 96, 96);

    sprites[20] = spritesheet.get(0, 384, 96, 96);
    sprites[21] = spritesheet.get(384, 384, 96, 96);
  }

  void update() {
    

    //print(shooting);
    if (HP <= 0 && finalAnimation <= 1) {
      image(GameOver, 170, 50);
    }

    spd = constrain(spd, 1, maxspd);
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
          m.destroyObject();
        }
      }
      m.display();
    }

    if (currentRoom.enemies != null) {

      for (Enemy enemy : currentRoom.enemies) {
        if (dist(x, y, enemy.xPos, enemy.yPos) > farthestDistance && enemy.enemyHealth > 0) { //Checks each and every enemy and sees which is the farthest from the player
          farthestDistance = dist(x, y, enemy.xPos, enemy.yPos);  //Stores the distance to make sure the highest distance is stored
          farthestEnemyX = enemy.xPos;  //Stores the x value of the farthest enemy
          farthestEnemyY = enemy.yPos;  //Stores the y value of the farthest enemy
        }
      }


      for (Heatseeker bullet : bullets) {
        bullet.update(farthestEnemyX, farthestEnemyY);  //Updates the position of the farthest enemy to the heatseeker's update function
        bullet.display(); //will move it later to display
      }

      farthestDistance = 0;
      //Sets the farthest distance to 0 to make sure we can calculate the farthest enemy again during the next iteration
    } else {
      for (Heatseeker bullet : bullets) {
        bullet.destroyBullet();
      }
    }

    shotCD--;
    frames--;
    // ANY AND ALL TIMERS GO IN HERE.
    if (animation <= 0) {
      animation = 30 - (int)(((int)Math.abs(xVel))^2 + ((int)Math.abs(yVel))^2)^(1/2);
    }
    if (finalAnimation <= 0) {
      finalAnimation = 30 - (int)(((int)Math.abs(xVel))^2 + ((int)Math.abs(yVel))^2)^(1/2);
    }

    if (frames <= 0) {

      frames = 60;
      seconds++;
    }
    if (shotCD <= 0) {
      shooting = false;
    }

    //not a timer but it counts lul
    //if (h.collected == true) {
    //  shotsCD += h.shotsCD;
    //  atk += h.atk;
    //}

    x = constrain(x, 0, width);
    y = constrain(y, 0, height);

    if (Math.abs(xVel) < 0.3) {
      xVel = 0;
    }
    if (Math.abs(yVel) < 0.3) {
      yVel = 0;
    }

    if (HP < 0) {
      xVel = 0;
      yVel = 0;
    }
  }

  void display() {
    //println(yVel);
    //println(xVel);
    if (xVel == 0 && yVel == 0) {
      animation--;
      currentSprite = 0;
      if (animation <= 14) {
        currentSprite = 1;
      }
    }
    if (yVel > 0 && xVel == 0) {
      animation--;
      currentSprite = 3;
      if (animation <= 19) {
        currentSprite = 2;
        if (animation <= 9) {
          currentSprite = 0;
        }
      }
    }
    if (yVel < 0 && xVel == 0) {
      animation--;
      currentSprite = 7;
      if (animation <= 19) {
        currentSprite = 8;
        if (animation <= 9) {
          currentSprite = 9;
        }
      }
    }
    if (yVel == 0 && xVel > 0 || xVel > 0 && yVel > 0 || xVel > 0 && yVel < 0 ) {
      animation--;
      currentSprite = 4;
      if (animation <= 19) {
        currentSprite = 5;
        if (animation <= 9) {
          currentSprite = 6;
        }
      }
    }
    if (yVel == 0 && xVel < 0 || yVel < 0 && xVel < 0 || yVel > 0 && xVel < 0) {
      animation--;
      currentSprite = 10;
      if (animation <= 19) {
        currentSprite = 11;
        if (animation <= 9) {
          currentSprite = 12;
        }
      }
    }
    if (HP <= 0) {
      finalAnimation--;
      currentSprite = 17;
      if (finalAnimation <= 44) {
        currentSprite = 18;
        if (finalAnimation <= 29) {
          currentSprite = 19;
          if (finalAnimation <= 14) {
            currentSprite = 20;
            if (finalAnimation <= 1) {
              finalAnimation = 1;
              currentSprite = 21;
            }
          }
        }
      }
    }

    push();
    translate(x, y);
    imageMode(CENTER);

    image(sprites[currentSprite], 0, 0);
    pop();
  }

  boolean hittingPlayer(float targetX, float targetY, float targetXSize, float targetYSize) {
    //ASSUMES RECTMODE CENTER AND ALL THE OBJECTS BEING RECTANGLES
    return (
      targetX + targetXSize > x - xSize || //Collision left side player
      targetX - targetXSize < x + xSize || //Collision right side player
      targetY + targetYSize > y - ySize || //Collision top side player
      targetY - targetYSize < y + ySize    //Collision bottom side player
      );
  }

  void giveItemToPlayer(Item i) {
    inventory[nextItem] = i;
    nextItem++;
    if (nextItem == 5) {
      nextItem = 0;
    }
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
        bullets[nextShot] = new Heatseeker();
        bullets[nextShot].createBullet(x, y-30);
        bullets[nextShot].update(farthestEnemyX, farthestEnemyY);
        println(bullets[nextShot].xVel, bullets[nextShot].yVel);
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
