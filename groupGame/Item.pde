class Item {
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
  int HP, shotsCD, maxspd;
  float spd, atk, range, shotspd, xSize, ySize;
  boolean collected;
  boolean itemSpawned;
  String rarityStr = "Common";

  Item(float x, float y, String imageFileName) {
    this.x = x;
    this.y = y;
    this.imageFileName = imageFileName;

    if (imageFileName != null) {
      itemImg = loadImage(imageFileName);
      itemImg.resize(50, 50);
    }
    name = "Item";
    description = "An item in the game";
    rarity = 3;
    area = "Where it can be found";
    amount = 1;
    HP = 0;
    shotsCD = 0;
    spd = 0;
    maxspd = 0;
    atk = 0;
    range = 0;
    shotspd = 0;
    xSize = 0;
    ySize = 0;
    collected = false;
  }


  Item(JSONObject j) {
    x = j.getFloat("x");
    y = j.getFloat("y");
    xVelo = j.getFloat("xVelo");
    yVelo = j.getFloat("yVelo");
    r = j.getFloat("r");
    s = j.getFloat("s");
  }

  JSONObject serialize() {
    JSONObject j = new JSONObject();
    j.setFloat("x", this.x);
    j.setFloat("y", this.y);
    j.setFloat("xVelo", this.xVelo);
    j.setFloat("yVelo", this.yVelo);
    j.setFloat("r", this.r);
    j.setFloat("s", this.s);
    j.setString("imageFileName", imageFileName);
    return j;
  }
  void display() {
    push();
    translate(x, y);
    rotate(0);
    scale(1);
    render();
    pop();
  }

  void update() {
    HP += p1.HP;
    atk += p1.atk;
    shotsCD += p1.shotsCD;
    maxspd += p1.maxspd;
    spd += p1.spd;
    range += p1.range;
    shotspd += p1.shotspd;
    xSize += p1.xSize;
    ySize += p1.ySize;
  }

  void render() {
    if ( collected == true) {
      return;
    }
    imageMode(CENTER);
    image(itemImg, 0, 0);
  }

  void renderDetails() {
    if (rarity == 1) {
      rarityStr = "Common";
      fill(#1E4828, 200);
    }
    if (rarity == 2) {
      rarityStr = "Uncommon";
      fill(#014694, 200);
    }
    if (rarity == 3) {
      rarityStr = "Rare";
      fill(#6e4888, 200);
    }
    if (rarity == 4) {
      rarityStr = "Legendary";
      fill(#6E4828, 200);
    }
    if (rarity == 5) {
      rarityStr = "Mythical";
      fill(#95bbe6, 200);
    }
  }
  void keyPressed() {
  }

  void keyReleased() {
  }
}
