
class HUD {
  Float hp, coins, items, s;
  float x, y;
  int ammo, w ;
  float t;
  PFont big;
  Player p;
  Item i;
  HighNoon h;
  PImage heart, brokenHeart;
  float currentHp;
  boolean hasItem;

  HUD(Player p) {
    currentHp = 1;
    s=40.0;
    x=50;
    y=50;
    heart = loadImage("data/Sprites/heart.png");
    brokenHeart = loadImage("data/Sprites/broken heart.png");

    this.p = p;
    //ammo = p.ammo;
    coins=0.0;
    big= createFont("data/fonts/Tourney/static/Tourney_Condensed-BlackItalic.ttf", 50);
    items=0.0;
  }

  void update() {
    currentHp=p.HP;

    if (w<99) {
      w++;
    }
  }

  void display() {


    if (currentHp ==10) {
      image(heart, x, y, s, s);
      image(heart, x+40, y, s, s);
      image(heart, x+80, y, s, s);
      image(heart, x+120, y, s, s);
      image(heart, x+160, y, s, s);
    }

    if (currentHp==9) {
      image(heart, x, y, s, s);
      image(heart, x+40, y, s, s);
      image(heart, x+80, y, s, s);
      image(heart, x+120, y, s, s);
      image(brokenHeart, x+160, y, s, s);
    }

    if (currentHp==8) {
      image(heart, x, y, s, s);
      image(heart, x+40, y, s, s);
      image(heart, x+80, y, s, s);
      image(heart, x+120, y, s, s);
    }

    if (currentHp==7) {
      image(heart, x, y, s, s);
      image(heart, x+40, y, s, s);
      image(heart, x+80, y, s, s);
      image(brokenHeart, x+120, y, s, s);
    }

    if (currentHp==6) {
      image(heart, x, y, s, s);
      image(heart, x+40, y, s, s);
      image(heart, x+80, y, s, s);
    }

    if (currentHp==5) {
      image(heart, x, y, s, s);
      image(heart, x+40, y, s, s);
      image(brokenHeart, x+80, y, s, s);
    }

    if (currentHp==4) {
      image(heart, x, y, s, s);
      image(heart, x+40, y, s, s);
    }

    if (currentHp==3) {
      image(heart, x, y, s, s);
      image(brokenHeart, x+40, y, s, s);
    }
    if (currentHp==2) {
      image(heart, x, y, s, s);
    }

    if (currentHp== 1) {
      image(brokenHeart, x, y, s, s);
    }
  }

}
