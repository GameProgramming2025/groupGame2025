class TearBurst extends ActiveItem {
  int maxCharge;

  TearBurst(float x, float y, int maxCharge) {
    super(x, y, "twoup.png", maxCharge);
    maxCharge = 5;
  }

  void itemEffect() {
    p1.addShot(new Magic(x, y-30, 0, -shotspd + 0));
    p1.addShot(new Magic(x, y+30, 0, shotspd + 0));
    p1.addShot(new Magic(x-30, y, -shotspd + 0, 0));
    p1.addShot(new Magic(x+30, y, shotspd + 0, 0));
  }
}
