class PikminItem extends Item{
 Pikmin pShots[];
 int nextShot;
 float frames;
 int seconds;
 boolean shooting;
 
  PikminItem(float x, float y){
   super(x, y, "Sprites/PikminItem.jpg");
   this.x = x;
   this. y = y;
   pShots = new Pikmin[10];
   for (int i = 0; i < 10; i++) {
      pShots[i] = new Pikmin(x, y,0,0);
    }
   name = "Pikmin";
   description = "Each shot spawns a mini guy that does half of player dmg once and dies.";
   area = "can be found in Item room or after killing boss.";
   rarity = 4;
   shooting = false;
   frames = 60;
   shotsCD = 60;
  }
  
  void update(){
   if (frames <= 0) {

      frames = 60;
      seconds++;
    }
    if (shotsCD <= 0) {
      shooting = false;
    }
  }
  
  void keyPressed(){
   if (key == CODED && !shooting) {
     // println(tempX, " ", tempY);
      shooting = true;
      if (keyCode == UP) {
        pShots[nextShot] = new Pikmin(x, y-30, 0, -shotspd + (yVelo *.5));
      } else if (keyCode == DOWN) {
        pShots[nextShot] = new Pikmin(x, y+30, 0, shotspd + (yVelo *.5));
      } else if (keyCode == LEFT) {
        pShots[nextShot] = new Pikmin(x-30, y, -shotspd + (xVelo *.5), 0);
      } else if (keyCode == RIGHT) {
        pShots[nextShot] = new Pikmin(x+30, y, shotspd + (xVelo *.5), 0);
      }
      if (nextShot == 9) {
        nextShot = 0;
      }
      nextShot++;
    } 
  }
}
