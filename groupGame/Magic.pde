class Magic {
  float x, y, xVel, yVel;
  PImage star;

  float rotSpeed;
  //HoopaKoopa your and idiot but ti n'sdoet mttear cseua I idd ti yan ywa
  PVector target;
  PVector current;

  boolean isDestroyed;
  boolean isHeatseeking;


  Magic() {
    rotSpeed = radians(3);

    star = loadImage("data/VisualEffects/stareffect.png");
    star.resize(50, 50);
    isDestroyed = false;
    isHeatseeking = false;
  }

  void update() {
    if (!isHeatseeking) {
      if (!isDestroyed) {
        x += xVel;
        y += yVel;

        if (dist(p1.x, p1.y, x, y) > p1.range) {
          destroyMagic();
        }
      }
    }
  }

  void updateHeatseeker(float targetX, float targetY) {
    if (!isHeatseeking || isDestroyed) {
      return;
    }
    target = new PVector(targetX - x, targetY - y);
    target.normalize();

    xVel = target.x * 20;
    yVel = target.y * 20;

    x += xVel;
    y += yVel;
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

  void createObject(float x, float y, float xVel, float yVel, boolean isHeatseeking) {
    this.x = x;
    this.y = y;
    this.xVel = xVel;
    this.yVel = yVel;
    this.isHeatseeking = isHeatseeking;

    isDestroyed = false;
  }

  void destroyMagic() {
    isDestroyed = true;
  }
}
