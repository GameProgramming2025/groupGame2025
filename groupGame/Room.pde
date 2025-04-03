class Room {
  int x;
  int y;
  int bc;
  
  int numEnemies;
  int num;
  int time;
  int numImages = 3;
  PImage img;

  Room(int x, int y) {
    this.x=x;
    this.y=y;
    
    bc = color(random(100, 200), 100, 20);

    //println(num);

    //num = 0;
    num = int(random(0, 13));

    println(num);

    //NORMAL ROOMS
    num = 0;
    
    //ITEM ROOMS
    if (x == y) {
      num = 13; //ItemRoom
    }
    
    //TRAP ROOMS(CONTAINS ENEMIES)
    if (x == 6 - y) {
      num = 12; //TrapRoom
    }

    //EDGE ROOMS
    if (x == 0) {
      num = 4; //NoWestDoor
    } else if(x == 6) {
      num = 1; //NoEastDoor
    }
    
    if (y == 0) {
      num = 2; //NoNorthDoor
    } else if (y == 6) {
      num = 3; //NoSouthDoor
    }
    
    //BOSS ROOM
    if (x == 3 && y == 3) {
      num = 14; //BossRoom
    }
    
    //CORNER ROOMS
    if (x == 0 && y == 0) {
      num = 8; //NoNorthWest
    } else if (x == 0 && y == 6) {
      num = 10; //NoSouthWest
    } else if (x == 6 && y == 0) {
      num = 7; //NoNorthEast
    } else if (x == 6 && y == 6) {
      num = 11; //NoSouthEast
    }
    
    //ROOMS

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
    if (num == 7) {
      img = loadImage("Sprites/DoorNoNorthEast.png");
    }
    if (num == 8) {
      img = loadImage("Sprites/DoorNoNorthWest.png");
    }
    if (num == 9) {
      img = loadImage("Sprites/DoorNoNorthEastWest.png");
    }
    if (num == 10) {
      img = loadImage("Sprites/DoorNoSouthWest.png");
    }
    if (num == 11) {
      img = loadImage("Sprites/DoorNoSouthEast.png");
    }
    if (num == 12) {
      img = loadImage("Sprites/TrapRoom.png");
    }
    if (num == 13) {
      img = loadImage("Sprites/ItemRoom.png");
    }
    if (num == 14) {
      img = loadImage("Sprites/BossRoom.png");
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


  void constrainPlayer(Player p) {

    if (p.x > 1470 && p.y < 550) {//top left wall
      p.x = 1470;
    } else if (p.x > 1470 && p.y > 725) {//bottom left wall
      p.x = 1470;
    } else if (p.x > width) {//right
      p.x = 40;
      currentI++;
    }

    //left side
    if (p.x < 250 && p.y < 550) {//top left wall
      p.x = 250;
    } else if (p.x < 250 && p.y > 725) {//bottom left wall
      p.x = 250;
    } else if (p.x < 0) {//left
      p.x = width-40;
      currentI--;
    }

    //top side
    if (p.x > 240 && p.x < 765 && p.y < 267 && p.y > 257) {//top left wall
      p.y=266;
    } else if (p.x > 918 && p.x < 1476 && p.y < 267 && p.y > 257) {//top right wall
      p.y=266;
    }

    //bottom side
    if (p.x > 240 && p.x < 765 && p.y > 933 && p.y < 943) {//bottom left wall
      p.y=932;
    } else if (p.x > 918 && p.x < 1476 && p.y > 933 && p.y < 943) {//bottom right wall
      p.y=932;
    }

    // different rooms

    if (currentRoom.num == 1) {
      if (p.x > 1470 && p.y > 266 && p.y < 925) {//right wall
        p.x = 1470;
      }
    }
    if (currentRoom.num == 2) {
      if (p.y < 267 && p.y > 257 && p.x > 240 && p.x < 1476) {//top wall
        p.y=266;
      }
    }
    if (currentRoom.num == 3) {
      if (p.y > 933 && p.y < 943 && p.x > 240 && p.x < 1476) {//bottom wall
        p.y=932;
      }
    }
    if (currentRoom.num == 4) {
      if (p.x < 255 && p.y > 266 && p.y < 932 ) {//left wall
        p.x=256;
      }
    }
    if (currentRoom.num == 5) { //left,bottom,right wall
      if (p.x < 255 && p.y > 266 && p.y < 932 ) {//left
        p.x=256;
      } else if (p.y > 933 && p.y < 943 && p.x > 240 && p.x < 1476) {//bottom wall
        p.y=932;
      } else if (p.x > 1470 && p.y > 266 && p.y < 925) {//right wall
        p.x = 1469;
      }
    }
    if (currentRoom.num == 6) { //left,right wall
      if (p.x < 255 && p.y > 266 && p.y < 932 ) {//left wall
        p.x=256;
      } else if (p.x > 1470 && p.y > 266 && p.y < 925) {//right wall
        p.x = 1469;
      }
    }
    if (currentRoom.num == 7) {//top,right wall
      if (p.x > 1470 && p.y > 266 && p.y < 925) {//right wall
        p.x = 1469;
      } else if (p.y < 267 && p.y > 257 && p.x > 240 && p.x < 1476) {//top wall
        p.y=266;
      }
    }
    if (currentRoom.num == 8) {//left,right,top wall
      if (p.x < 255 && p.y > 266 && p.y < 932 ) {//left wall
        p.x=256;
      }
      if (p.x > 1470 && p.y > 266 && p.y < 925) {//right wall
        p.x = 1469;
      } else if (p.y < 267 && p.y > 257 && p.x > 240 && p.x < 1476) {//top wall
        p.y=266;
      }
    }
    if (currentRoom.num == 9) {
      if (p.x < 255 && p.y > 266 && p.y < 932 ) {//left wall
        p.x=256;
      } else if (p.y > 933 && p.y < 943 && p.x > 240 && p.x < 1476) {//bottom wall
        p.y=932;
      }
    }
    if (currentRoom.num == 11 || currentRoom.num == 12) {//left,right wall
      if (p.x < 255 && p.y > 266 && p.y < 932 ) {//left wall
        p.x=256;
      }
      if (p.x > 1470 && p.y > 266 && p.y < 925) {//right wall
        p.x = 1469;
      }
    }
  }
}
