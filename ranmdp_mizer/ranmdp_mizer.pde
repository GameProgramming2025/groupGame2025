int rarity;
int rarity100;
int rar1item;
void setup() {
  size(500, 400);              // Canvas size
  rectMode(CENTER);            // Draw rect from center
  textAlign(CENTER, CENTER);   // Center-align text
  textSize(20);                // Set text size
  
  rarity100 = int(random(1, 100));
  
  if (rarity100 > 0 && rarity100 <= 50) {
    rarity = 1;
  } else if (rarity100 > 50 && rarity100 <= 80) {
    rarity = 2;
  } else if (rarity100 > 80 && rarity100 <= 100) {
    rarity = 3;
  }
  
  if (rarity == 1){
    rar1item = int(random(1,5));
  }
  if (rarity == 2){
    rar1item = int(random(6,10));
  }
  if (rarity == 3){
    rar1item = int(random(11,15));
  }
}

void draw() {
  background(240);             // Clear background

  // Box 1
  fill(255, 100, 100);         // Red-ish box
  stroke(0);
  strokeWeight(2);
  rect(width/2, height/2 - 80, 250, 100);

  fill(255);                   // White text
  
  if (rarity == 1) {
    text("Common", width/2, height/2 - 80);
  } else if (rarity == 2) {
    text("Rare", width/2, height/2 - 80);
  } else if (rarity == 3) {
    text("Legendary", width/2, height/2 - 80);
  } 

    // Box 2
    fill(100, 150, 255);         // Blue-ish box
  stroke(0);
  strokeWeight(2);
  rect(width/2, height/2 + 80, 250, 100);

  fill(255);                   // White text
  text(rar1item, width/2, height/2 + 80);
}
