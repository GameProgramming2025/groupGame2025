class item {
  float x;
  float y;
  PImage itemImg;
  String name;
  String description;
  String area;
  String imageFileName;
  int rarity;
  int amount;
  
  item(float x, float y, String imageFileName){
   this.x = x;
   this.y = y;
   this.imageFileName = imageFileName;
   itemImg = loadImage(imageFileName);
   itemImg.resize(80, 80);
   name = "Item";
   description = "An item in the game";
   rarity = 3;
   area = "Where it can be found";
   amount = 1;
  }
}
