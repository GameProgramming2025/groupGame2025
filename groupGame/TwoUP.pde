class TwoUP extends ActiveItem {

  TwoUP(float x, float y) {
    super(x, y, "Sprites/twoup.png", 3); // maxCharge is 3
    name = "Two Up";
    rarity = 1;
    description = "3 CHARGE | An item that heals you!";
  }



  void itemEffect() {
    println("Item used!");
    ready = false;
    charge = 0;
    p1.HP += 1;
  }


  void activateItem() {
    if (ready) {
      this.use();
    } else {
      println("Item not ready");
    }
  }
}
