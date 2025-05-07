class Shotgun extends Item {
  Magic b1, b2, b3;
  float direction;
  
  
  float range = -200;

  Shotgun(float x, float y) {
    super(x, y, "Sprites/Shotgun.png");
    this.x = x;
    this.y = y;
    name = "Spreadburst";
    description = "Shoot 3 bolts of magic at once!";
    area = "can be found in Item rooms";
    rarity = 3;
    shotsCD = 30;
    collected = false;
    b1 = new Magic();
    b2 = new Magic();
    b3 = new Magic();
  }

  void update() {
    b1.update();
    b2.update();
    b3.update();
  }
  void display() {
    b1.display();
    b2.display();
    b3.display();
  }

  void shoot(String dir) {
    if (dir.equals("UP")) {
      direction = 270;
    }
    if (dir.equals("RIGHT")) {
      direction = 0;
    }
    if (dir.equals("LEFT")) {
      direction = 180;
    }
    if (dir.equals("DOWN")) {
      direction = 90;
    }
    b1.createObject(x, y, cos(radians(direction) + 0.15) * 10, sin(radians(direction) + 0.15) * 10, false);
    b2.createObject(x, y, cos(radians(direction)) * 10, sin(radians(direction)) * 10, false);
    b3.createObject(x, y, cos(radians(direction) - 0.15) * 10, sin(radians(direction) - 0.15) * 10, false);
  }
}
