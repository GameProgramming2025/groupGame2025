class Enemy extends ScreenElement {
  float health;
  float gravity;
  float xAcc;
  float yAcc;
  float enemyHealth;
  boolean here;
  float HpBarHeight;
  int hitReg = 250;
  boolean hitCooldown;
  int recordedTime;
  int rad = 250;
  PVector enemy, projectile, target;

  //Enemy Images
  PImage sprites[];
  int currentSprite;
  int firstSprite;
  int frame;
  int animation;

  Enemy(float x, float y) {
    super();
    this.xPos = x;
    this.yPos = y;
    here = true;
    enemyHealth = 50;
    HpBarHeight = 10;
    xVelo = random(-2.5, 2.5);
    yVelo = random(-1.5, 1.5);
    enemy = new PVector(x, y);
    projectile = new PVector(enemy.x, enemy.y);
    target = new PVector(p1.x, p1.y);
    animation = 15;
    currentSprite = 0;
    firstSprite = 0;
    frame = 0;
    sprites = new PImage[36];
    PImage spritesheet = loadImage("Sprites/ZombieEnemy.png");
    spritesheet.resize(96, 96);
    sprites[0] = spritesheet.get(6, 9, 30, 39);
    sprites[1] = spritesheet.get(54, 9, 30, 39);
    sprites[2] = spritesheet.get(6, 57, 30, 39);
    sprites[3] = spritesheet.get(54, 57, 30, 39);

    recordedTime = millis() + 1000;
  }

  void display () {
    frame ++;
    push();
    stroke(255, 0, 0);
    fill(#4287f5);
    ellipse(projectile.x, projectile.y, 10, 10);
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
        currentSprite = 2;
      }
    }
    if (yVelo < 0 && xVelo < 0) {
      animation--;
      currentSprite = 1;
      if (animation <= 5) {
        currentSprite = 3;
      }
    }
    imageMode(CENTER);
    image(sprites[currentSprite], 0, 0);

    strokeWeight(2);
    stroke(255);
    fill(#ffff00);
    rect(0, -25, enemyHealth, HpBarHeight);
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
    if (frame == 180) {
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
    if (frame == 250) {
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





    if (enemyHealth <= 0 ) {
      enemyHealth = 0;
      HpBarHeight = 0;
      enemy.x = 10000;
      enemy.y = 10000;
    }

    if (enemyHealth == 0) {
      here = false;
    }

    if (dist(enemy.x, enemy.y, p1.x, p1.y ) < 45 && millis() > recordedTime + hitReg) {
      p1.HP -= 1;
      enemyHealth -= 15;
      recordedTime = millis();
    }

    if (dist(p1.x, p1.y, projectile.x, projectile.y ) < 45 && millis() > recordedTime + hitReg) {
      p1.HP -= 1;
      projectile.x = 10000;
      projectile.y = 10000;
      recordedTime = millis();
      soundEffects.hurt = true;
    } else {
      soundEffects.hurt = false;
    }
    
    for (Magic m : p1.shots) {
      if (dist(enemy.x, enemy.y, m.x, m.y) < 75) {
        enemyHealth = 0;
      }
    }
  }
}
