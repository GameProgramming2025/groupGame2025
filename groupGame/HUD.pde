


class HUD{
  Float hp,coins, items;
  int ammo,w ;
  float t;
  PFont big;
  Player p;
  
  HUD(Player p){
    this.w=w;
    this.p = p;
    //ammo = p.ammo;
    coins=0.0;
    big= createFont("data/fonts/Tourney/static/Tourney_Condensed-BlackItalic.ttf", 20);
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
    textFont(big);
    text("AMMO X", width/2,height/2);
    textAlign(CENTER);
    text(w,width/2 +40,height/2);
  }
  
  
  }
    
  
  
  
  
  
  
  
