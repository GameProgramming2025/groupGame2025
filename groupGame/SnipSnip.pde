class SnipSnip extends Item{
  
 SnipSnip(float x, float y){
  super(x,y,"Sprites/SnipSnip.png");
  this.x = x;
  this.y = y;
  name = "SnipSnip";
  description = "increae range and dmg lower shot spd";
  area = "Item Room";
  rarity = 3;
  range = 600;
  atk = 50;
  shotsCD = 60;
  shotspd = 80;
 }
 SnipSnip(JSONObject j) {
    super(j);
  }
  JSONObject serialize() {
    JSONObject j = super.serialize();
    j.setString("class", "SnipSnip");
    return j;
  }
  void update(){
   super.update(); 
  }
  void render() {
    super.render();
    rarity = 3;
  }
}
