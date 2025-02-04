class item {
  float x;
  float y;
  float xVelo;
  float yVelo;
  float s;
  float r;
  PImage itemImg;
  String name;
  String description;
  String area;
  String imageFileName;
  int rarity;
  int amount;
  boolean selected;

  item(float x, float y, String imageFileName) {
    this.x = x;
    this.y = y;
    this.imageFileName = imageFileName;
    itemImg = loadImage(imageFileName);
    itemImg.resize(80, 80);
    name = "Item";
    description = "An item in the game";
    rarity = 3;
    area = "Where it can be found";
    amount = 1;
    selected = false;
  }

  void display() {
    push();
    translate(x, y);
    rotate(r);
    scale(s);
    render();
    pop();
  }
  
  void render() {
  }
  
  void keyPressed() {
    if (!selected) {
      return;
    }
  }

  void keyReleased() {
    if (!selected) {
      return;
    }
  }
}
