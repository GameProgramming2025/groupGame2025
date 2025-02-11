class Room {
  int x;
  int y;
  int bc;

  Room(int x, int y) {
    this.x=x;
    this.y=y;
    bc = color(random(100, 200), 100, 20);
  }

  void display () {
    push();
    rectMode(CORNER);
    fill(bc);
    strokeWeight(10);
    stroke(90);
    rect(20, 20, width-40, height-40);
    pop();
  }

  void update () {

  }
}
