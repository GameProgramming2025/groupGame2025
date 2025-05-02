class TrapRoom extends Room {
  Enemy enemies[];
  int numEnemies;
  float spawn;
  PImage img;

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

  void display () {
    super.display();
    for (Enemy e : enemies) {
      e.update();
      e.display();
    }
  }
}
