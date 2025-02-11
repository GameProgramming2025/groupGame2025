class BossEnemy extends ScreenElement {
  float health;
  float gravity;
  float xAcc;
  float yAcc;

  BossEnemy() {
    
  }

  void display () {
    push();
    translate(xPos, yPos);
    rectMode(CENTER);
    strokeWeight(2);
    stroke(255);
    fill(#ffff00);
    ellipse(0, 0, 60, 60);
    pop();
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
