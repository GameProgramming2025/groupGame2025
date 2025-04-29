class BossRoom extends Room {
  BossEnemy boss;
  float spawn;
  PImage img;

  BossRoom(int x, int y, boolean topOpen, boolean bottomOpen, boolean leftOpen, boolean rightOpen) {
    super(x, y, topOpen, bottomOpen, leftOpen, rightOpen);
    img = loadImage("Sprites/BossRoom.png");
    img.resize(width, height);
  }

  void display () {
    super.display();
    boss.display();
    boss.update();
  }
}
