class Runner extends ScreenElement {
  float health;
  float gravity;
  float xAcc;
  float yAcc;
  float runnerHealth;
  boolean dead;
  boolean here;
  boolean facingLeft;
  float HpBarHeight;
  int hitReg = 250;
  boolean hitCooldown;
  int recordedTime;
  int rad = 250;
  PVector runner, target;

  //Enemy Images
  PImage sprites[];
  int currentSprite;
  int firstSprite;
  int frame;
  int animation;
  int finTimer;
  int tick;

  Runner(float x, float y) {
    super();
    this.xPos = x;
    this.yPos = y;

    here = true;
    runnerHealth = 50;
    HpBarHeight = 10;
    xVelo = random(-2.5, 2.5);
    yVelo = random(-1.5, 1.5);
    runner = new PVector(x, y);
    target = new PVector(p1.x, p1.y);
    animation = 15;
    currentSprite = 0;
    firstSprite = 0;
    frame = -1;
    tick = -1;
    finTimer = 270;
    facingLeft = true;
    sprites = new PImage[36];
    PImage spritesheet = loadImage("Sprites/EnemyArrow.png");
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
    if (runnerHealth <= 0) {
      runnerHealth=0;
    }
    push();
    stroke(255, 0, 0);
    fill(#4287f5);
    translate(runner.x, runner.y);
    //if (xVelo > 0){
    //  scale(facingLeft ? -1:1, 1);
    //}
    //if (xVelo < 0 ) {
    //  scale(1);
    //}
    rectMode(CENTER);


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
    rotate(atan2(-yVelo, -xVelo));
    image(sprites[currentSprite], 0, 0);

    pop();
    push();
    translate(runner.x, runner.y);
    strokeWeight(2);
    stroke(255);
    if (gameState == GameState.GAME_OVER) {
      noStroke();
    }
    fill(#ffff00);
    if (runnerHealth > 0) {
      rect(0, -55, runnerHealth, HpBarHeight);
    }
    fill(#00ffff);

    pop();
  }


  void respawn() {
    this.xPos = random(30, width - 30);
    this.yPos = random(-height * 2, -100);
    xVelo = random(-2.5, 2.5);
    yVelo = random(-1.5, 1.5);
    health = 50;
    recordedTime = millis() + 1500; //Spawn Immunity
  }


  void update () {

    if (runnerHealth == 0 && finTimer == 269 ) {
      dead = true;
    }

    if (dead) {
      p1.killsNum++;
      if (p1.actItem != null) {
        p1.actItem.incrementCharge();
      }
      dead =false;
    }

    if (random(0, 1) < 0.005 && tick == -1) {
      tick = 0;
    }

    if (tick > -1 && tick < 5) {
      if (dist(runner.x, runner.y, p1.x, p1.y ) < 400 ) {
        target.x = p1.x-runner.x;
        target.y = p1.y-runner.y;
        target.normalize();
        xVelo = target.x * 20;
        yVelo = target.y * 20;
      }
    }
    if (tick == 3000) {
      tick = -1;
      frame = 0;
      xVelo = random(-2.5, 2.5);
      yVelo = random(-1.5, 1.5);
      //target.x *= 3;
      //target.y *= 3;
    }
    xPosPrev = runner.x;
    yPosPrev = runner.y;
    runner.x += xVelo;
    runner.y += yVelo;
    // yVelo += yAcc;
    // xVelo += xAcc;
    // yVelo += gravity;
    if (animation <= 0) {
      animation = 15;
    }

    if ( runner.x < 252 ) {
      xVelo = -xVelo;
    }

    if ( runner.x > 1466 ) {
      xVelo = -xVelo;
    }

    if ( runner.y > 945  ) {
      yVelo = -yVelo;
    }

    if ( runner.y < 282  ) {
      yVelo = -yVelo;
    }





    if (runnerHealth <= 0 ) {
      finTimer--;
      xVelo = 0;
      yVelo = 0;
      frame = 0;
      health = 0;

      currentSprite = int((270-finTimer)/15)+2;

      if (finTimer <= 1) {
        HpBarHeight = 0;
        runner.x = 10000;
        runner.y = 10000;
        finTimer = 60;
      }
    }

    if (runnerHealth == 0) {
      here = false;
    }

    if (dist(runner.x, runner.y, p1.x, p1.y ) < 45 && millis() > recordedTime + hitReg) {
      p1.HP -= 1;
      recordedTime = millis();
      soundEffects.strike = true;
    } else {
      soundEffects.strike = false;
    }


    for (Magic m : p1.shots) {
      if (dist(runner.x, runner.y, m.x, m.y) < 75 && m.isDestroyed == false) {
        runnerHealth -= p1.atk;
        m.x = 10000;
        m.y = 10000;
      }
    }

    xPos = runner.x;
    yPos = runner.y;




    //timer frame
    if (tick > -1) {
      tick++;
      if (tick > 3000) {
        tick = -1;
      }
    }
  }

  void faceRight() {
    facingLeft = false;
  }

  void faceLeft() {
    facingLeft = true;
  }

  void keyPressed() {
    if (key == 'k') {
      runnerHealth = 0;
    }
  }
}
