class Room {
  Item item;
  Decoration[] decor;

  Enemy[] enemies;
  int roomI;
  int roomJ;
  int bc;
  int currentDecor;
  boolean topOpen;
  boolean bottomOpen;
  boolean leftOpen;
  boolean rightOpen;
  PImage img;
  PImage topDoor;
  PImage rightDoor;
  PImage leftDoor;
  PImage bottomDoor;

  Room(int roomI, int roomJ, boolean topOpen, boolean bottomOpen, boolean leftOpen, boolean rightOpen) {
    item = new EmptyItem(-100, -100);
    this.roomI = roomI;
    this.roomJ = roomJ;
    this.topOpen = topOpen;
    this.bottomOpen=bottomOpen;
    this.leftOpen=leftOpen;
    this.rightOpen=rightOpen;

    bc = color(random(100, 200), 100, 20);
    img = loadImage("Sprites/BGFourDoors.png");
    topDoor = loadImage("Sprites/DoorTop.png");
    rightDoor = loadImage("Sprites/DoorRight.png");
    leftDoor = loadImage("Sprites/DoorLeft.png");
    bottomDoor = loadImage("Sprites/DoorBottom.png");

    currentDecor = 0;

    decor = new Decoration[2];
    int dumber = int(random(1, 11));
    int ranheight = int(random(305, 900));
    int ranwidth = int(random(1275, 1450));
    //int randHeight =
    decor[0] = new Decoration(dumber, ranwidth, ranheight);
    dumber = int(random(1, 11));
    ranheight = int(random(305, 936));
    ranwidth = int(random(245, 575));
    decor[1] = new Decoration(dumber, ranwidth, ranheight);
    println(dumber);

    //num = int(random(0, 13));
    ////NORMAL ROOMS
    //num = 0;

    ////ITEM ROOMS
    //if (x == y) {
    //  num = 13; //ItemRoom
    //}

    ////TRAP ROOMS(CONTAINS ENEMIES)
    //if (x == 6 - y) {
    //  num = 12; //TrapRoom
    //}

    ////EDGE ROOMS
    //if (x == 0) {
    //  num = 4; //NoWestDoor
    //} else if (x == 6) {
    //  num = 1; //NoEastDoor
    //}

    //if (y == 0) {
    //  num = 2; //NoNorthDoor
    //} else if (y == 6) {
    //  num = 3; //NoSouthDoor
    //}

    ////BOSS ROOM
    //if (x == 3 && y == 3) {
    //  num = 14; //BossRoom
    //}

    ////CORNER ROOMS
    //if (x == 0 && y == 0) {
    //  num = 8; //NoNorthWest
    //} else if (x == 0 && y == 6) {
    //  num = 10; //NoSouthWest
    //} else if (x == 6 && y == 0) {
    //  num = 7; //NoNorthEast
    //} else if (x == 6 && y == 6) {
    //  num = 11; //NoSouthEast
    //}

    ////ROOMS

    //if (num == 0) {
    //  img = loadImage("Sprites/BGFourDoors.png");
    //}
    //if (num == 1 ) {
    //  img = loadImage("Sprites/BGNoEastDoor.png");
    //}
    //if (num == 2) {
    //  img = loadImage("Sprites/BGNoNorthDoor.png");
    //}
    //if (num == 3) {
    //  img = loadImage("Sprites/BGNoSouthDoor.png");
    //}
    //if (num == 4) {
    //  img = loadImage("Sprites/BGNoWestDoor.png");
    //}
    //if (num == 5) {
    //  img = loadImage("Sprites/BGNoWestEastSouth.png");
    //}
    //if (num == 6) {
    //  img = loadImage("Sprites/BGNoWestOrEast.png");
    //}
    //if (num == 7) {
    //  img = loadImage("Sprites/DoorNoNorthEast.png");
    //}
    //if (num == 8) {
    //  img = loadImage("Sprites/DoorNoNorthWest.png");
    //}
    //if (num == 9) {
    //  img = loadImage("Sprites/DoorNoNorthEastWest.png");
    //}
    //if (num == 10) {
    //  img = loadImage("Sprites/DoorNoSouthWest.png");
    //}
    //if (num == 11) {
    //  img = loadImage("Sprites/DoorNoSouthEast.png");
    //}
    //if (num == 12) {
    //  img = loadImage("Sprites/TrapRoom.png");

    //  numEnemies = 7;
    //  enemies = new Enemy[numEnemies];
    //  for (int i = 0; i < numEnemies; i++) {
    //    ex = random(252, 1466);
    //    ey = random(282, 945);
    //    enemies[i] = new Enemy(ex, ey);
    //  }
    //}
    //if (num == 13) {
    //  img = loadImage("Sprites/ItemRoom.png");
    //}
    //if (num == 14) {
    //  img = loadImage("Sprites/BossRoom.png");
    //}


    img.resize(width, height);
    topDoor.resize(width, height);
    rightDoor.resize(width, height);
    leftDoor.resize(width, height);
    bottomDoor.resize(width, height);
  }

  void display () {
    push();
    rectMode(CORNER);
    imageMode(CORNER);
    fill(bc);
    //strokeWeight(10);
    //stroke(90);
    if (this instanceof ItemRoom == false && this instanceof HealthRoom == false) {
      image(img, 0, 0);
    }
    joshshouldofdonethisthefirsttimebutkanonhadtofixit();
    for (Decoration d : decor) {
      d.update();
      d.display();
    }
    pop();

    fill(255, 50);
    textSize(400);
    textAlign(CENTER, CENTER);
    text(roomI + ", " + roomJ, width/2, height/2);
  }

  void update () {
  }

  void constrainPlayer(Player p) {
    //top
    //println(p.x);
    if (p.y < 305) {
      if (p.x > width * 0.4 && p.x < width * 0.6 && topOpen) {
        currentJ--;
        p.y = height-265;
      } else {
        p.y = 305;
      }
    }

    //bottom
    if (p.y > height-265) {
      if (p.x > width * 0.4 && p.x < width * 0.6 && bottomOpen) {
        currentJ++;
        p.y = 305;
      } else {
        p.y = height-265;
      }
    }


    //left
    if (p.x < 245) {
      if (p.y > height * 0.3 && p.y < height * 0.7 && leftOpen) {
        currentI--;
        p.x = width-245;
      } else {
        p.x = 245;
      }
    }


    //right
    if (p.x > width - 225) {
      if (p.y > height * 0.3 && p.y < height * 0.7 && rightOpen) {
        currentI++;
        p.x = 265;
      } else {
        p.x = width-225;
      }
    }
  }
  // no changing function name
  void joshshouldofdonethisthefirsttimebutkanonhadtofixit() {
    if (!topOpen) {
      image(topDoor, 0, 0);
    }
    if (!rightOpen) {
      image(rightDoor, 0, 0);
    }
    if (!leftOpen) {
      image(leftDoor, 0, 0);
    }
    if (!bottomOpen) {
      image(bottomDoor, 0, 0);
    }
  }

  Item getItem() {
    return item;
  }

  void setItem(Item setItem) {
    this.item = setItem;
  }
  
  void keyPressed(){
   
  }
}
