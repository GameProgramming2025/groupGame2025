class Room {
  int x;
  int y;
  int bc;
  Enemy enemies [];
  int numEnemies;

  Room(int x, int y) {
    this.x=x;
    this.y=y;
    enemies = new Enemy[numEnemies];
    numEnemies = 10;
    bc = color(random(100, 200), 100, 20);
  }

  void display () {
    push();
    rectMode(CORNER);
    fill(bc);
    strokeWeight(10);
    stroke(90);
    rect(20, 20, width-40, height-40);
    for (Enemy e : enemies) {
      e.display();
      e.update();
      
    }
    pop();
    
  }

  void update () {

  }
}
