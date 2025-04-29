class Room {
  Item item;
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
    strokeWeight(10);
    stroke(90);
    rect(20, 20, width-40, height-40);
    image(img, 0, 0);
    joshshouldofdonethisthefirsttimebutkanonhadtofixit();
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
  
  void joshshouldofdonethisthefirsttimebutkanonhadtofixit(){
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
}
