Player p1;

Room rooms[][];
int currentI;
int currentJ;



void setup() {
  size(1700, 1200);

  p1 = new Player();
  currentI = 1;
  currentJ = 1;

  h1 = new HUD(p1);
  rooms = new Room[4][4];
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      rooms[i][j] = new Room(i, j);
    }
  }
}

void draw() {
  background(0);
  rooms[currentI][currentJ].display();
  if (p1.x > width) {
    p1.x = 40;
    currentI++;
  }
  p1.update();
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
