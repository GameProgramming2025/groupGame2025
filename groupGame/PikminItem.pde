class PikminItem extends Item {
  Pikmin p[];

  PikminItem(float x, float y) {
    super(x, y, "Sprites/PikminItem.jpg");
    this.x = x;
    this. y = y;
    p = new Pikmin[10];
    for (int i = 0; i < 10; i++) {
      p[i] = new Pikmin(x, y);
    }
    name = "Pikmin";
    description = "Each shot spawns a mini guy that does half of player dmg once and dies.";
    area = "can be found in Item room or after killing boss.";
    rarity = 4;
  }
}
