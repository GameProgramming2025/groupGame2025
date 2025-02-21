class Enemy extends ScreenElement {
  float health;
  float gravity;
  float xAcc;
  float yAcc;

  Enemy(float x, float y) {
    super();
    respawn();
  }

  void display () {
    push();
    translate(xPos, yPos);
    rectMode(CENTER);
    strokeWeight(2);
    stroke(255);
    fill(#ffff00);
    ellipse(0, 0, 30, 30);
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

  boolean hit (float x, float y) {
    return false;
  }
}
