class highNoon extends Item{
  
  highNoon(float x, float y){
    super(x,y,"highNoon.png");
    this.x=x;
    this.y=y;
    name = "highNoon";
    description = "Makes Shot cooldown longer but makes you do more damage";
    area = "can be found in Item rooms";
    rarity = 3;
    dmg = 10;
    shotCD = 0;
  }
  
  highNoon(JSONObject j) {
      super(j);
  }
  JSONObject serialize() {
    JSONObject j = super.serialize();
    j.setString("class","highNoon");
    return j;
  }
  void render() {
    super.render();
    rarity = 3;
    
  }
}
