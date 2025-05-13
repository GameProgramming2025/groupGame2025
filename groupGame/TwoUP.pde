class TwoUP extends ActiveItem {

  TwoUP(float x, float y) {
    super(x, y, "Sprites/twoup.png", 3); // maxCharge is 3
  }

  void itemEffect() {
    ready = false;
    charge = 0;
    p1.HP += 1;
  }

  void keyPressed() {
    if (key == '6') {
      if (ready) {
        this.use();
      } else {
        incrementCharge();
      }
    }
  }

  void incrementCharge() {
    if (charge < maxCharge) {
      charge++;
    }
    if (charge >= maxCharge) {
      ready = true;
    }
    println(charge, " ", ready);
  }
}
