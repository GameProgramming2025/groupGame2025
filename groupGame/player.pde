class Player {
float x,y, xVel, yVel, xAcc, yAcc;
float frames;
int ShotTimer;

  Player() {
    
    frames = 60;
  }

  void display() {
    x += xVel;
    y += yVel;
    // yVel += 
    rectMode(CENTER);
    rect(x, y, 50, 50);
    frames--;
    // ANY AND ALL TIMERS GO IN HERE.
    if (frames >= 0);
    //ShotTimer 
    
  }

  void keyPressed() {
    if (key == 'w'){
      yVel = -1;
     // println("Moving Up");
    }
    if (key == 'a'){
      xVel = -1;
      //println("Moving Left");
    }
    if (key == 's'){
      yVel = 1;
      //println("Moving Down");
    }
    if (key == 'd'){
      xVel = 1;
   //   println("Moving Right");
    }
    if (key == CODED) {
      if (keyCode == UP) {
     //   println("Shooting Up");
      } else if (keyCode == DOWN) {
       // println("Shooting Down");
      } else if (keyCode == LEFT) {
        //println("Shooting Left");
      } else if (keyCode == RIGHT) {
      //  println("Shooting Right");
      }
    }
  }

  void keyReleased() {
    if (key == 'w'){
      yVel = 0;
      //println("Stopped moving up");
    }
    if (key == 'a'){
      xVel = 0;
      //println("Stopped moving left");
    }
    if (key == 's'){
      yVel = 0;
      //println("Stopped moving down");
    }
    if (key == 'd'){
      xVel = 0;
      //println("Stopped moving right");
    }
    if (key == CODED) {
      if (keyCode == UP) {
       // println("Stopped shooting Up");
      } else if (keyCode == DOWN) {
        //println("Stopped shooting Down");
      } else if (keyCode == LEFT) {
        //println("Stopped shooting Left");
      } else if (keyCode == RIGHT) {
        //println("Stopped shooting Right");
      }
    }
  }
}
