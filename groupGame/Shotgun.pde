class Shotgun extends Item {
  Bullet b1, b2, b3;
  
  Shotgun(float x, float y){
   super(x,y,"Sprites/Shotgun.png");
   this.x = x;
   this.y = y;
   b1 = new Bullet(x, y);
   b2 = new Bullet(x, y);
   b3 = new Bullet(x, y);
  } 
  
  void update(){
    b1.update();
    b2.update();
    b3.update();
  }
  void display(){
    b1.display();
    b2.display();
    b3.display();
  }
  
  void shoot(){
    b1.x = x;
    b1.y = y;
    b2.x = x;
    b2.y = y;
    b3.x = x;
    b3.y = y;
    b1.xVelo = cos(0.15)*10;
    b1.yVelo = sin(0.15)*10;
    b2.xVelo = cos(0)*10;
    b2.yVelo = sin(0)*10;
    b3.xVelo = cos(-0.15)*10;
    b3.yVelo = sin(-0.15)*10;
  }
  
  void keyPressed(){
    if (key == '1'){
     shoot(); 
     println("shoot");
    }
  }
} 
