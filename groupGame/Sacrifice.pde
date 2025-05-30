class Sacrifice extends ActiveItem {
  int maxCharge = 0;

  Sacrifice(float x, float y) {
    super(x, y, "Sprites/jagger.png", 0);
    ready = true;
    name = "Sacrificial Dagger";
    rarity = 2;
    description = "NO CHARGE | Sacrifice HP for more attack...";
  }

  void itemEffect() {
    if (maxCharge < 3) {
      println("HP CONSUMED. REAP YOUR BENEFIT.");
      p1.HP = p1.HP + -1;
      p1.atk = p1.atk + 50;
      println( "YOUR CURRENT ATTACK IS", p1.atk);
      ready = true;
      maxCharge++;
    }
  }

  void activateItem() {
    this.use();
  }
}
