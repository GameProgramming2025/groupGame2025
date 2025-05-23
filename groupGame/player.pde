class Player { //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//

  Item inventory[];
  ItemRoom ipos;
  Item i;

  int equippedItem;
  int nextItemIndex;
  HighNoon h;
  EmptyItem e;
  float x, y, xVel, yVel, xAcc, yAcc;
  int xSize, ySize;
  float tempX, tempY;
  float charge = 0;
  int killsNum;
  //timers
  float chargeSpeed;
  float frames;
  int seconds;
  int animation;
  int finalAnimation;
  boolean shooting;



  Shotgun s;
  boolean hasShotgun;

  //heatseeker variables
  float farthestDistance;

  float farthestEnemyX;
  float farthestEnemyY;

  // Player Stats
  int maxHP, HP, shotspd, spd, maxspd, atk, range;
  float shotCD, shotsCD;

  Magic shots[];

  int nextShot;

  //Player Images
  PImage sprites[];
  int currentSprite;

  int firstSprite;

  int frame;

  Player() {
    chargeSpeed = 1.0 / shotsCD;
    killsNum = 0;
    xSize = 96;
    ySize = 96;
    maxHP = 10;
    HP = 9;
    spd = 1;
    shotspd = 35;
    nextShot = 0;
    range = 500;
    frames = 60;
    animation = 30;
    finalAnimation = 60;
    shotsCD = 15;
    maxspd = 1000000;
    atk = 20;

    shots = new Magic[10];
    inventory= new Item[5];

    s = new Shotgun(x, y);




    nextItemIndex = 0;


    e = new EmptyItem(x, y);

    inventory = new Item[5];

    for (int j = 0; j < 5; j++) {
      inventory[j] = new EmptyItem(x, y);
    }


    for (int i = 0; i < 10; i++) {
      shots[i] = new Magic();
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

    s.update();
    s.x = x;
    s.y = y;


    if ((currentRoom instanceof ItemRoom || currentRoom instanceof HealthRoom) && currentRoom.getItem() != null && dist(x, y, currentRoom.getItem().x, currentRoom.getItem().y) < 100) {
      inventory[nextItemIndex] = currentRoom.getItem();
      currentRoom.setItem(null);
      inventory[nextItemIndex].applyStats();
      nextItemIndex++;
      if (currentRoom.getItem() instanceof VeilOfSilence) {
        for (PImage sprite : sprites) {
          sprite.resize(xSize, ySize);
        }
      }

      if (currentRoom.getItem() instanceof ActiveItem) {
        for (Item item : inventory) {
          if (item instanceof ActiveItem) {
            item = currentRoom.getItem();
          }
        }
      }
    }

    if ((currentRoom instanceof ItemRoom || currentRoom instanceof HealthRoom) && currentRoom.getItem() != null && dist(x, y, currentRoom.getItem().x, currentRoom.getItem().y) < 200) {

      fill(0);
      strokeWeight(0);
      rect(currentRoom.getItem().x, currentRoom.getItem().y + 100, 120, 110, 10);
      textSize(15);
      fill(255);
      text(currentRoom.getItem().description, currentRoom.getItem().x, currentRoom.getItem().y + 100, 120, 1000000);
      strokeWeight(10);
    }


    //print(shooting);
    if (HP <= 0 && finalAnimation <= 1) {

      gameState = GameState.GAME_OVER;
    }

    spd = constrain(spd, 1, maxspd);
    if (shotspd < 1) {
      shotspd = 1;
    }

    if (HP > maxHP) {
      HP = maxHP;
    }

    if (charge < 1.0) {
      charge += chargeSpeed;
      if (charge > 1.0) charge = 1.0;
    }

    x += xVel;
    y += yVel;
    xVel += xAcc;
    yVel += yAcc;
    xVel *= .9;
    yVel *= .9;

    for (Magic m : shots) {
      m.update();
    }

    if (currentRoom.enemies != null) {

      for (Enemy enemy : currentRoom.enemies) {
        if (dist(x, y, enemy.xPos, enemy.yPos) > farthestDistance && enemy.enemyHealth > 0) { //Checks each and every enemy and sees which is the farthest from the player
          farthestDistance = dist(x, y, enemy.xPos, enemy.yPos);  //Stores the distance to make sure the highest distance is stored
          farthestEnemyX = enemy.xPos;  //Stores the x value of the farthest enemy
          farthestEnemyY = enemy.yPos;  //Stores the y value of the farthest enemy
        }
      }


      for (Magic shot : shots) {
        if (shot.isHeatseeking) { //Checks if the shot is a heatseeker shot or not
          shot.updateHeatseeker(farthestEnemyX, farthestEnemyY);  //Updates the position of the farthest enemy to the heatseeker's update function
        }
      }

      farthestDistance = 0;
      //Sets the farthest distance to 0 to make sure we can calculate the farthest enemy again during the next iteration
    } else {
      for (Magic shot : shots) {
        if (shot.isHeatseeking) {
          shot.destroyMagic();
        }
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

    s.display();

    for (Magic m : shots) {
      m.display();
    }

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
      xVel = 0;
      yVel = 0;
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
    // Draw charge cooldown indicator
    pop();

    if (shotCD >= 0.01) {
      push ();
      translate(x + xSize / 2 + 10, y - ySize / 2 - 10); // Position the circle near top-right of the player
      noFill();
      stroke(255);
      strokeWeight(2);
      fill (#00ff00);
      ellipse(0, 0, 20, 20); // Outer circle

      // Filled arc representing the charge

      //fill(255, 100, 100, 180); // Semi-transparent red
      noStroke();
      fill (#ff0000, 180);
      arc(0, 0, 20, 20, 0, (2*PI)*(shotCD/shotsCD), PIE);
      pop();
    }
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

  void keyPressed() {

    if (key == '1') {
      for (Item item : inventory) {
        if (item instanceof ActiveItem) {
          item.activateItem();
        }
      }
    }
    if (key == '2') {
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
      soundEffects.attack = true;

      hasShotgun = false;
      for (Item i : inventory) {
        if (i instanceof Shotgun) {
          hasShotgun = true;
        }
      }
      if (keyCode == UP) {
        if (hasShotgun == false) {
          shots[nextShot] = new Magic();
          shots[nextShot].createObject(x, y-30, 0, -shotspd + (yVel * .5), false);
        } else {
          s.shoot("UP");
          shots[0] = s.b1;
          shots[1] = s.b2;
          shots[2] = s.b3;
        }
      } else if (keyCode == DOWN) {
        if (hasShotgun == false) {
          shots[nextShot] = new Magic();
          shots[nextShot].createObject(x, y+30, 0, shotspd + (yVel *.5), false);
        } else {
          s.shoot("DOWN");
          shots[0] = s.b1;
          shots[1] = s.b2;
          shots[2] = s.b3;
        }
      } else if (keyCode == LEFT) {
        if (hasShotgun == false) {
          shots[nextShot] = new Magic();
          shots[nextShot].createObject(x-30, y, -shotspd + (xVel *.5), 0, false);
        } else {
          s.shoot("LEFT");
          shots[0] = s.b1;
          shots[1] = s.b2;
          shots[2] = s.b3;
        }
      } else if (keyCode == RIGHT) {
        if (hasShotgun == false) {
          shots[nextShot] = new Magic();
          shots[nextShot].createObject(x+30, y, shotspd + (xVel *.5), 0, false);
        } else {
          s.shoot("RIGHT");
          shots[0] = s.b1;
          shots[1] = s.b2;
          shots[2] = s.b3;
        }
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
