class ItemRoom extends Room {
  Item item;
  float spawn;
  float selected1;
  float selected2;
  float selected3;
  float selected4;
  PImage irimg;


  ItemRoom(int x, int y,boolean topOpen, boolean bottomOpen, boolean leftOpen, boolean rightOpen) {
    super(x, y,topOpen,bottomOpen,leftOpen,rightOpen);
    bc = color(random(100, 200), 100, 20);
    irimg = loadImage("Sprites/ItemRoom.png");
    spawn = random(0, 100);

    println(spawn);
    if( spawn <= 100){
     item = new HighNoon(width/2, height/2); 
    }

    if (spawn < 0.5) {
      item = new SpeedForce(width/2, height/2);
    } else if (spawn < 5) {
      item = new PikminItem(width/2, height/2);
    } else  if (spawn < 10) {
      item = new VeilOfSilence(width/2, height/2);
    } else if (spawn < 25) {
      item = new SnipSnip(width/2, height/2);
    } else if (spawn < 40) {
      item = new Shotgun(width/2, height/2);
    } else if (spawn < 70) {
      item = new TwoUP(width/2, height/2);
    } else if (spawn <= 100) {
      item = new TwoUP(width/2, height/2);

    }
    irimg.resize(width, height);

  }

  void display() {
    imageMode(CORNER);
    image(irimg, 0, 0);
    super.display();
    if (item != null) {
      item.display();
    }
  }
  
  
  Item getItem() {
    return item;
  }
  
  void setItem(Item setItem) {
    this.item = setItem;
  }
}
