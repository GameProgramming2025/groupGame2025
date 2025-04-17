class ItemRoom extends Room {
  Item item;
  float spawn;
  float selected1;
  float selected2;
  float selected3;
  float selected4;


  ItemRoom(int x, int y,boolean topOpen, boolean bottomOpen, boolean leftOpen, boolean rightOpen) {
    super(x, y,topOpen,bottomOpen,leftOpen,rightOpen);
    this.x = x;
    this.y = y;
    spawn = random(0, 100);
    num = 13;
    println(spawn);
    if (spawn < 0.5) {
      item = new SpeedForce(width/2, height/2);
    } else if (spawn <5) {
      item = new PikminItem(width/2, height/2);
    } else  if (spawn < 10) {
      item = new VeilOfSilence(width/2, height/2);
    } else if (spawn < 25) {
      item = new SnipSnip(width/2, height/2);
    } else if (spawn < 40) {
      //item = new Heatseeker(pedx, pedy);
    } else if (spawn < 70) {
      item = new HighNoon(width/2, height/2);
    } else if (spawn < 100) {
      item = new ShiftingPrism(width/2, height/2);
    }
  }

  void display() {
    num = 13;
    super.display();
    if (item != null) {
      item.display();
    }
  }
}
