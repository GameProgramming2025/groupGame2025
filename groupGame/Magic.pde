class Magic {
  PImage magic;
  float x, y, xVel, yVel;


  Magic(float x, float y, float xVel, float yVel) {
    magic = loadImage("magic.png");
    this.x = x;
    this.y = y;
    this.xVel = xVel;
    this.yVel = yVel;
  }

  void update() {
    x += xVel;
    y += yVel;
    
    
    //check if this hits other things
  }

  void display() {
    image(magic, x , y, 30, 30);
   
  }
}
