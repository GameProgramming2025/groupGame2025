import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
import ddf.minim.*;
import ddf.minim.AudioPlayer;
//Lindblom talons of the dark

Player p1;
HUD h1;
Item spawned;
Decoration[] decor;

GameState gameState; //iowhbaweruyfbu ujfbdsfhasrhj


long noInputCnt;
float a;
PImage GameOver;
PImage TitleScreen, SelectScreen;
PImage decorSpritesheet;
boolean starting;
boolean on_start;
float fade;
Room rooms[][];
int currentI;
int currentJ;
Room currentRoom;

//ENDSCREEN
float startX = width;
float startY = height;
float lines = 34;

int gameStartTime;
int gameEndTime;

SoundEffects soundEffects;

Minim min;


void setup() {

  rectMode(CENTER);
  size(1700, 1200, P3D);
  //fullScreen(P3D);

  on_start = true;

  p1 = new Player();
  currentI = 2;
  currentJ = 0;
  p1.x = width/2;
  p1.y = height/2;

  min = new Minim(this);
  a = 0;
  fade=2;
  starting=false;
  noInputCnt = 0;


  soundEffects = new SoundEffects(min);

  GameOver = loadImage("Sprites/DeathScreen.png");
  GameOver.resize(1350, 1012);

  TitleScreen = loadImage("Sprites/TitleScreen.png");
  TitleScreen.resize(width, height);
  SelectScreen = loadImage("Sprites/StartScreen.png");
  SelectScreen.resize(width, height);
  h1 = new HUD(p1);



  rooms = new Room[5][5];
  //order is top, bottom, left, and right

  rooms[0][0] = new ItemRoom(0, 0, false, true, false, true);
  rooms[1][0] = new TrapRoom(1, 0, false, false, true, true, 1);//border on bottom wall
  rooms[2][0] = new Room(2, 0, false, false, true, true);//border on bottom wall
  rooms[3][0] = new TrapRoom(3, 0, false, false, true, true, 1);//border on bottom wall
  rooms[4][0] = new ItemRoom(4, 0, false, true, true, false);

  rooms[0][1] = new TrapRoom(0, 1, true, true, false, false, 1);//border on right wall;
  rooms[1][1] = new TrapRoom(1, 1, false, true, false, true, 2);//border on top and left wall
  rooms[2][1] = new ItemRoom(2, 1, false, true, true, true);//border on top wall & item toom
  rooms[3][1] = new TrapRoom(3, 1, false, true, true, false, 2);//border on top and right wall
  rooms[4][1] = new TrapRoom(4, 1, true, true, false, false, 1);//border on left wall


  rooms[0][2] = new ItemRoom(0, 2, true, true, false, false);//border on right wall & trap room
  rooms[1][2] = new TrapRoom(1, 2, true, true, false, false, 2);//border on left and right wall & trap room
  rooms[2][2] = new BossRoom(2, 2, true, false, false, false);//boss room & border on bottom left and right wall
  rooms[3][2] = new TrapRoom(3, 2, true, true, false, false, 2);//borders on left and right wall & trap room
  rooms[4][2] = new ItemRoom(4, 2, true, true, false, false);//border on left wall & trap room

  rooms[0][3] = new TrapRoom(0, 3, true, true, false, false, 1);//border on right wall
  rooms[1][3] = new TrapRoom(1, 3, true, false, false, true, 2);//border on left and bottom wall
  rooms[2][3] = new HealthRoom(2, 3, false, true, true, true);//border to boss room on top wall
  rooms[3][3] = new TrapRoom(3, 3, true, false, true, false, 2);//border on right and bottom wall
  rooms[4][3] = new TrapRoom(4, 3, true, true, false, false, 1);//border on left wall


  rooms[0][4] = new ItemRoom(0, 4, true, false, false, true);
  rooms[1][4] = new TrapRoom(1, 4, false, false, true, true, 1);//border on top wall
  rooms[2][4] = new TrapRoom(2, 4, true, false, true, true, 1);// room
  rooms[3][4] = new TrapRoom(3, 4, false, false, true, true, 1);//border on top wall
  rooms[4][4] = new ItemRoom(4, 4, true, false, true, false);

  //showDoors();
  currentRoom = rooms[currentI][currentJ];
  gameState = GameState.MAIN_SCREEN;
}

void draw() {
  //println(frameRate);
  background(0);

  if (noInputCnt == 60 * 60 * 30) {
    gameState = GameState.BLACK;
  }


  switch (gameState) {
  case MAIN_SCREEN:
    if (a<0) {
      a=0;
    }
    if (fade == 2) {
      background(TitleScreen);
    } else {
      background(SelectScreen);

      rectMode(CORNER);
      stroke(255);
      strokeWeight(10);


      if (on_start) {
        rect(width/2 -297, height/2 -155, 562, 178);
      } else {
        rect(width/2 -297, height/2 +150, 562, 160);
      }

      rectMode(CENTER);
      strokeWeight(0);
      stroke(0);
    }


    fill(0, 0, 0, a);
    rect(width/2, height/2, width, height, 0);

    if (keyPressed) {
      starting = true;
    }

    if (starting) {
      a=a+fade;
      if (a >= 255) {
        fade=-2;
      }
    }



    break;
  case BLACK:

    break;
  case GAMEPLAY:
    if (!soundEffects.background) {
      soundEffects.background = true;
      gameStartTime = millis();
    }
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

    thread("soundEffectsUpdate");

    //Cameron this is embarassing
    if (p1.finalAnimation <= 0 && p1.HP <= 0) gameState = GameState.GAME_OVER;
    break;
  case GAME_OVER:
    image(GameOver, 170, 50);
    textAlign(CENTER, TOP);
    

    soundEffects.background = false;
    gameEndTime = millis();

    startX = width/2;
    startY = 3*height/4;
    lines = 34;
    
    

    fill(255);

    text("SPD: " + p1.spd, startX, startY - lines * 1);
    text("ATK: " + p1.atk, startX, startY - lines * 2);
    text("CD: " + (p1.shotsCD), startX, startY - lines * 3);
    text("SHOT SPEED: " + p1.shotspd, startX, startY - lines * 4);
    text("TIME: " + (gameEndTime - gameStartTime/60000) + "m " + (gameEndTime - gameStartTime/1000)%60 + "sec", startX, startY - lines * 5);
    textSize(50);
    text("KILLS: " + p1.killsNum, startX+400, startY - lines * 34);
    textSize(28);
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
  if (gameState == GameState.GAMEPLAY) {
    p1.keyPressed();
  } else if (gameState == GameState.MAIN_SCREEN) {
    if (key=='w' || key=='s') {
      on_start = !on_start;
    }
    if ( on_start && key == 'z' && a<5 ) {
      gameState = GameState.GAMEPLAY;
    }
  }
}


void keyReleased() {
  p1.keyReleased();
}

void soundEffectsUpdate() {
  soundEffects.update();
}

enum GameState {
  MAIN_SCREEN,
    GAMEPLAY,
    GAME_OVER,
    GAME_DEFEATED,
    SCORE_INPUT,
    BLACK
}
