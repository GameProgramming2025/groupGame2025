Player p1;
HUD h1;

GameState gameState = GameState.GAMEPLAY; //TEMPORARY, WILL CHANGE LATER

Room rooms[][];
int currentI;
int currentJ;
Room currentRoom;


void setup() {
  size(1700, 1200);

  p1 = new Player();
  currentI = 0;
  currentJ = 0;
  p1.x = width/2;
  p1.y = height/2;
  currentI = 1;
  currentJ = 1;



  h1 = new HUD(p1);
  rooms = new Room[4][4];
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      rooms[i][j] = new Room(i, j);
    }
  }
  currentRoom = rooms[currentI][currentJ];
}

void draw() {
  //println(currentI, " ", currentJ);
  background(0);

  //println(frameRate);

  switch (gameState) {
  case MAIN_SCREEN:

    break;
  case GAMEPLAY:
    currentI = constrain(currentI, 0, 3);
    currentJ = constrain(currentJ, 0, 3);
    background(0);
    rooms[currentI][currentJ].display();
    if (p1.x >= width) {
      p1.x = 40;
      currentI++;
    }
    if (p1.x <= 0) {
      p1.x = width-40;
      currentI--;
    }
    p1.update();
    currentRoom.constrainPlayer(p1);
    currentRoom = rooms[currentI][currentJ];
    p1.display();
    h1.update();
    h1.display();
    break;
  case GAME_OVER:
    break;
  case GAME_DEFEATED:
    break;
  case SCORE_INPUT:
    break;
  default:
    //println("lost");
    break;
  }
}

void keyPressed() {
  p1.keyPressed();
}

void keyReleased() {
  p1.keyReleased();
}

enum GameState {
  MAIN_SCREEN,
    GAMEPLAY,
    GAME_OVER,
    GAME_DEFEATED,
    SCORE_INPUT
}
