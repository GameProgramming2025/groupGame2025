class ItemRoom extends Room {
 HighNoon h;
 PikminItem p;
  
  ItemRoom(int x, int y){
    super(x,y);
    this.x = x;
    this.y = y;
    h = new HighNoon(width/2,height/2);
    p = new PikminItem(width/2, height/2);
  }
}
