class Pikmin {
  float x, y, xVelo, yVelo;
  PImage Pikmin;

  Pikmin(float x, float y, float xVelo, float yVelo) {
    this.x = x;
    this.y = y;
    this.xVelo = xVelo;
    this.yVelo = yVelo;
    Pikmin = loadImage("Sprites/PikminItem.png");
    Pikmin.resize(50, 50);
  }

  void update() {
    x += xVelo;
    y += yVelo;
  }

  void display() {
    image(Pikmin, x, y);
  }
}
