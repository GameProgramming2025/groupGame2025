class SpeedForce extends Item{
  
  SpeedForce(float x, float y){
   super(x,y,"Sprites/SpeedForce.png");
    this.x=x;
    this.y=y;
    name = "SpeedForce";
    description = "you become the flash";
    area = "when Kanon says it can spawn";
    rarity = 5;
    shotsCD = -60;
    spd = 10;
    maxspd = 7;
  }
  
 void update(){
   super.update(); 
  }
  
  void keyPressed(){
   if(key == 'k'){
    itemSpawned = true;
   }
  }
}
