class ShiftingPrism extends Item {

  ShiftingPrism(float x, float y) {
    super(x, y, "Sprites/ShiftingPrism.png");
    this.x = x;
    this.y = y;
    name = "Shifting Prism";
    description = "A mysterious, multi-faceted crystal that pulses with an otherworldly glow. Its power is unpredictable, shifting its essence with every use.";
    area = "Item Room";
    rarity = 2;
    atk = random(5,30);
    shotsCD = (int)random(-30,30);
    shotspd = random(5, 15);
    range = random(100,1000);
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
