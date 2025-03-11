class Room {
  int x;
  int y;
  int bc;
  int num;
  int time;
  int numImages = 3;
  PImage img;

  Room(int x, int y) {
    println(num);
    this.x=x;
    this.y=y;
    bc = color(random(100, 200), 100, 20);
    
    num = int(random(0,13));
    println(num);
    //num = 12;

    if (num == 0) {
      img = loadImage("Sprites/BGFourDoors.png");     
    }
    if (num == 1 ) {
      img = loadImage("Sprites/BGNoEastDoor.png");
    }
    if (num == 2) {
      img = loadImage("Sprites/BGNoNorthDoor.png");
    }
    if (num == 3) {
      img = loadImage("Sprites/BGNoSouthDoor.png");
    }
    if (num == 4) {
      img = loadImage("Sprites/BGNoWestDoor.png");
    }
    if (num == 5) {
      img = loadImage("Sprites/BGNoWestEastSouth.png");
    }
    if (num == 6) {
      img = loadImage("Sprites/BGNoWestOrEast.png");
    }
    if (num == 12) {
      img = loadImage("Sprites/BossRoom.png");
    }
    if (num == 7) {
      img = loadImage("Sprites/DoorNoNorthEast.png");
    }
    if (num == 8) {
      img = loadImage("Sprites/DoorNoNorthEastWest.png");
    }
    if (num == 9) {
      img = loadImage("Sprites/DoorNoWestSouth.png");
    }
    if (num == 11) {
      img = loadImage("Sprites/ItemRoom.png");
    }
    if (num == 10) {
      img = loadImage("Sprites/TrapRoom.png");
    }
    img.resize(width, height);
  }

  void display () {
    push();
    rectMode(CORNER);
    fill(bc);
    strokeWeight(10);
    stroke(90);
    rect(20, 20, width-40, height-40);
    image(img, 0, 0);
    pop();
  }

  void update () {
  }
}
