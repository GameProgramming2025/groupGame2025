class BossRoom extends Room {
  BossEnemy Boss;
  float spawn;
  float selected1;
  float selected2;
  float selected3;
  float selected4;

  BossRoom(int x, int y, boolean topOpen, boolean bottomOpen, boolean leftOpen, boolean rightOpen) {
    super(x, y, topOpen, bottomOpen, leftOpen, rightOpen);
  }

  void display () {
    super.display();
    Boss.display();
    Boss.update();
  }
}
