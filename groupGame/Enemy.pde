class Enemy extends ScreenElement {
  float health;
  float gravity;
  float xAcc;
  float yAcc;
  Player p;
  float enemyHealth;

  Enemy (float x, float y) {
    super();
    respawn();
    xVelo = 1;
    enemyHealth = 1;
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
    rect(20, 0, 50, 10);
    fill(#00ffff);
    rect(20, 0, enemyHealth, 7);
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
    yVelo += yAcc;
    xVelo += xAcc;
    yVelo += gravity;
  }


  boolean hit(float x, float y) {  
   if (dist(x, y, p.x, p.y ) < 75 ) {
     return true;
    }
    return false;
  }
}
