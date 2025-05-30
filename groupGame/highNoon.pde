class HighNoon extends Item {

  HighNoon(float x, float y) {
    super(x, y, "Sprites/HN.png");
    this.x=x;
    this.y=y;
    name = "highNoon";
    description = "Makes Shot cooldown longer but makes you do more damage";
    area = "can be found in Item rooms";
    rarity = 2;
    atk = 15;
    shotsCD = 20;
    collected = false;
    shotspd = 30;
  }

  HighNoon(JSONObject j) {
    super(j);
  }
  
  JSONObject serialize() {
    JSONObject j = super.serialize();
    j.setString("class", "highNoon");
    return j;
  }
  void update(){
   super.update(); 
  }
  void render() {
    
    super.render();
  }
  
  
  
}
