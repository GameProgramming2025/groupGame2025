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
  item(JSONObject j) {
    x = j.getFloat("x");
    y = j.getFloat("y");
    xVelo = j.getFloat("xVelo");
    yVelo = j.getFloat("yVelo");
    r = j.getFloat("r");
    s = j.getFloat("s");
    selected = j.getBoolean("selected");
  }

  JSONObject serialize() {
    JSONObject j = new JSONObject();
    j.setFloat("x", this.x);
    j.setFloat("y", this.y);
    j.setFloat("xVelo", this.xVelo);
    j.setFloat("yVelo", this.yVelo);
    j.setFloat("r", this.r);
    j.setFloat("s", this.s);
    j.setBoolean("selected", false);
    j.setString("imageFileName", imageFileName);
    return j;
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
