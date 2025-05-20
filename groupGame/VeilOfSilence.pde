class VeilOfSilence extends Item {

  VeilOfSilence(float x, float y) {
    super(x, y, "Sprites/VeilOfSilence.png");
    this.x = x;
    this.y = y;
    name = "Shifting Prism";
    description = "makes you smaller and faster using the power of the dark";
    area = "Item Room";
    rarity = 4;
    xSize = -20;
    ySize = -20;
    spd = 2;
    atk = 10;
    range = -200;
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
