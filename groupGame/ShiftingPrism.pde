class ShiftingPrism extends Item {

  ShiftingPrism(float x, float y) {
    super(x, y, "Sprites/ShiftingPrism.png");
    this.x = x;
    this.y = y;
    name = "Shifting Prism";
    description = "crystal that randomizes stats";
    area = "Item Room";
    rarity = 2;
    atk = random(-50,50);
    shotsCD = (int)random(-30,15);
    shotspd = random(-30, 30);
    range = random(-499,500);
  }
  ShiftingPrism(JSONObject j) {
    super(j);
  }
  JSONObject serialize() {
    JSONObject j = super.serialize();
    j.setString("class", "ShiftingPrism");
    return j;
  }
  void update(){
   super.update(); 
  }
  void render() {
    super.render();
    rarity = 2;
  }
}
