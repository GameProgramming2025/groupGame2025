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
      if (e.health > 0) {
        enemiesDead = false;
      }
      e.display();
    }
  }
  void update() {
    if ( numEnemies == 0) {
      rooms[1][0] = new TrapRoom(1, 0, false, false, true, true);//border on bottom wall
      rooms[3][0] = new TrapRoom(3, 0, false, false, true, true);//border on bottom wall
      rooms[0][1] = new TrapRoom(0, 1, true, true, false, false);//border on right wall;
      rooms[1][1] = new TrapRoom(1, 1, false, true, false, true);//border on top and left wall
      rooms[0][2] = new TrapRoom(0, 2, true, true, false, false);//border on right wall & trap room
      rooms[1][2] = new TrapRoom(1, 2, true, true, false, false);//border on left and right wall & trap room
      rooms[3][2] = new TrapRoom(3, 2, true, true, false, false);//borders on left and right wall & trap room
      rooms[4][2] = new TrapRoom(4, 2, true, true, false, false);//border on left wall & trap room
      rooms[0][3] = new TrapRoom(0, 3, true, true, false, false);//border on right wall
      rooms[1][3] = new TrapRoom(1, 3, true, false, false, true);//border on left and bottom wall
      rooms[2][3] = new TrapRoom(2, 3, false, true, true, true);//border to boss room on top wall
      rooms[3][3] = new TrapRoom(3, 3, true, false, true, false);//border on right and bottom wall
      rooms[4][3] = new TrapRoom(4, 3, true, true, false, false);//border on left wall
      rooms[1][4] = new TrapRoom(1, 4, false, false, true, true);//border on top wall
      rooms[3][4] = new TrapRoom(3, 4, false, false, true, true);//border on top wall
    }
  }
}
