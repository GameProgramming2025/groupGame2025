class ItemRoom extends Room {
  HighNoon h;
  PikminItem p;
  SpeedForce s;

  float pedx, pedy;
  float spawn;

  ItemRoom(int x, int y) {
    super(x, y);
    this.x = x;
    this.y = y;
    pedx = width/2;
    pedy = height/2;
    spawn = random(1, 200);
    h = new HighNoon(pedx, pedy);
    p = new PikminItem(pedx, pedy);
  }

  void display() {
    rect(pedx, pedy, 150, 150);
  }

  void spawnanitem() {
    if (spawn == 1);
    if (h.rarity5 == true) {
      h.itemSpawned = true;
    }
    if(spawn >= 2 && spawn<=10){
     //rarity 4 
    }
    
    if (spawn >= 11 && spawn <=40){
     //rarity 3 
    }
    if(spawn>=41 && spawn <=100){
      //rarity 2
    }
    if(spawn>100){
      //rarity 1
    }
  }
}
