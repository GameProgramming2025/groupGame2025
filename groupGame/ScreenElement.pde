class ScreenElement {
  float xPos;
  float yPos;
  float xVelo;
  float yVelo;
  float xPosPrev;
  float yPosPrev;
  float gravity;
  boolean hidden;

  ScreenElement () {
    xPos = 0;
    yPos = 0;
    xPosPrev = 0;
    yPosPrev = 0;
    gravity = 0;
    xVelo = 0;
    yVelo = 0;
    hidden = false;
  }

  void display () {
    push();
    translate(xPos, yPos);
    render();
    pop();
  }

  void render() {
    ellipse (0, 0, 20, 20);
  }

  void update() {
    xPosPrev = xPos;
    yPosPrev = yPos;
    yPos += yVelo;
    xPos += xVelo;
    yVelo += gravity;
    handleCollisions();
  }
  
  void handleCollisions() {
    
  }

  float top() {
    return yPos - 10;
  }

  float bottom() {
    return yPos + 10;
  }

  float left() {
    return xPos - 10;
  }

  float right() {
    return xPos + 10;
  }
  
  

  
}
