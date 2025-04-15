import ddf.minim.*;
import ddf.minim.AudioPlayer;
//
Player p1;
HUD h1;

GameState gameState = GameState.GAMEPLAY; //TEMPORARY, WILL CHANGE LATER

PImage GameOver;

Room rooms[][];
int currentI;
int currentJ;
Room currentRoom;

Enemy enemies [];
int numEnemies;
float ex, ey;

SoundEffects soundEffects;

Minim minim;


void setup() {

  rectMode(CENTER);
  size(1700, 1200);

  p1 = new Player();
  currentI = 1;
  currentJ = 1;
  p1.x = width/2;
  p1.y = height/2;

  minim = new Minim(this);

  soundEffects = new SoundEffects(minim);

  GameOver = loadImage("Sprites/DeathScreen.png");
  GameOver.resize(1350, 1012);


  h1 = new HUD(p1);


  rooms = new Room[7][7];
  for (int i = 0; i < 7; i++) {
    for (int j = 0; j < 7; j++) {

      rooms[i][j] = new Room(i, j, int(random(0, 13)));
    }
  }
  rooms[1][1] = new ItemRoom(1, 1);
  currentRoom = rooms[currentI][currentJ];

  numEnemies = 7;
  enemies = new Enemy[numEnemies];
  for (int i = 0; i < numEnemies; i++) {
    ex = random(252, 1466);
    ey = random(282, 945);
    enemies[i] = new Enemy(ex, ey);
  }
}

void draw() {
  background(0);

  switch (gameState) {
  case MAIN_SCREEN:

    break;
  case GAMEPLAY:
    currentI = constrain(currentI, 0, 6);
    currentJ = constrain(currentJ, 0, 6);
    currentRoom = rooms[currentI][currentJ];
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
    if (p1.y >= height) {
      p1.y = 100;
      currentJ++;
    }
    if (p1.y <= 0) {
      p1.y = height - 40;
      currentJ--;
    }

    p1.update();
    currentRoom.constrainPlayer(p1);

    p1.display();

    if (currentRoom.num == 12) {
      for (Enemy e : enemies) {
        e.update();
        e.display();
      }
    }

    
    soundEffects.update();

    //Cameron this is embarassing
    if (p1.finalAnimation <= 0 && p1.HP <= 0) gameState = GameState.GAME_OVER;
    break;
  case GAME_OVER:
    image(GameOver, 170, 50);
    break;
  case GAME_DEFEATED:
    break;
  case SCORE_INPUT:
    break;
  default:
    //println("lost");
    break;
  }
   h1.update();
    h1.display();
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
