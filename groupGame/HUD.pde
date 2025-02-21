


class HUD{
  Float hp,coins, items;
  int ammo,w ;
  float t;
  PFont big;
  Player p,HP;
  PImage heart, brokenHeart;
  float currentImg;
  
  HUD(Player p){
   currentImg = 1;
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
    if(currentImg==1){
      image(heart,50,50,30,30);
      image(heart,80,50,30,30);
      image(heart,110,50,30,30);
      image(heart,140,50,30,30);
      image(heart,170,50,30,30);
    }
    
      if(currentImg==2){
      image(heart,50,50,30,30);
      image(heart,80,50,30,30);
      image(heart,110,50,30,30);
      image(heart,140,50,30,30);
      image(brokenHeart,170,50,30,30);
    }
    
      if(currentImg==3){
      image(heart,50,50,30,30);
      image(heart,80,50,30,30);
      image(heart,110,50,30,30);
      image(heart,140,50,30,30);
      
    }
    
     if(currentImg==4){
      image(heart,50,50,30,30);
      image(heart,80,50,30,30);
      image(heart,110,50,30,30);
      image(brokenHeart,140,50,30,30);
      
    }
    
    if(currentImg==5){
      image(heart,50,50,30,30);
      image(heart,80,50,30,30);
      image(heart,110,50,30,30);
    }
    
     if(currentImg==6){
      image(heart,50,50,30,30);
      image(heart,80,50,30,30);
      image(brokenHeart,110,50,30,30);
    }
    
     if(currentImg==7){
      image(heart,50,50,30,30);
      image(heart,80,50,30,30);
      
    }
    
    if(currentImg==8){
      image(heart,50,50,30,30);
      image(brokenHeart,80,50,30,30);
      
    }
    if(currentImg==9){
      image(heart,50,50,30,30);
      
      
    }
    
    if(currentImg== 10){
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
    
  
  
  
  
  
  
  
