class HighNoon extends Item{
  
  HighNoon(float x, float y){
    super(x,y,"highNoon.png");
    this.x=x;
    this.y=y;
    name = "highNoon";
    description = "Makes Shot cooldown longer but makes you do more damage";
    area = "can be found in Item rooms";
    rarity = 3;
    atk = 10;
    shotsCD = 30;
    collected = false;
  }
  
  HighNoon(JSONObject j) {
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
