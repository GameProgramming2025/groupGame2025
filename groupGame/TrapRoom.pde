class TrapRoom extends Room {
  Enemy enemies[];
  Slime slimes[];
  int numEnemies;
  float spawn;
  PImage img;
  protected boolean enemiesDead;
  String enemyImg;

  TrapRoom(int x, int y, boolean topOpen, boolean bottomOpen, boolean leftOpen, boolean rightOpen) {
    super(x, y, topOpen, bottomOpen, leftOpen, rightOpen);
    img = loadImage("Sprites/BGFourDoors.png");
    img.resize(width, height);
    numEnemies = 9;
    float ex, ey;
    enemies = new Enemy[numEnemies];
    enemyImg = "Data/Sprites/SlimeBasic.png";
    for (int i = 0; i < numEnemies; i++) {
      ex = random(252, 1466);
      ey = random(282, 945);
      enemies[i] = new Slime(ex, ey,enemyImg);
    }
  }

  void display() {
    super.display();

    enemiesDead = true;
    for (Enemy e : enemies) {
      e.update();
      if (e.enemyHealth > 0) {
        enemiesDead = false;
      }
      e.display();
    }
  }
  
  void update() {
    super.update();
  }

  void showDoors() {
    if (!enemiesDead) {
      image(topDoor, 0, 0);
      image(bottomDoor, 0, 0);
      image(leftDoor, 0, 0);
      image(rightDoor, 0, 0);
    } else {
      super.showDoors();
    }
  }

  void constrainPlayer(Player p) {
    //top
    //println(p.x);
    if (p.y < 305) {
      if (p.x > width * 0.4 && p.x < width * 0.6 && topOpen && enemiesDead ) {
        currentJ--;
        p.y = height-265;
      } else {
        p.y = 305;
      }
    }

    //bottom
    if (p.y > height-265) {
      if (p.x > width * 0.4 && p.x < width * 0.6 && bottomOpen && enemiesDead ) {
        currentJ++;
        p.y = 305;
      } else {
        p.y = height-265;
      }
    }


    //left
    if (p.x < 245) {
      if (p.y > height * 0.3 && p.y < height * 0.7 && leftOpen && enemiesDead) {
        currentI--;
        p.x = width-245;
      } else {
        p.x = 245;
      }
    }


    //right
    if (p.x > width - 225) {
      if (p.y > height * 0.3 && p.y < height * 0.7 && rightOpen && enemiesDead) {
        currentI++;
        p.x = 265;
      } else {
        p.x = width-225;
      }
    }
  }
}
