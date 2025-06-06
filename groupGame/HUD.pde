class HUD {
  PFont font;
  Float  coins, items, s;
  float x, y;
  int ammo, w ;
  float t;
  Heart hp[];
  Player p;
  HighNoon h;

  int startX = 20;
  int startY = height;
  int lines = 34;


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
    startX = 20;
    startY = height;
    lines = 28 + 6;

    hp = new Heart[100];

    blackRadialGradient = loadImage("data/VisualEffects/BlackRadialGradient.png");

    blackRadialGradient.resize((int)(width*2.5) + 50, (int)(height*2.5) + 50);

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

    
    fill(0, 255, 0);
    rect(width *9.5/10, 70, 70, 70, 10);
    if (p.actItem != null) {
      image(p.actItem.itemImg, width*9.5/10, 70);
    }

    textSize(28);
    fill(255);

    textAlign(LEFT, TOP);

    text("SPD: " + p1.spd, startX, startY - lines * 1);
    text("ATK: " + p1.atk, startX, startY - lines * 2);
    text("CD: " + (p1.shotsCD), startX, startY - lines * 3);
    text("SHOT SPEED: " + p1.shotspd, startX, startY - lines * 4);
    text("TIME: " + (millis()-gameStartTime)/60000 + "m " + ((millis()-gameStartTime)/1000)%60 + "sec", startX, startY - lines * 5);
    textSize(50);
    text("KILLS: " + p1.killsNum, startX+400, startY - lines * 34);
    textSize(28);
    currentHp=p.HP;

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
