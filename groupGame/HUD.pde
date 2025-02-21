
class HUD{
  Float hp,coins, items, s;
  float x,y;
  int ammo,w ;
  float t;
  PFont big;
  Player p,HP;
  PImage heart, brokenHeart;
  float currentHp;
  
  HUD(Player p){
   currentHp = 1;
   s=30.0;
   x=50;
   y=50;
    heart = loadImage("data/Sprites/heart.png"); 
    brokenHeart = loadImage("data/Sprites/broken heart.png");
    
    this.p = p;
    //ammo = p.ammo;
    coins=0.0;
    big= createFont("data/fonts/Tourney/static/Tourney_Condensed-BlackItalic.ttf",50);
    items=0.0;
  }
  
  void update(){
    currentHp=p.HP;
   
  if(w<99){
    w++;
  }
  
  }
  
  void display(){
    if(currentHp ==10){
      image(heart, x,y,s,s);
      image(heart, x,y,s,s);
      image(heart,x,y,s,s);
      image(heart, x,y,s,s);
      image(heart, x,y,s,s);
    }
    
      if(currentHp==9){
      image(heart, x,y,s,s);
      image(heart, x,y,s,s);
      image(heart, x,y,s,s);
      image(heart, x,y,s,s);
      image(brokenHeart,170,y,s,s);
    }
    
      if(currentHp==8){
      image(heart, x,y,s,s);
      image(heart, x,y,s,s);
      image(heart, x,y,s,s);
      image(heart, x,y,s,s);
      
    }
    
     if(currentHp==7){
      image(heart, x,y,s,s);
      image(heart, x,y,s,s);
      image(heart, x,y,s,s);
      image(brokenHeart,140,y,s,s);
      
    }
    
    if(currentHp==6){
      image(heart, x,y,s,s);
      image(heart, x,y,s,s);
      image(heart, x,y,s,s);
    }
    
     if(currentHp==5){
      image(heart, x,y,s,s);
      image(heart, x,y,s,s);
      image(brokenHeart,110,y,s,s);
    }
    
     if(currentHp==4){
      image(heart, x,y,s,s);
      image(heart, x,y,s,s);
      
    }
    
    if(currentHp==3){
      image(heart, x,y,s,s);
      image(brokenHeart,x,y,s,s);
      
    }
    if(currentHp==2){
      image(heart,x,y,s,s);
      
      
    }
    
    if(currentHp== 1){
      image(brokenHeart,x,y,s,s);
      
    }
    
    
    
    textFont(big);
    text("AMMO X", width/5,height/10);
    textAlign(CENTER);
    text(w,width/5 +100,height/10);
    text("HP", 70, 50);
    text(p.HP, 70, 100);
  }
  
  
  }
    
  
  
  
  
  
  
  
