class Magic {
  float x, y, xVel, yVel;

  Magic(float x, float y, float xVel, float yVel) {
    this.x = x;
    this.y = y;
    this.xVel = xVel;
    this.yVel = yVel;
  }

  void update() {
    x += xVel;
    y += yVel;
    //check if this hits other things
  }
  
  void display() {
    ellipse(x, y, 10, 10);
  }
}
