class PikminItem extends Item {
  Pikmin p[];
  boolean shooting;
  float shotCD;
  int nextShot;
  
  
  PikminItem(float x, float y) {
    super(x, y, "Sprites/PikminItem.jpg");
    this.x = x;
    this. y = y;
    p = new Pikmin[10];
    for (int i = 0; i < 10; i++) {
      p[i] = new Pikmin(x, y,xVelo,yVelo);
    }
    name = "Pikmin";
    description = "Each shot spawns a mini guy that does half of player dmg once and dies.";
    area = "can be found in Item room or after killing boss.";
    rarity = 4;
    
  }
  
  void keyPressed(){
    if (key == CODED && !shooting) {
      // println(tempX, " ", tempY);
      shooting = true;
      shotCD = shotsCD;
      if (keyCode == UP) {
        p[nextShot] = new Pikmin(x, y-30, 0, -shotspd + (yVelo *.5));
      } else if (keyCode == DOWN) {
        p[nextShot] = new Pikmin(x, y+30, 0, shotspd + (yVelo *.5));
      } else if (keyCode == LEFT) {
        p[nextShot] = new Pikmin(x-30, y, -shotspd + (xVelo *.5), 0);
      } else if (keyCode == RIGHT) {
        p[nextShot] = new Pikmin(x+30, y, shotspd + (xVelo *.5), 0);
      }
      if (nextShot == 9) {
        nextShot = 0;
      }
      nextShot++;
    }
  }
}
