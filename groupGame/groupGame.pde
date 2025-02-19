Player p1;
HUD h1;

Room rooms[][];
int currentI;
int currentJ;


void setup() {
  size(1700, 1200);

  p1 = new Player();
  currentI = 0;
  currentJ = 0;

  h1 = new HUD(p1);
  rooms = new Room[4][4];
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      rooms[i][j] = new Room(i, j);
    }
  }
}

void draw() {
  println(currentI, " ", currentJ);
  background(0);

  rooms[currentI][currentJ].display();
  if (p1.x > width) {
    p1.x = 40;
    currentI++;
  }
  if (p1.x < 0) {
    p1.x = width-40;
    currentI--;
  }
  if (p1.y > height) {
    p1.y = 40;
    currentJ++;
  }
    if (p1.y < 0) {
    p1.y = height-40;
    currentJ--;
  }

  if (currentI == 4) {
    currentI = 0;
  }
  if (currentJ == 4) {
    currentJ= 0;
  }
  if (currentI == -1) {
    currentI = 3;
  }
  if (currentJ == -1) {
    currentJ= 3;
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
