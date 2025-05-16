class Decoration {
  PImage decor;
  int type;
  float xPos;
  float yPos;

  Decoration(int type, float xPos, float yPos) {
    this.type = type;
    this.xPos = xPos;
    this.yPos = yPos;
    decor = loadImage("Sprites/Items.png");
    if (type == 1) {
      decor.get(0, 0, 96, 96);
    }
    if (type == 2) {
      decor.get(96, 0, 96, 96);
    }
  }

  void update() {
  }
  void display() {
    image(decor, xPos, yPos);
  }
}
