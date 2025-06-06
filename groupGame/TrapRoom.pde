class TrapRoom extends Room {
  Enemy enemies[];

  Runner runners[];
  
  HeavyEnemy heavies[];

  int numEnemies;
  float spawn;
  float ex, ey;
  PImage img;
  protected boolean enemiesDead;
  String enemyImg;

  TrapRoom(int x, int y, boolean topOpen, boolean bottomOpen, boolean leftOpen, boolean rightOpen, int level) {
    super(x, y, topOpen, bottomOpen, leftOpen, rightOpen);
    img = loadImage("Sprites/BGFourDoors.png");
    img.resize(width, height);
    numEnemies = level*5;
   
    enemies = new Enemy[3*numEnemies/5];
    runners = new Runner[numEnemies/5];
    heavies = new HeavyEnemy[numEnemies/5];
    
    for (int i = 0; i < 3*numEnemies/5; i++) {
      ex = random(252, 1466);
      ey = random(282, 945);
      enemies[i] = new Enemy(ex, ey, "Sprites/EnemyBasic.png");
    }
    for (int i = 0; i < numEnemies/5; i++) {
      ex = random(252, 1466);
      ey = random(282, 945);
      runners[i] = new Runner(ex, ey);
    }
    for (int i = 0; i < numEnemies/5; i++) {
      ex = random(252, 1466);
      ey = random(282, 945);
      heavies[i] = new HeavyEnemy(ex, ey, "Sprites/EnemyWater.png");
    }
  }
  
  void display() {
    super.display();

    enemiesDead = true;
    for (HeavyEnemy h : heavies) {
      h.update();
      if (h.heavyHealth > 0) {
        enemiesDead = false;
      }
      h.display();
    }
    for (Enemy e : enemies) {
      e.update();
      if (e.enemyHealth > 0) {
        enemiesDead = false;
      }
      e.display();
    }
    for (Runner r : runners) {
      r.update();
      if (r.runnerHealth > 0) {
        enemiesDead = false;
      }
      r.display();
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
