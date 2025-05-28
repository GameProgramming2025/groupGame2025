class Sprites {
  PImage flower[];
  PImage rock[];
  PImage paper[];
  PImage hood[];
  PImage cat[];
  PImage seaweed[];
  PImage fire[];
  PImage waterspout[];
  PImage statue[];
  PImage tv[];
  
  int currentRitem;
  int frame;
  float numero;

  Sprites() {
    currentRitem = 0;
    frame = 18;
    
    flower = new PImage[1];
    rock = new PImage[1];
    paper = new PImage[1];
    hood = new PImage[1];
    cat = new PImage[1];
    seaweed = new PImage[1];
    fire = new PImage[3];
    waterspout = new PImage[3];
    statue = new PImage[1];
    tv = new PImage[1];
    
    PImage spritesheet = loadImage("Sprites/Items.png");

      //items
    //flowers 1
    flower[0] = spritesheet.get(0, 0, 96, 96);
    //rocks 2
    rock[0] = spritesheet.get(96, 0, 96, 96);
    //paper 3
    paper[0] = spritesheet.get(192, 0, 96, 96);
    //hood 4
    hood[0] = spritesheet.get(0, 96, 96, 96);
    //cat 5
    cat[0] = spritesheet.get(96, 96, 96, 96);
    //seaweed 6
    seaweed[0] = spritesheet.get(192, 96, 96, 96);
    //fire 7
    fire[0] = spritesheet.get(0, 192, 96, 96);
    fire[1] = spritesheet.get(96, 192, 96, 96);
    //waterspout 8
    waterspout[0] = spritesheet.get(192, 192, 96, 96);
    waterspout[1] = spritesheet.get(0, 288, 96, 96);
    //statue 9
    statue[0] = spritesheet.get(96, 288, 96, 96);
    //tv 10
    tv[0] = spritesheet.get(192, 288, 96, 96);
  }

  void display () {
    push();
    rectMode(CENTER);

    //animation
    if (frame >= 18 && frame <= 9) {
      

    }
    
    imageMode(CENTER);
    //image(sprites[currentSprite], 0, 0);
    pop();
  }

  void update () {
    frame--;
  }
}
