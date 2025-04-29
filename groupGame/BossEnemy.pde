class BossEnemy extends ScreenElement {
  SoundEffects sfx;
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
    animation = 15;
    //currentSprite = 0;
   // firstSprite = 0;
    frame = 0;
    finTimer = 270;
    //sprites = new PImage[36];
   // PImage spritesheet = loadImage("Sprites/EnemyBasic.png");
    //spritesheet.resize(96, 96);

  
    recordedTime = millis() + 1000;
    sfx = new SoundEffects(minim);
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
    //image(sprites[currentSprite], 0, 0);

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

      currentSprite = int((270-finTimer)/15)+2;
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
      BossEnemyHealth -= 15;
      recordedTime = millis();
      
      soundEffects.strike = true;
    }else{
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
