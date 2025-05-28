class Sacrifice extends ActiveItem {
  int maxCharge;

  Sacrifice(float x, float y) {
    super(x, y, "Sprites/jagger.png", 0);
    ready = true;
     name = "Sacrificial Dagger";
      rarity = 2;
    description = "NO CHARGE | Sacrifice HP for more attack...";
  }

  void itemEffect() {
    println("HP CONSUMED. REAP YOUR BENEFIT.");
    p1.HP = p1.HP + -1;
    p1.atk = p1.atk + 1000000121;
    println( "YOUR CURRENT ATTACK IS" , p1.atk);
    ready = true;
  }

  void activateItem() {
    this.use();
  }
}
