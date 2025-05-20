class Sacrifice extends ActiveItem {
  int maxCharge;

  Sacrifice(float x, float y) {
    super(x, y, "Sprites/jagger.png", 0);
    ready = true;
  }

  void itemEffect() {
    println("HP CONSUMED. REAP YOUR BENEFIT.");
    p1.HP = p1.HP + -1;
    p1.atk = p1.atk + 50;
    println( "YOUR CURRENT ATTACK IS" , p1.atk);
    ready = true;
  }

  void activateItem() {
    this.use();
  }
}
