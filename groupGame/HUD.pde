


class HUD{
  Float hp,coins, items;
  int ammo,w ;
  float t;
  PFont big;
  Player p,HP;
  PImage heart, brokenHeart;
  
  HUD(Player p){
    heart = loadImage("data/Sprites/heart.png"); 
    brokenHeart = loadImage("data/Sprites/broken heart.png");
    this.p = p;
    //ammo = p.ammo;
    coins=0.0;
    big= createFont("data/fonts/Tourney/static/Tourney_Condensed-BlackItalic.ttf",50);
    items=0.0;
  }
  
  void update(){
    //if(p.hp=12){
      
  //  }
  if(w<99){
    w++;
  }
  
  }
  
  void display(){
    image(heart, 100,100);
    
    textFont(big);
    text("AMMO X", width/5,height/5);
    textAlign(CENTER);
    text(w,width/5 +100,height/5);
  }
  
  
  }
    
  
  
  
  
  
  
  
