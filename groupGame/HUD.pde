class HUD {
  PFont font;
  Float  coins, items, s;
  float x, y;
  int ammo, w ;
  float t;
  Heart hp[];
  Player p;
  HighNoon h;

  PImage heart, brokenHeart, highNoon;
  float currentHp;
  boolean hasItem;
  int pts;
  //EFFECTS
  PImage blackRadialGradient;


  HUD(Player p) {
    font = loadFont("data/fonts/Algerian.vlw");
    textFont(font, 40);
    currentHp = 1;
    s=40.0;
    x=50;
    y=50;

    hp = new Heart[100];



    blackRadialGradient = loadImage("data/VisualEffects/BlackRadialGradient.png");
    blackRadialGradient.resize((width*2) + 50, (height*2) + 50);
    highNoon = loadImage("data/sprites/HN.png");
    this.p = p;

    //ammo = p.ammo;
    coins=0.0;

    items=0.0;

    for (int i = 0; i < p.maxHP; i++) {
      hp[i] = new Heart(i<currentHp ? 3 : 1, x+(i+1)*40, y );
      
    }
  }

  void update() {
    if (currentHp != p.HP) {
      currentHp=p.HP;
      for (int i = 0; i < p.maxHP; i++) {
        hp[i] = new Heart(i<currentHp ? 3 : 1, x+(i+1)*40, y );
      }
    }
  }

  void display() {

    strokeWeight(10);
    fill(255);
    rect(width*7/10, 70, 70, 70, 10);
    rect(width*6.5/10, 70, 70, 70, 10);
    rect(width*7.5/10, 70, 70, 70, 10);
    rect(width*8/10, 70, 70, 70, 10);
    rect(width *8.5/10, 70, 70, 70, 10);
    fill(0);

    for (int i = 0; i < p.maxHP; i++) {
      hp[i].display();
    }




    //if (currentHp ==10) {
    //  image(heart, x, y, s, s);
    //  image(heart, x+40, y, s, s);
    //  image(heart, x+80, y, s, s);
    //  image(heart, x+120, y, s, s);
    //  image(heart, x+160, y, s, s);
    //}

    //if (currentHp==9) {
    //  image(heart, x, y, s, s);
    //  image(heart, x+40, y, s, s);
    //  image(heart, x+80, y, s, s);
    //  image(heart, x+120, y, s, s);
    //  image(brokenHeart, x+160, y, s, s);
    //}

    //if (currentHp==8) {
    //  image(heart, x, y, s, s);
    //  image(heart, x+40, y, s, s);
    //  image(heart, x+80, y, s, s);
    //  image(heart, x+120, y, s, s);
    //}

    //if (currentHp==7) {
    //  image(heart, x, y, s, s);
    //  image(heart, x+40, y, s, s);
    //  image(heart, x+80, y, s, s);
    //  image(brokenHeart, x+120, y, s, s);
    //}

    //if (currentHp==6) {
    //  image(heart, x, y, s, s);
    //  image(heart, x+40, y, s, s);
    //  image(heart, x+80, y, s, s);
    //}

    //if (currentHp==5) {
    //  image(heart, x, y, s, s);
    //  image(heart, x+40, y, s, s);
    //  image(brokenHeart, x+80, y, s, s);
    //}

    //if (currentHp==4) {
    //  image(heart, x, y, s, s);
    //  image(heart, x+40, y, s, s);
    //}

    //if (currentHp==3) {
    //  image(heart, x, y, s, s);
    //  image(brokenHeart, x+40, y, s, s);
    //}
    //if (currentHp==2) {
    //  image(heart, x, y, s, s);
    //}

    //if (currentHp== 1) {
    //  image(brokenHeart, x, y, s, s);
    //}

    for (int i = 0; i < 5; i++) {
      if (p.inventory[i] != null) {
        image(p.inventory[i].itemImg, 10 + width * 6.5 /10 + (i * 85)-40, 43);
      }
    }


    textSize(40);
    fill(255);

    text("kills:", width/2 -330, height-30);
    text(p1.killsNum, width/2 -260, height-30);
    text(p1.atk, width/2 -250, height-70);
    text("atk:", width/2 -325, height-70);
    text("spd:", width/2 -455, height-70);
    text(p1.spd, width/2 -400, height-70);
  }

  void effects(boolean enabled) {
    if (enabled) {
      imageMode(CENTER);
      if (currentHp < 2) {
        tint(255, 0, 0);
      } else {
        noTint();
      }
      image(blackRadialGradient, p1.x, p1.y);
      noTint();
      imageMode(CORNER);
    }
  }
}
