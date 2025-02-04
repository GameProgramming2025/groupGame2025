Player p1;

void setup() {
  size(400, 400);
  p1 = new Player();
}

void draw() {
  background(90);
  p1.display();
}

void keyPressed() {
  p1.keyPressed();
}

void keyReleased() {
  p1.keyReleased();
}
