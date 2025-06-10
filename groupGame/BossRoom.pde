class BossRoom extends Room {
  BossEnemy boss;
  float spawn;
  PImage img;

  BossRoom(int x, int y, boolean topOpen, boolean bottomOpen, boolean leftOpen, boolean rightOpen) {
    super(x, y, topOpen, bottomOpen, leftOpen, rightOpen);
    img = loadImage("Sprites/BossRoomReWork.png");
    img.resize(width, height);
    boss = new BossEnemy(width/2, height/2);
  }

  void display () {
    imageMode(CORNER);
    image(img, 0, 0);
    super.display();
    boss.display();
    boss.update();
  }
}
