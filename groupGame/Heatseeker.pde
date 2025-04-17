class Heatseeker {
  float posX, posY, xVel, yVel;
  PImage bullet;

  PVector current;
  PVector target;

  boolean using;


  Heatseeker() {
    bullet = loadImage("data/VisualEffects/stareffect.png");
    bullet.resize(50, 50);
  }

  //THIS NEEDS TO BE UPDATED EVERY FRAME
  void update(float targetX, float targetY) {
    if (using) {
      target = new PVector(targetX - posX, targetY - posY);
      target.normalize();

      xVel = target.x * 20;
      yVel = target.y * 20;

      posX += xVel;
      posY += yVel;
    }
  }

  void display() {
    if (using) {
      imageMode(CENTER);
      push();
      translate(posX, posY);
      image(bullet, 0, 0);
      pop();
      imageMode(CORNER);
    }
  }
  
  void createBullet(float posX, float posY) {
    this.posX = posX;
    this.posY = posY;
    
    using = true;
  }
  
  void destroyBullet() {
    using = false;
  }
}