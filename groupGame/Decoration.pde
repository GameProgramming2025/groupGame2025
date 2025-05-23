class Decoration {
  PImage decor;
  int type;
  float xPos;
  float yPos;
  int currentSprite;
  int timer;
  int timerdos;


  Decoration(int type, float xPos, float yPos) {
    this.type = type;
    this.xPos = xPos;
    this.yPos = yPos;
    this.currentSprite = type;
    timer = 15;
    timerdos= 15;
    decorSpritesheet = loadImage("Sprites/Items.png");

    if (type == 1) {
      decor = decorSpritesheet.get(0, 0, 96, 96);
    }
    if (type == 2) {
      decor = decorSpritesheet.get(96, 0, 96, 96);
    }
    if (type == 3) {
      decor = decorSpritesheet.get(192, 0, 96, 96);
    }
    if (type == 4) {
      decor = decorSpritesheet.get(0, 96, 96, 96);
    }
    if (type == 5) {
      decor = decorSpritesheet.get(96, 96, 96, 96);
    }
    if (type == 6) {
      decor = decorSpritesheet.get(192, 96, 96, 96);
    }
    //moving sprites
    if (type == 7) {
      decor = decorSpritesheet.get(0, 192, 96, 96);
    }
    if (type == 8) {
      decor = decorSpritesheet.get(192, 192, 96, 96);
    }
    //non moving
    if (type == 9) {
      decor = decorSpritesheet.get(96, 288, 96, 96);
    }
    if (type == 10) {
      decor = decorSpritesheet.get(192, 288, 96, 96);
    }
  }

  void update() {
    //moving sprites
    if (type == 7) {
      timer--;
      if (timer >= 8) {
        decor = decorSpritesheet.get(0, 192, 96, 96);
        if (timer <= 7) {
          decor = decorSpritesheet.get(96, 192, 96, 96);
          if (timer <= 0) {
            timer = 15;
          }
        }
      }
    }
    if (type == 8) {
      timerdos--;
      if (timerdos >= 8) {
        decor = decorSpritesheet.get(192, 192, 96, 96);
        if (timerdos <= 7) {
          decor = decorSpritesheet.get(0, 288, 96, 96);
          if (timerdos <= 0) {
            timerdos = 15;
          }
        }
      }
    }
  }
  void display() {
    image(decor, xPos, yPos);
  }
}
