class Shotgun extends Item {
  Magic b1, b2, b3;

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

  void shoot() {
    b1.createObject(x, y, cos(0.15) * 10, sin(0.15) * 10, false);
    b2.createObject(x, y, cos(0) * 10, sin(0) * 10, false);
    b3.createObject(x, y, cos(-0.15) * 10, sin(-0.15) * 10, false);
  }
}
