class Sacrifice extends ActiveItem {
  int maxCharge;

  Sacrifice(float x, float y, int maxCharge) {
    super(x, y, "twoup.png", maxCharge);
    maxCharge = 0;
  }
  
  void itemEffect() {
    p1.HP = p1.HP + -1;
    p1.atk = p1.atk + 50;
  }
}
