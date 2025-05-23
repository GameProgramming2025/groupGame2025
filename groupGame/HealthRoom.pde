Class HealthRoom  extends Room 
  Health heal;
  float spawn;

  HealthRoom(int x, int y, boolean topOpen, boolean bottomOpen, boolean leftOpen, boolean rightOpen) 
    super(x, y, topOpen, bottomOpen, leftOpen, rightOpen);
    bc = color(random(100, 200), 100, 20);
    irimg = loadImage("Sprites/ItemRoom.png");




    void display() 
      imageMode(CORNER);
      image(irimg, 0, 0);
      super.display();
      if (item != null) 
        item.display();
      
    


    Item getItem() 
      return item;
    

    void setItem(Item setItem) 
      this.item = setItem;
    
  
