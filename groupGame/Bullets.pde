class Bullet {
  float x;
  float y;
  float xVelo;
  float yVelo;


  Bullet(float x, float y) {
    this.x = x;
    this.y = y;
    xVelo = 0;
    yVelo = 0;
  }

  void update() {
    x += xVelo;
    y += yVelo;
  }
  void display() {
    push();
    translate(x, y);
    fill(#000000);
    ellipseMode(CENTER);
    ellipse(0, 0, 10, 10);
    pop();
  }
}
