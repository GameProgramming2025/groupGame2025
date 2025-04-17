class ActiveItem extends Item {
  int maxCharge, charge;
  boolean ready;


  ActiveItem(float x, float y, String imageFileName, int maxCharge) {
    super(x, y, imageFileName);
    this.imageFileName = imageFileName;
    itemImg = loadImage(imageFileName);
    ready = false;
    this.maxCharge = maxCharge;
    this.charge = maxCharge;
  }

  void update() {
    super.render();
    if (charge == 0) {
      ready = true;
    }
  }

  void use() {
    if (ready) {
      ready = false;
      charge = maxCharge;
      itemEffect();
    }
  }

  void itemEffect() {
  }

  void keyPressed() {
    if (key == '6') {
      use();
    }
  }
}
