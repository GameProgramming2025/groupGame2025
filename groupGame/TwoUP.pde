class TwoUP extends ActiveItem {

  TwoUP(float x, float y) {
    super(x, y, "twoup.png", 3); // maxCharge is 3
  }

  void itemEffect() {
    p1.HP += 1;
  }

  void keyPressed() {
    if (key == 6) {
      use();
    }
  }

  void incrementCharge() {
    if (charge < maxCharge) {
      charge++;
    }
    if (charge >= maxCharge) {
      ready = true;
    }
  }
}
