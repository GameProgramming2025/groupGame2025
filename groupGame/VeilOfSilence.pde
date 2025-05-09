class VeilOfSilence extends Item {

  VeilOfSilence(float x, float y) {
    super(x, y, "Sprites/VeilOfSilence.png");
    this.x = x;
    this.y = y;
    name = "Shifting Prism";
    description = "A light, ethereal fabric that shifts with the shadows, this veil grants its wearer the ability to move with deadly precision, and impossible speeds";
    area = "Item Room";
    rarity = 4;
    xSize = -20;
    ySize = -20;
    spd = 2;
    atk = 5;
  }

  VeilOfSilence(JSONObject j) {
    super(j);
  }
  JSONObject serialize() {
    JSONObject j = super.serialize();
    j.setString("class", "VeilOfSilence");
    return j;
  }
  void update(){
   super.update(); 
  }
  void render() {
    super.render();
    rarity = 4;
  }
}
