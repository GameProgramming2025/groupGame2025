class ItemRoom extends Room {
  Item item;
  float pedx, pedy;
  float spawn;
  float selected1;
  float selected2;
  float selected3;
  float selected4;


  ItemRoom(int x, int y) {
    super(x, y, 13);
    this.x = x;
    this.y = y;
    pedx = width/2;
    pedy = height/2;
    spawn = random(1, 200);
    selected1 = random(1, 2);
    selected2 = random(1, 2);
    selected3 = random(1, 2);
    selected4 = random(1, 3);
    if (spawn == 1) {
      item = new SpeedForce(pedx, pedy);
    }
    if (spawn >= 2 && spawn<=10) {
      if (selected1 == 1) {
        item = new PikminItem(pedx, pedy);
      }
      if (selected1 == 2) {
        //spawn rarity 4 item
        item = new VeilOfSilence(pedx, pedy);
      }
    }

    if (spawn >= 11 && spawn <=40) {
      if (selected2 == 1) {
        item = new SnipSnip(pedx, pedy);
      }
      if (selected2 == 2) {
        //spawn rarity 3 item
        //item = new Heatseeker(pedx, pedy);
      }
    }
    if (spawn>=41 && spawn <=100) {
      if (selected3 == 1) {
        item = new HighNoon(pedx, pedy);
      }
      if (selected3 == 2) {
        //spawn rarity 2 item
        item = new ShiftingPrism(pedx, pedy);
      }
    }
    if (spawn>100) {
      if (selected4 == 1) {
      }
      if (selected4 == 2) {
      }
      if (selected4 == 3) {
        //spawn rarity 1 item
      }
    }
    if (item != null){
     item.display(); 
    }
  }

  void display() {
    super.display();
    rect(pedx, pedy, 150, 150);
  }
}
