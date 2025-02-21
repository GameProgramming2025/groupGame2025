


class HUD{
  Float hp,coins, items;
  int ammo,w ;
  float t;
  PFont big;
  Player p,HP;
  PImage heart, brokenHeart;
  float currentHp;
  
  HUD(Player p){
   currentHp = 1;
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
      image(heart,50,50,30,30);
      image(heart,80,50,30,30);
      image(heart,110,50,30,30);
      image(heart,140,50,30,30);
      image(heart,170,50,30,30);
    }
    
      if(currentHp==9){
      image(heart,50,50,30,30);
      image(heart,80,50,30,30);
      image(heart,110,50,30,30);
      image(heart,140,50,30,30);
      image(brokenHeart,170,50,30,30);
    }
    
      if(currentHp==8){
      image(heart,50,50,30,30);
      image(heart,80,50,30,30);
      image(heart,110,50,30,30);
      image(heart,140,50,30,30);
      
    }
    
     if(currentHp==7){
      image(heart,50,50,30,30);
      image(heart,80,50,30,30);
      image(heart,110,50,30,30);
      image(brokenHeart,140,50,30,30);
      
    }
    
    if(currentHp==6){
      image(heart,50,50,30,30);
      image(heart,80,50,30,30);
      image(heart,110,50,30,30);
    }
    
     if(currentHp==5){
      image(heart,50,50,30,30);
      image(heart,80,50,30,30);
      image(brokenHeart,110,50,30,30);
    }
    
     if(currentHp==4){
      image(heart,50,50,30,30);
      image(heart,80,50,30,30);
      
    }
    
    if(currentHp==3){
      image(heart,50,50,30,30);
      image(brokenHeart,80,50,30,30);
      
    }
    if(currentHp==2){
      image(heart,50,50,30,30);
      
      
    }
    
    if(currentHp== 1){
      image(brokenHeart,50,50,30,30);
      
    }
    
    
    
    textFont(big);
    text("AMMO X", width/5,height/10);
    textAlign(CENTER);
    text(w,width/5 +100,height/10);
    text("HP", 70, 50);
    text(p.HP, 70, 100);
  }
  
  
  }
    
  
  
  
  
  
  
  
