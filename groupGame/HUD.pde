
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
    //if(p.HP=10){
      
   // }
  if(w<99){
    w++;
  }
  
  }
  
  void display(){
    
    
    
    textFont(big);
    text("AMMO X", width/5,height/10);
    textAlign(CENTER);
    text(w,width/5 +100,height/10);
    text("HP", 70, 50);
    text(p.HP, 70, 100);
  }
  
  
  }
    
  
  
  
  
  
  
  
