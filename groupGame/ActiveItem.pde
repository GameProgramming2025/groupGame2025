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
    name = "Item";
    description = "An item in the game";
    rarity = 0;
    area = "Where it can be found";
  }

  void update() {
    super.update();
    if (charge == 0) {
      ready = true;
    }
  }

  void render() {
    super.render();
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

  void activateItem() {
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
