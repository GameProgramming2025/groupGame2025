class Heatseeker extends Item {
  
  Heatseeker(float x, float y) {
    super(x, y, "Sprites/Heatseeker.png");
    this.x = x;
    this.y = y;
    name = "Heatseeker";
    description = "auto aim with less dmg";
    area = "Item Room";
    rarity = 3;
    
  }
  Heatseeker(JSONObject j) {
    super(j);
  }
  JSONObject serialize() {
    JSONObject j = super.serialize();
    j.setString("class", "ShiftingPrism");
    return j;
  }
  void render() {
    super.render();
    rarity = 2;
  }
}
