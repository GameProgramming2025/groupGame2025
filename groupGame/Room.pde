class Room {
  int x;
  int y;
  int bc;
  int num;
  PImage img;

  Room(int x, int y) {
    this.x=x;
    this.y=y;
    bc = color(random(100, 200), 100, 20);
    this.num = 12;
    if (this.num == 0 ) {
      img = loadImage("Sprites/BGFourDoors.png");
    }
    if (this.num == 1) {
      img = loadImage("Sprites/BGNoEastDoor.png");
    }
    if (this.num == 2) {
      img = loadImage("Sprites/BGNoNorthDoor.png");
    }
    if (this.num == 3) {
      img = loadImage("Sprites/BGNoSouthDoor.png");
    }
    if (this.num == 4) {
      img = loadImage("Sprites/BGNoWestDoor.png");
    }
    if (this.num == 5) {
      img = loadImage("Sprites/BGNoWestEastSouth.png");
    }
    if (this.num == 6) {
      img = loadImage("Sprites/BGNoWestOrEast.png");
    }
    if (this.num == 7) {
      img = loadImage("Sprites/BossRoom.png");
    }
    if (this.num == 8) {
      img = loadImage("Sprites/DoorNoNorthEast.png");
    }
    if (this.num == 9) {
      img = loadImage("Sprites/DoorNoNorthEastWest.png");
    }
    if (this.num == 10) {
      img = loadImage("Sprites/DoorNoWestSouth.png");
    }
    if (this.num == 11) {
      img = loadImage("Sprites/ItemRoom.png");
    }
    if (this.num == 12) {
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
