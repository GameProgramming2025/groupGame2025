class Magic {
  float x, y, xVel, yVel;
  PImage star;
  
  float rotSpeed;


  Magic(float x, float y, float xVel, float yVel) {
    this.x = x;
    this.y = y;
    this.xVel = xVel;
    this.yVel = yVel;
   
    rotSpeed = radians(3);
    
    star = loadImage("data/VisualEffects/stareffect.png");
    star.resize(50, 50);
  }

  void update() {
    x += xVel;
    y += yVel;
    
    xVel += xVel < 0? rotSpeed/01 : -rotSpeed/01;
    yVel += yVel < 0? rotSpeed/01 : -rotSpeed/01;
  }

  void display() {
    imageMode(CENTER);
    push();
    translate(x, y);
    rotate(rotSpeed++);
    image(star, 0, 0);
    pop();
    imageMode(CORNER);
  }
}
