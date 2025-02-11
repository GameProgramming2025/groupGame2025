


class HUD{
  Float hp,coins, items;
  int ammo,w ;
  float t;
  PFont big;
  Player p;
  
  HUD(Player p){
    this.w=w;
    this.p = p;
    ammo = p.ammo;
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
    textFont(big);
    text("AMMO X", width/5,height/10);
    textAlign(CENTER);
    text(ammo,width/5 +100,height/10);
  }
  
  
  }
    
  
  
  
  
  
  
  
