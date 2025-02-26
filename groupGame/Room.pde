class Room {
  int x;
  int y;
  int bc;
  Enemy enemies [];
  int numEnemies;
  PImage img;

  Room(int x, int y) {
    float ex, ey;
    this.x=x;
    this.y=y;
    numEnemies = 10;
    enemies = new Enemy[numEnemies];
    for (int i = 0; i < numEnemies; i++) {
      ex = random(252, 1466);
      ey = random(272, 945);
      enemies[i] = new Enemy(ex, ey);
    }
    bc = color(random(100, 200), 100, 20);
    img = loadImage("Sprites/BGFourDoors.png");
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
    for (Enemy e : enemies) {
      e.update();
      e.display();
    }

    pop();
  }

  void update () {
   
  }
}
