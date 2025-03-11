class Enemy extends ScreenElement {
  float health;
  float gravity;
  float xAcc;
  float yAcc;
  float enemyHealth;
  boolean here;
  float HpBarHeight;

  Enemy(float x, float y) {
    super();
    this.xPos = x;
    this.yPos = y;
    here = true;
    enemyHealth = 50;
    HpBarHeight = 10;
    xVelo = random(-2.5, 2.5);
    yVelo = random(-1.5, 1.5);
  }

  void display () {
    push();
    translate(xPos, yPos);
    rectMode(CENTER);
    strokeWeight(2);
    stroke(255);
    fill(#ffff00);
    ellipse(0, 0, 30, 30);
    fill(#802345);
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
  }


  void update () {
    xPosPrev = xPos;
    yPosPrev = yPos;
    xPos += xVelo;
    yPos += yVelo;
    // yVelo += yAcc;
    // xVelo += xAcc;
    // yVelo += gravity;
    println(xPos);

    if ( xPos < 252 ) {
      xVelo = -xVelo;
    }

    if ( xPos > 1466 ) {
      xVelo = -xVelo;
    }

    if ( yPos > 945  ) {
      yVelo = -yVelo;
    }

    if ( yPos < 282  ) {
      yVelo = -yVelo;
    }

    if (enemyHealth <= 0 ) {
      enemyHealth = 0;
      HpBarHeight = 0;
    }

    if (enemyHealth == 0) {
      here = false;
    }



    if (dist(xPos, yPos, p1.x, p1.y ) < 75 ) {
      p1.HP = p1.HP-1;
      xPos = -10000;
      yPos = -10000;
    }
  }
}
