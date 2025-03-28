class Magic {
  float x, y, xVel, yVel;
  PImage star;

  float rotSpeed;

  boolean isDestroyed;


  Magic(float x, float y, float xVel, float yVel) {
    this.x = x;
    this.y = y;
    this.xVel = xVel;
    this.yVel = yVel;

    rotSpeed = radians(3);

    star = loadImage("data/VisualEffects/stareffect.png");
    star.resize(50, 50);
    isDestroyed = false;
  }

  void update() {
    if (!isDestroyed) {
      x += xVel;
      y += yVel;

      if (dist(p1.x, p1.y, x, y) > p1.range) {
        destroyObject();
      }
    }
  }

  void display() {
    if (!isDestroyed) {
      imageMode(CENTER);
      push();
      translate(x, y);
      rotate(rotSpeed++);
      image(star, 0, 0);
      pop();
      imageMode(CORNER);
    }
  }

  void destroyObject() {
    isDestroyed = true;
  }
}
