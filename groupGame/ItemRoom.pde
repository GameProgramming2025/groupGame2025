class ItemRoom extends Room {
  Player p1;
  HighNoon h;
  PikminItem p;
  SpeedForce s;
  SnipSnip sn;
  Heatseeker hs;

  float pedx, pedy;
  float spawn;
  float selected1;
  float selected2;
  float selected3;
  float selected4;
  

  ItemRoom(int x, int y) {
    super(x, y);
    this.x = x;
    this.y = y;
    pedx = width/2;
    pedy = height/2;
    spawn = random(1, 200);
    selected1 = random(1,2);
    selected2 = random(1,2);
    selected3 = random(1,2);
    selected4 = random(1,3);
    h = new HighNoon(pedx, pedy);
    p = new PikminItem(pedx, pedy);
  }

  void display() {
    rect(pedx, pedy, 150, 150);
  }
  
  void update(){
   if(dist(pedx,pedy,p1.x,p1.y)<75){
    spawnanitem(); 
   }
  }

  void spawnanitem() {
    if (spawn == 1){
    s.itemSpawned = true;
    }
    if(spawn >= 2 && spawn<=10){
     if(selected1 == 1){
       p.itemSpawned = true;
     }
     if(selected1 == 2){
       //spawn rarity 4 item
     }
    }
    
    if (spawn >= 11 && spawn <=40){
     if(selected2 == 1){
       sn.itemSpawned = true;
     }
     if(selected2 == 2){
       //spawn rarity 3 item
      hs.itemSpawned = true; 
     }
    }
    if(spawn>=41 && spawn <=100){
      if(selected3 == 1){
       h.itemSpawned= true;
     }
     if(selected3 == 2){
       //spawn rarity 2 item
       
     }
    }
    if(spawn>100){
      if(selected4 == 1){
       
     }
     if(selected4 == 2){
       
     }
     if(selected4 == 3){
       //spawn rarity 1 item
     }
    }
  }
}
