class HUD {
  Float hp, coins, items, s;
  float x, y;
  int ammo, w ;
  float t;
  PFont big;
  Player p;
  HighNoon h;
  PImage heart, brokenHeart, highNoon;
  float currentHp;
  boolean hasItem;
  
  //EFFECTS
  PImage blackRadialGradient;


  HUD(Player p) {
    currentHp = 1;
    s=40.0;
    x=50;
    y=50;
    heart = loadImage("data/Sprites/heart.png");
    brokenHeart = loadImage("data/Sprites/broken heart.png");   
    blackRadialGradient = loadImage("data/VisualEffects/BlackRadialGradient.png");
    blackRadialGradient.resize((width*2) + 50, (height*2) + 50);
    highNoon = loadImage("data/sprites/HN.png");
    this.p = p;
   
    //ammo = p.ammo;
    coins=0.0;
    big= createFont("data/fonts/Tourney/static/Tourney_Condensed-BlackItalic.ttf", 50);
    items=0.0;
  }

  void update() {
    currentHp=p.HP;

  }

  void display() {
    
    strokeWeight(10);
    rect(width*7/10, 70, 70, 70, 10);
    rect(width*6.5/10, 70, 70, 70, 10);
    rect(width*7.5/10, 70, 70, 70, 10);
    rect(width*8/10, 70, 70, 70, 10);
    rect(width *8.5/10,70,70,70,10);

    for (int i = 0; i < 5; i++) {
       if (p.inventory[i] != null) {
         image(p.inventory[i].itemImg,10 + width * 6.5 /10 + (i * 85)-40, 43); 
       }
    }

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
  
  void effects(boolean enabled) {
    if(enabled) {
      imageMode(CENTER);
      image(blackRadialGradient, p1.x, p1.y);
      imageMode(CORNER);
    }
  }
  
}
