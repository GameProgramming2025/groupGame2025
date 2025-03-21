/*class Heatseeker extends Item {
  PVector target;  // Target position (can be the player or an enemy)
  ArrayList<HeatSeekingBullet> bullets;  // List to store all heat-seeking bullets
  float targetX, targetY;  // Target's position coordinates
  // Speed of the bullet
  

  void HeatSeeker(float x, float y) {
    super(x,y,"Sprites/Heatseeker.png");
    size(800, 600);
    targetX = width / 2;
    targetY = height / 2;
    bullets = new ArrayList<HeatSeekingBullet>();
    this.x = x;
    this.y = y;
    name = "Heatseeker";
    description = "Your bullets now are controlled by AI and track the enemy perfectly";
    area = "can be found in Item room or after killing boss.";
    rarity = 4;
    shotspd = 5;
    atk = 1;
    shotsCD = -30;
    range = 999999999;
  }

  void draw() {
    background(200);

    // Draw the target (representing the heat source)
    fill(255, 0, 0);
    ellipse(targetX, targetY, 30, 30);

    // Update and display the bullets
    for (int i = bullets.size() - 1; i >= 0; i--) {
      HeatSeekingBullet bullet = bullets.get(i);
      bullet.update(targetX, targetY);  // Update bullet to seek the target
      bullet.display();

      // Remove bullet if it goes out of bounds
      if (bullet.isOffScreen()) {
        bullets.remove(i);
      }
    }
  }

  void mousePressed() {
    // Create a new heat-seeking bullet at the mouse position
    bullets.add(new HeatSeekingBullet(mouseX, mouseY, this));
  }
}*/
