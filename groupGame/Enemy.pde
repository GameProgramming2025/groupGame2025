class Enemy extends ScreenElement {
  float health;
  float gravity;
  float xAcc;
  float yAcc;
  Player p;
  float enemyHealth;

  Enemy(float x, float y) {
    super();
    this.xPos = x;
    this.yPos = y;
    enemyHealth = 1;
    xVelo = random(-5, 5);
    yVelo = random(-5, 5);
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
    rect(0, -25, 50, 10);
    fill(#00ffff);
    pop();
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
    
      if ( yPos < 272  ) {
      yVelo = -yVelo;
      
    }
    
    
    
    
  }


  boolean hit(float x, float y) {
    if (dist(x, y, p.x, p.y ) < 75 ) {
      return true;
      
    }
    return false;
  }
}
