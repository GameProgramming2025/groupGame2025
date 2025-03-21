// HeatSeekingBullet class
class HeatSeekingBullet {
  PVector position;
  Heatseeker hs;
  PVector velocity;

  HeatSeekingBullet(float x, float y, Heatseeker hs) {
    position = new PVector(x, y);
    velocity = new PVector(0, 0);
    this.hs = hs;
  }

  void update(float targetX, float targetY) {

    PVector targetPosition = new PVector(targetX, targetY);

    // Calculate the direction towards the target
    PVector direction = PVector.sub(targetPosition, position);
    direction.normalize();  // Normalize to make sure it has the same speed
    direction.mult(hs.shotspd);  // Set the speed

    // Apply velocity to the bullet's position
    velocity = direction;
    position.add(velocity);
  }

  void display() {
    fill(0, 255, 0);
    noStroke();
    ellipse(position.x, position.y, 10, 10);// Draw the bullet
  }

  boolean isOffScreen() {
    return position.x < 0 || position.x > width || position.y < 0 || position.y > height;
  }
}
