class Room {
  int roomI;
  int roomJ;
  int bc;
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
 

    ////println(num);

    ////num = 0;
    //num = int(random(0, 13));

    //println(num);

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

    //    numEnemies = 7;
    //    enemies = new Enemy[numEnemies];
    //    for (int i = 0; i < numEnemies; i++) {
    //      ex = random(252, 1466);
    //      ey = random(282, 945);
    //      enemies[i] = new Enemy(ex, ey);
    //    }
    //  }
  }

  void display () {
    push();
    rectMode(CORNER);
    imageMode(CORNER);
    fill(bc);
    strokeWeight(10);
    stroke(90);
    rect(20, 20, width-40, height-40);
    image(img, 0, 0);
    if (!topOpen){
    image(topDoor, 0, 0);
    }
    if (!rightOpen){
    image(rightDoor, 0, 0);
    }
    if (!leftOpen){
    image(leftDoor, 0, 0);
    }
    if (!bottomOpen){
    image(bottomDoor, 0, 0);
    }
    pop();

    //if (currentRoom.num == 12) {
    //  for (Enemy e : enemies) {
    //    e.display();
    //  }
    //}
    fill(255, 50);
    textSize(400);
    textAlign(CENTER, CENTER);
    text(roomI + ", " + roomJ, width/2, height/2);
  }

  void update () {
    //if (currentRoom.num == 12) {
    //  for (Enemy e : enemies) {
    //    e.update();
    //  }
    //}
  }

  void constrainPlayer(Player p) {
    //top
    println(p.x);
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
    if(p.x < 305) {
      if (p.y > height * 0.3 && p.y < height * 0.7 && leftOpen) {
        currentI--;
        p.x = width-305;
      } else {
        p.x = 305;
      }
    }
    
    
    //right
    if(p.x > width - 265) {
      if (p.y > height * 0.3 && p.y < height * 0.7 && rightOpen) {
        currentI++;
        p.x = 305;
      } else {
        p.x = width-265;
      }
    }
    
    
    
    
    
  }



    // println(p.y);
    //right side
    //if (p.x > 1470 && p.y < 550) {//top right wall
    //  p.x = 1470;
    //} else if ( p.y < 598 && p.x > 1505 && p.x < 1700) {//top right inner wall
    //  p.y = 597;
    //} else if ( p.y > 669 && p.x > 1505 && p.x < 1700) {//bottom right inner wall
    //  p.y = 668;
    //} else if (p.x > 1470 && p.y > 725) {//bottom right wall
    //  p.x = 1470;
    //} else if (p.x > width) {//right
    //  p.x = 40;
    //  currentI++;
    //}

    ////left side
    //if (p.x < 250 && p.y < 550) {//top left wall
    //  p.x = 250;
    //} else if ( p.y < 598 && p.x > 1 && p.x < 230) {//top left inner wall
    //  p.y = 597;
    //} else if ( p.y > 669 && p.x > 1 && p.x < 230) {//bottom left inner wall
    //  p.y = 668;
    //} else if (p.x < 250 && p.y > 725) {//bottom left wall
    //  p.x = 250;
    //} else if (p.x < 0) {//left
    //  p.x = width-40;
    //  currentI--;
    //}

    ////top side
    //if (p.x > 240 && p.x < 765 && p.y < 267 && p.y > 257) {//top left hallway wall
    //  p.y=266;
    //} else if (x < 755 && y < 245) { //left-side wall next to door
    //  x = 754;
    //} else if (x > 925 && y < 245) { //right-side wall next to door
    //  x = 924;
    //} else if ( p.x > 748 && p.y < 1 && p.y > 230) {//left top wall
    //  p.x = 747;
    //} else if (p.x > 918 && p.x < 1476 && p.y < 266 && p.y > 257) {//top right wall
    //  p.y=265;
    //}

    ////bottom side
    //if (p.x > 240 && p.x < 765 && p.y > 933 && p.y < 943) {//bottom left wall
    //  p.y=932;
    //} else if (p.x > 746 & p.y < 1000 && p.y > 1500) {// left-side wall next to door
    //  x = 745;
    //} else if (x > 915 && y > 995) { //right-side wall next to door
    //  x = 915;
    //} else if (p.x > 918 && p.x < 1476 && p.y > 933 && p.y < 943) {//bottom right wall
    //  p.y=932;
    //}


    //// different rooms

    //if (currentRoom.num == 1) {
    //  if (p.x > 1470 && p.y > 266 && p.y < 925) {//right wall
    //    p.x = 1470;
    //  }
    //}
    //if (currentRoom.num == 2) {
    //  if (p.y < 267 && p.y > 257 && p.x > 240 && p.x < 1476) {//top wall
    //    p.y=266;
    //  }
    //}
    //if (currentRoom.num == 3) {
    //  if (p.y > 933 && p.y < 943 && p.x > 240 && p.x < 1476) {//bottom wall
    //    p.y=932;
    //  }
    //}
    //if (currentRoom.num == 4) {
    //  if (p.x < 255 && p.y > 266 && p.y < 932 ) {//left wall
    //    p.x=256;
    //  }
    //}
    //if (currentRoom.num == 5) { //left,bottom,right wall
    //  if (p.x < 255 && p.y > 266 && p.y < 932 ) {//left
    //    p.x=256;
    //  } else if (p.y > 933 && p.y < 943 && p.x > 240 && p.x < 1476) {//bottom wall
    //    p.y=932;
    //  } else if (p.x > 1470 && p.y > 266 && p.y < 925) {//right wall
    //    p.x = 1469;
    //  }
    //}
    //if (currentRoom.num == 6) { //left,right wall
    //  if (p.x < 255 && p.y > 266 && p.y < 932 ) {//left wall
    //    p.x=256;
    //  } else if (p.x > 1470 && p.y > 266 && p.y < 925) {//right wall
    //    p.x = 1469;
    //  }
    //}
    //if (currentRoom.num == 7) {//top,right wall
    //  if (p.x > 1470 && p.y > 266 && p.y < 925) {//right wall
    //    p.x = 1469;
    //  } else if (p.y < 267 && p.y > 257 && p.x > 240 && p.x < 1476) {//top wall
    //    p.y=266;
    //  }
    //}
    //if (currentRoom.num == 8) {//left,right,top wall
    //  if (p.x < 255 && p.y > 266 && p.y < 932 ) {//left wall
    //    p.x=256;
    //  } else if (p.y < 267 && p.y > 257 && p.x > 240 && p.x < 1476) {//top wall
    //    p.y=266;
    //  }
    //}
    //if (currentRoom.num == 9) {
    //  if (p.x < 255 && p.y > 266 && p.y < 932 ) {//left wall
    //    p.x=256;
    //  } else if (p.y > 933 && p.y < 943 && p.x > 240 && p.x < 1476) {//bottom wall
    //    p.y=932;
    //  }
    //}
    //if (currentRoom.num == 11 || currentRoom.num == 12) {//left,right wall
    //  if (p.x < 255 && p.y > 266 && p.y < 932 ) {//left wall
    //    p.x=256;
    //  }
    //  if (p.x > 1470 && p.y > 266 && p.y < 925) {//right wall
    //    p.x = 1469;
    //  }
    //}

}
