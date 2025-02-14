class Magic {
  float x, y, xVel, yVel, life;
  boolean alive;

  Magic(float x, float y, float xVel, float yVel, float life) {
    this.life = life;
    this.x = x;
    this.y = y;
    this.xVel = xVel;
    this.yVel = yVel;
  }

  void update() {
    life--;
    x += xVel;
    y += yVel;
    if (life < 0) {
      x = -4000;
      y = -4000;
    }
    //check if this hits other things
  }

  void display() {
    ellipse(x, y, 10, 10);
  }
}
