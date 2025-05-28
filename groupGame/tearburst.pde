class TearBurst extends ActiveItem {
  int maxCharge;
  Magic n, ne, e, se, s, sw, w, nw;

  TearBurst(float x, float y, int maxCharge) {
    super(x, y, "twoup.png", maxCharge);
    maxCharge = 5;
    n = new Magic();
    ne = new Magic();
    e = new Magic();
    se = new Magic();
    s = new Magic();
    sw = new Magic();
    w = new Magic();
    nw = new Magic();
  }


  void itemEffect() {
    println("Item used!");
    ready = false;
    charge = 0;
    p1.HP += 1;
  }
  void update() {
    n.update();
    ne.update();
    e.update();
    se.update();
    s.update();
    sw.update();
    w.update();
    nw.update();
  }
  void display() {
    n.display();
    ne.display();
    e.display();
    se.display();
    s.display();
    sw.display();
    w.display();
    nw.display();
    
  }


  void activateItem() {
    if (ready) {
      this.use();
    } else {
      incrementCharge();
    }
  }
}
