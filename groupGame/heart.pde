class Heart {

  PImage heart, brokenHeart;
  float h;
  float x, y;
  
  Heart(float half, float xp, float yp) {
    heart = loadImage("data/Sprites/heart.png");
    brokenHeart = loadImage("data/Sprites/broken heart.png");
    h=half;
    x = xp;
    y=yp;
  }



  void update() {
  }

  void display() {
    if (h==2) {
      image(brokenHeart, x, y);
    }
    if (h==3) {
      image(heart, x, y);
    }
  }
}
