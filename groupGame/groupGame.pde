import ddf.minim.*;
import ddf.minim.AudioPlayer;
//
Player p1;
HUD h1;
Item spawned;
GameState gameState = GameState.GAMEPLAY; //TEMPORARY, WILL CHANGE LATER

PImage GameOver;

Room rooms[][];
int currentI;
int currentJ;
Room currentRoom;



SoundEffects soundEffects;

Minim minim;


void setup() {

  rectMode(CENTER);
  size(1700, 1200, P2D);

  p1 = new Player();
  currentI = 2;
  currentJ = 0;
  p1.x = width/2;
  p1.y = height/2;
  
    minim = new Minim(this);

  soundEffects = new SoundEffects(minim);

  GameOver = loadImage("Sprites/DeathScreen.png");
  GameOver.resize(1350, 1012);


  h1 = new HUD(p1);


  rooms = new Room[5][5];
  //order is top, bottom, left , and right
  
  rooms[0][0] = new Room(0, 0, false, true, false, true);
  rooms[1][0] = new Room(1, 0, false, false, true, true);//border on bottom wall
  rooms[2][0] = new Room(2, 0, false, false, true, true);//border on bottom wall
  rooms[3][0] = new Room(3, 0, false, false, true, true);//border on bottom wall
  rooms[4][0] = new Room(4, 0, false, true, true, false);
  rooms[0][1] = new Room(0, 1, true, true, false, false);//border on right wall;
  rooms[1][1] = new Room(1, 1, false, true, false, true);//border on top and left wall
  rooms[2][1] = new Room(2, 1, false, true, true, true);//border on top wall & item toom
  rooms[3][1] = new Room(3, 1, false, true, true, false);//border on top and right wall
  rooms[4][1] = new Room(4, 1, true, true, false, false);//border on left wall
  rooms[0][2] = new Room(0, 2, true, true, true, false);//border on right wall & trap room
  rooms[1][2] = new Room(1, 2, true, true, false, false);//border on left and right wall & trap room
  rooms[2][2] = new Room(2, 2, true, false, false, false);//boss room & border on bottom left and right wall
  rooms[3][2] = new Room(3, 2, true, true, false, false);//borders on left and right wall & trap room
  rooms[4][2] = new Room(4, 2, true, true, false, true);//border on left wall & trap room
  rooms[0][3] = new Room(0, 3, true, true, false, false);//border on right wall
  rooms[1][3] = new Room(1, 3, true, false, false, true);//border on left and bottom wall
  rooms[2][3] = new Room(2, 3, false, true, true, true);//border to boss room on top wall
  rooms[3][3] = new Room(3, 3, true, false, true, false);//border on right and bottom wall
  rooms[4][3] = new Room(4, 3, true, true, false, false);//border on left wall
  rooms[0][4] = new Room(0, 4, true, false, false, true);
  rooms[1][4] = new Room(1, 4, false, true, true, true);//border on top wall
  rooms[2][4] = new ItemRoom(2, 4, true, true, true, true);//item room
  rooms[3][4] = new Room(3, 4, false, true, true, true);//border on top wall
  rooms[4][4] = new Room(4, 4, true, false, true, false);

  currentRoom = rooms[currentI][currentJ];
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
    currentRoom = rooms[currentI][currentJ];
    currentRoom.update();
    currentRoom.display();
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


    h1.effects(true);
    h1.update();
    h1.display();

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
