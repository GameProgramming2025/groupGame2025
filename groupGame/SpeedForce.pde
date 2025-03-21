class SpeedForce extends Item{
  
  SpeedForce(float x, float y){
   super(x,y,"Sprites/SpeedForce.png");
    this.x=x;
    this.y=y;
    name = "SpeedForce";
    description = "If you know you know no more shooting";
    area = "when Kanon says it can spawn";
    rarity = 5;
    spd = 10;
    maxspd = 7;
  }
  
  void update(){
    
  }
  
  void keyPressed(){
   if(key == 'k'){
    itemSpawned = true;
   }
  }
}
