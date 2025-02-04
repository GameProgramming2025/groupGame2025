//CLASSES
Player p1;

//VARIABLES

//DISPLAY ARRAYS

//hello
void setup() {
  //for testing
  size(1700, 1200);
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
