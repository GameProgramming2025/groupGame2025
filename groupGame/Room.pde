class Room {
  int i;
  int j;
  int bc;

  Room(int x, int y) {
    this.i=i;
    this.j=j;
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
