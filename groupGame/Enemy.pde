class Enemy extends ScreenElement {
  float health;
  float gravity;
  float xAcc;
  float yAcc;
  float enemyHealth;
  boolean dead;
  boolean here;
  float HpBarHeight;
  int hitReg = 250;
  boolean hitCooldown;
  int recordedTime;
  int rad = 250;
  PVector enemy, projectile, target;
  PImage bullets, bullet;

  //Enemy Images
  PImage sprites[];
  int currentSprite;
  int firstSprite;
  int frame;
  int animation;
  int finTimer;
  int tick;

  Enemy(float x, float y, String spriteFilename) {
    super();
    this.xPos = x;
    this.yPos = y;

    here = true;
    enemyHealth = 100;
    HpBarHeight = 10;
    xVelo = random(-2.5, 2.5);
    yVelo = random(-1.5, 1.5);
    enemy = new PVector(x, y);
    projectile = new PVector(enemy.x, enemy.y);
    target = new PVector(p1.x, p1.y);
    animation = 15;
    currentSprite = 0;
    firstSprite = 0;
    frame = -1;
    tick = -1;
    finTimer = 270;
    sprites = new PImage[36];
    PImage spritesheet = loadImage(spriteFilename);
    
    PImage bullets = loadImage("data/Sprites/EnemyBullets.png");
    bullet = bullets.get(0, 0, 32, 32);
    
    //spritesheet.resize(96, 96);

    //Basic Sprites
    sprites[0] = spritesheet.get(0, 0, 96, 96);
    sprites[1] = spritesheet.get(96, 0, 96, 96);
    //Death Sprites
    sprites[2] = spritesheet.get(192, 0, 96, 96);
    sprites[3] = spritesheet.get(288, 0, 96, 96);
    sprites[4] = spritesheet.get(384, 0, 96, 96);

    sprites[5] = spritesheet.get(0, 96, 96, 96);
    sprites[6] = spritesheet.get(96, 96, 96, 96);
    sprites[7] = spritesheet.get(192, 96, 96, 96);
    sprites[8] = spritesheet.get(288, 96, 96, 96);
    sprites[9] = spritesheet.get(384, 96, 96, 96);

    sprites[10] = spritesheet.get(0, 192, 96, 96);
    //start of explosion death
    sprites[11] = spritesheet.get(96, 192, 96, 96);
    sprites[12] = spritesheet.get(192, 192, 96, 96);
    sprites[13] = spritesheet.get(288, 192, 96, 96);
    sprites[14] = spritesheet.get(384, 192, 96, 96);

    sprites[15] = spritesheet.get(0, 288, 96, 96);
    sprites[16] = spritesheet.get(96, 288, 96, 96);
    sprites[17] = spritesheet.get(192, 288, 96, 96);
    sprites[18] = spritesheet.get(288, 288, 96, 96);
    sprites[19] = spritesheet.get(384, 288, 96, 96);

    recordedTime = millis() + 1000;
  }

  void display () {
    if (enemyHealth <= 0) {
      enemyHealth=0;
    }
    push();
    stroke(255, 0, 0);

    fill(#4287f5);
    translate(projectile.x, projectile.y);
    rotate(projectile.x/10);
    imageMode(CENTER);
    image(bullet, 0, 0, 50, 50);
    pop();
    push();
    translate(enemy.x, enemy.y);
    rectMode(CENTER);
    //print(projectile.x);

    //ellipse(0, 0, 30, 30);
    //fill(#802345);

    //player animation
    if (xVelo > 0 && yVelo > 0) {
      animation--;
      currentSprite = 0;
      if (animation <= 5) {
        currentSprite = 1;
      }
    }
    if (yVelo < 0 && xVelo < 0) {
      animation--;
      currentSprite = 0;
      if (animation <= 5) {
        currentSprite = 1;
      }
    }
    imageMode(CENTER);
    image(sprites[currentSprite], 0, 0);

    strokeWeight(2);
    stroke(255);
    if (gameState == GameState.GAME_OVER) {
      noStroke();
    }
    fill(#ffff00);
    if (enemyHealth > 0) {
      rect(0, -55, enemyHealth, HpBarHeight);
    }
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

    if (enemyHealth == 0 && finTimer == 120 ) {
      dead = true;
      soundEffects.explosion = true;
    }

    if (dead) {
      p1.killsNum++;
      //p1.act.incrementCharge();

      if (p1.actItem != null) {
        p1.actItem.incrementCharge();
      }
      dead =false;
    }
    /*if (p1.killsNum > 0){
     enemyHealth = 0;
     }*/

    if (random(0, 1) < 0.003 && tick == -1) {
      tick = 0;
    }

    if (tick > -1 && tick <= 0) {
      if (dist(enemy.x, enemy.y, p1.x, p1.y ) < 400 ) {

        projectile.x = enemy.x;
        projectile.y = enemy.y;
        target.x = p1.x-enemy.x;
        target.y = p1.y-enemy.y;
        target.normalize();
        //target.x *= 3;
        //target.y *= 3;
      }
    }
    if (tick == 70) {
      projectile.x = 10000;
      projectile.y = 10000;
      frame = 0;
      //target.x *= 3;
      //target.y *= 3;
    }
    projectile.x += 10*target.x;
    projectile.y += 10*target.y;
    xPosPrev = enemy.x;
    yPosPrev = enemy.y;
    enemy.x += xVelo;
    enemy.y += yVelo;
    // yVelo += yAcc;
    // xVelo += xAcc;
    // yVelo += gravity;
    if (animation <= 0) {
      animation = 15;
    }


    //println(xPos);



    //println(xPos);


    if ( enemy.x < 252 ) {
      xVelo = -xVelo;
    }

    if ( enemy.x > 1466 ) {
      xVelo = -xVelo;
    }

    if ( enemy.y > 945  ) {
      yVelo = -yVelo;
    }

    if ( enemy.y < 282  ) {
      yVelo = -yVelo;
    }




    if (enemyHealth == 0) {
      here = false;
    }
    
    println(finTimer);

    if (enemyHealth <= 0 ) {

      finTimer--;
      xVelo = 0;
      yVelo = 0;
      frame = 0;
      health = 0;

      currentSprite = int((270-finTimer)/15)+2;

      if (finTimer <= 5) {
        HpBarHeight = 0;
        enemy.x = 10000;
        enemy.y = 10000;
        soundEffects.explosion = false;
        finTimer = 60;
      }
    }




    if (dist(enemy.x, enemy.y, p1.x, p1.y ) < 45 && millis() > recordedTime + hitReg) {
      p1.HP -= 1;
      recordedTime = millis();
      soundEffects.strike = true;
    }

    if (dist(p1.x, p1.y, projectile.x, projectile.y ) < 45 && millis() > recordedTime + hitReg) {
      p1.HP -= 1;
      projectile.x = 10000;
      projectile.y = 10000;
      recordedTime = millis();
      soundEffects.hurt = true;
    }

    for (Magic m : p1.shots) {
      if (dist(enemy.x, enemy.y, m.x, m.y) < 75 && m.isDestroyed == false) {
        soundEffects.strike = true;
        enemyHealth -= p1.atk;
        m.x = 10000;
        m.y = 10000;
      }
    }

    xPos = enemy.x;
    yPos = enemy.y;




    //timer frame
    if (tick > -1) {
      tick++;
      if (tick > 70) {
        tick = -1;
      }
    }
  }
}
