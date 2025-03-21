class TwoUP extends ActiveItem {
  int maxCharge;

  TwoUP(float x, float y, int maxCharge) {
    super(x, y, "twoup.png", maxCharge);
    maxCharge = 3;
  }
  
  void itemEffect() {
    p1.HP = p1.HP + 1;
  }
}
