class BossEnemy extends ScreenElement {

  float health;
  float gravity;
  float xAcc;
  float yAcc;
  float BossEnemyHealth;
  boolean here;
  float HpBarHeight;
  int hitReg = 250;
  boolean hitCooldown;
  int recordedTime;
  int rad = 250;
  PVector BossEnemy, projectile, target;

  //Enemy Images
  PImage sprites[];
  int currentSprite;
  int firstSprite;
  int frame;
  int animation;
  int deadAnimation;
  int finTimer;

  BossEnemy(float x, float y) {
    super();
    this.xPos = x;
    this.yPos = y;
    here = true;
    BossEnemyHealth = 500;
    HpBarHeight = 10;
    xVelo = 3.5;
    yVelo = 3.5;
    BossEnemy = new PVector(x, y);
    projectile = new PVector(BossEnemy.x, BossEnemy.y);
    target = new PVector(p1.x, p1.y);
    animation = 21;
    deadAnimation = 500;
    currentSprite = 0;
    firstSprite = 0;
    frame = 0;
    finTimer = 175;
    sprites = new PImage[45];
    PImage spritesheet = loadImage("Sprites/BossSprite.png");
    spritesheet.resize(2016, 2016);

    //Basic Sprites
    sprites[0] = spritesheet.get(0, 0, 288, 288);
    sprites[1] = spritesheet.get(288, 0, 288, 288);
    sprites[2] = spritesheet.get(576, 0, 288, 288);

    //Attack Sprite
    sprites[3] = spritesheet.get(864, 0, 288, 288);

    //LosingHealth Sprites
    sprites[4] = spritesheet.get(1152, 0, 288, 288);
    sprites[5] = spritesheet.get(1440, 0, 288, 288);
    sprites[6] = spritesheet.get(1728, 0, 288, 288);

    sprites[7] = spritesheet.get(0, 288, 288, 288);
    sprites[8] = spritesheet.get(288, 288, 288, 288);
    sprites[9] = spritesheet.get(576, 288, 288, 288);

    sprites[10] = spritesheet.get(864, 288, 288, 288);
    sprites[11] = spritesheet.get(1152, 288, 288, 288);
    sprites[12] = spritesheet.get(1440, 288, 288, 288);
    sprites[13] = spritesheet.get(1728, 288, 288, 288);
    sprites[14] = spritesheet.get(0, 576, 288, 288);

    sprites[15] = spritesheet.get(288, 576, 288, 288);
    sprites[16] = spritesheet.get(576, 576, 288, 288);
    sprites[17] = spritesheet.get(864, 576, 288, 288);
    sprites[18] = spritesheet.get(1152, 576, 288, 288);

    //Start of Death
    sprites[19] = spritesheet.get(1440, 576, 288, 288);
    sprites[20] = spritesheet.get(1728, 576, 288, 288);
    sprites[21] = spritesheet.get(0, 864, 288, 288);

    sprites[22] = spritesheet.get(288, 864, 288, 288);
    sprites[23] = spritesheet.get(576, 864, 288, 288);
    sprites[24] = spritesheet.get(864, 864, 288, 288);
    sprites[25] = spritesheet.get(1152, 864, 288, 288);

    sprites[26] = spritesheet.get(1440, 864, 288, 288);
    sprites[27] = spritesheet.get(1728, 864, 288, 288);
    sprites[28] = spritesheet.get(0, 1152, 288, 288);
    sprites[29] = spritesheet.get(288, 1152, 288, 288);

    sprites[30] = spritesheet.get(576, 1152, 288, 288);
    sprites[31] = spritesheet.get(864, 1152, 288, 288);
    sprites[32] = spritesheet.get(1152, 1152, 288, 288);
    sprites[33] = spritesheet.get(1440, 1152, 288, 288);

    sprites[34] = spritesheet.get(1728, 1152, 288, 288);
    sprites[35] = spritesheet.get(0, 1440, 288, 288);
    sprites[36] = spritesheet.get(288, 1440, 288, 288);
    sprites[37] = spritesheet.get(576, 1440, 288, 288);

    sprites[38] = spritesheet.get(864, 1440, 288, 288);
    sprites[39] = spritesheet.get(1152, 1440, 288, 288);
    sprites[40] = spritesheet.get(1440, 1440, 288, 288);
    sprites[41] = spritesheet.get(1728, 1440, 288, 288);

    sprites[42] = spritesheet.get(0, 1728, 288, 288);
    sprites[43] = spritesheet.get(288, 1728, 288, 288);
    sprites[44] = spritesheet.get(576, 1728, 288, 288);

    recordedTime = millis() + 1000;
  }

  void display () {
    frame ++;
    push();
    stroke(255, 0, 0);
    fill(#4287f5);
    ellipse(projectile.x, projectile.y, 10, 10);
    translate(BossEnemy.x, BossEnemy.y);
    rectMode(CENTER);
    //print(projectile.x);

    //ellipse(0, 0, 30, 30);
    //fill(#802345);

    //player animation
    if (xVelo > 0 && yVelo > 0) {
      animation--;
      //dying animation
    if (BossEnemyHealth < deadAnimation) {
      currentSprite = ((500-deadAnimation)/27)+4;
      deadAnimation -= 50;
    } 
    //
      currentSprite = 0;
      if (animation <= 14) {
        currentSprite = 1;
        if (animation <= 7) {
          currentSprite = 2;
        }
      }
    }
    if (yVelo < 0 && xVelo < 0) {
      animation--;
      currentSprite = 0;
      if (animation <= 14) {
        currentSprite = 1;
        if (animation <= 7) {
          currentSprite = 2;
        }
      }
    }


    // if (BossEnemyHealth -= 33){
    // currentSprite = int(map(BossEnemyHealth, 0, 14, 0, 500)) + 4;
    // }

    imageMode(CENTER);
    image(sprites[currentSprite], 0, 0);

    strokeWeight(2);
    stroke(255);
    fill(#ffff00);
    rect(0, -55, BossEnemyHealth, HpBarHeight);
    fill(#00ffff);
    pop();
  }


  void respawn() {
    this.xPos = random(30, width - 30);
    this.yPos = random(-height * 2, -100);
    xVelo = random(-4, 4);
    yVelo = 0;
    health = 1;
    recordedTime = millis() + 1500; //Spawn Immunity
  }


  void update () {
    if (frame == 280) {
      if (dist(BossEnemy.x, BossEnemy.y, p1.x, p1.y ) < 800 ) {
        projectile.x = BossEnemy.x;
        projectile.y = BossEnemy.y;
        target.x = p1.x-BossEnemy.x;
        target.y = p1.y-BossEnemy.y;
        target.normalize();
        //target.x *= 3;
        //target.y *= 3;
      }
    }
    if (frame == 350) {
      projectile.x = 10000;
      projectile.y = 10000;
      frame = 0;
      //target.x *= 3;
      //target.y *= 3;
    }
    projectile.x += 30*target.x;
    projectile.y += 30*target.y;
    xPosPrev = BossEnemy.x;
    yPosPrev = BossEnemy.y;
    BossEnemy.x += xVelo;
    BossEnemy.y += yVelo;
    // yVelo += yAcc;
    // xVelo += xAcc;
    // yVelo += gravity;

    if (animation <= 0) {
      animation = 15;
    }


    //println(xPos);



    //println(xPos);


    if ( BossEnemy.x < 252 ) {
      xVelo = -xVelo;
    }

    if ( BossEnemy.x > 1466 ) {
      xVelo = -xVelo;
    }

    if ( BossEnemy.y > 945  ) {
      yVelo = -yVelo;
    }

    if ( BossEnemy.y < 282  ) {
      yVelo = -yVelo;
    }



    if (BossEnemyHealth <= 0 ) {
      finTimer--;
      xVelo = 0;
      yVelo = 0;
      frame = 0;

      currentSprite = int((175-finTimer)/7)+19;
      if (finTimer <= 1) {
        HpBarHeight = 0;
        BossEnemy.x = 10000;
        BossEnemy.y = 10000;
        finTimer = 60;
      }
    }

    if (BossEnemyHealth == 0) {
      here = false;
    }


    if (dist(BossEnemy.x, BossEnemy.y, p1.x, p1.y ) < 45 && millis() > recordedTime + hitReg) {
      p1.HP -= 2;
      BossEnemyHealth -= 33;
      recordedTime = millis();

      soundEffects.strike = true;
    } else {
      soundEffects.strike = false;
    }

    if (dist(p1.x, p1.y, projectile.x, projectile.y ) < 45 && millis() > recordedTime + hitReg) {
      p1.HP -= 2;
      projectile.x = 10000;
      projectile.y = 10000;
      recordedTime = millis();

      soundEffects.hurt = true;
    } else {
      soundEffects.hurt = false;
    }

    for (Magic m : p1.shots) {
      if (dist(BossEnemy.x, BossEnemy.y, m.x, m.y) < 75) {
        BossEnemyHealth = 0;
      }
    }

    xPos = BossEnemy.x;
    yPos = BossEnemy.y;
  }
}
