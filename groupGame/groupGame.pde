//CLASSES
Player p1;
HUD h1;
//VARIABLES

//DISPLAY ARRAYS


void setup() {
  //for testing
  size(1700, 1200);
  
  p1 = new Player(); 
  h1 = new HUD(p1);
}

void draw() {
  background(0);
  p1.display();
  h1.update();
  h1.display();
  
}

void keyPressed() {
  p1.keyPressed();
}

void keyReleased() {
  p1.keyReleased();
}
