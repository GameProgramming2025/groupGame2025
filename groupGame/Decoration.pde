class Decoration {
  PImage decor;
  int type;
  float xPos;
  float yPos;
  int currentSprite;


  Decoration(int type, float xPos, float yPos) {
    this.type = type;
    this.xPos = xPos;
    this.yPos = yPos;
    this.currentSprite = type;
    PImage spritesheet = loadImage("Sprites/Items.png");

    if (type == 1) {
      decor = spritesheet.get(0, 0, 96, 96);
    }
    if (type == 2) {
      decor = spritesheet.get(96, 0, 96, 96);
    }
    if (type == 3) {
      decor = spritesheet.get(192, 0, 96, 96);
    }
    if (type == 4) {
      decor = spritesheet.get(0, 96, 96, 96);
    }
    if (type == 5) {
      decor = spritesheet.get(96, 96, 96, 96);
    }
    if (type == 6) {
      decor = spritesheet.get(192, 96, 96, 96);
    }
    //moving sprites
    if (type == 7) {
      decor = spritesheet.get(96, 192, 96, 96);
    }
    if (type == 8) {
      decor = spritesheet.get(96, 192, 96, 96);
    }
    //non moving
    if (type == 9) {
      decor = spritesheet.get(96, 192, 96, 96);
    }
    if (type == 10) {
      decor = spritesheet.get(96, 288, 96, 96);
    }
  }

  void update() {
  }
  void display() {
    image(decor, xPos, yPos);
  }
}
