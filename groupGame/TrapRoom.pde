class TrapRoom extends Room {
  Enemy enemies[];
  int numEnemies;
  float spawn;
  PImage img;
  boolean enemiesDead;

  TrapRoom(int x, int y, boolean topOpen, boolean bottomOpen, boolean leftOpen, boolean rightOpen) {
    super(x, y, topOpen, bottomOpen, leftOpen, rightOpen);
    img = loadImage("Sprites/BGFourDoors.png");
    img.resize(width, height);
    numEnemies = 9;
    float ex, ey;
    enemies = new Enemy[numEnemies];
    for (int i = 0; i < numEnemies; i++) {
      ex = random(252, 1466);
      ey = random(282, 945);
      enemies[i] = new Enemy(ex, ey);
    }
  }

  void display() {
    super.display();

    enemiesDead = true;
    for (Enemy e : enemies) {
      e.update();
      if (e.enemyHealth > 0) {
        enemiesDead = true;
      }
      e.display();
    }
  }
  void update() {
    showDoors();
    println(enemiesDead);
  }

  void showDoors() {
    if (!topOpen || !enemiesDead) {
      image(topDoor, 0, 0);
    }
    if (!rightOpen) {
      if (!enemiesDead) {
        image(rightDoor, 0, 0);
      }
    }
    if (!leftOpen || !enemiesDead) {

      image(leftDoor, 0, 0);
    }
    if (!bottomOpen) {
      if (!enemiesDead) {
        image(bottomDoor, 0, 0);
      }
    }
  }

  void constrainPlayer(Player p) {
    //top
    //println(p.x);
    if (p.y < 305) {
      if (p.x > width * 0.4 && p.x < width * 0.6 && topOpen && numEnemies == 0 ) {
        currentJ--;
        p.y = height-265;
      } else {
        p.y = 305;
      }
    }

    //bottom
    if (p.y > height-265) {
      if (p.x > width * 0.4 && p.x < width * 0.6 && bottomOpen && numEnemies == 0) {
        currentJ++;
        p.y = 305;
      } else {
        p.y = height-265;
      }
    }


    //left
    if (p.x < 245) {
      if (p.y > height * 0.3 && p.y < height * 0.7 && leftOpen && numEnemies == 0) {
        currentI--;
        p.x = width-245;
      } else {
        p.x = 245;
      }
    }


    //right
    if (p.x > width - 225) {
      if (p.y > height * 0.3 && p.y < height * 0.7 && rightOpen && numEnemies == 0) {
        currentI++;
        p.x = 265;
      } else {
        p.x = width-225;
      }
    }
  }
}
