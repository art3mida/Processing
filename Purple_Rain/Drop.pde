class Drop {
  private float x = random(width);
  private float y = random(-300, 0);
  private float z = random(0, 20);
  private float speed = map(z, 0, 20, 2, 6);
  private float length = map(z, 0, 20, 10, 20);
  
  // The "physics" function for the drop
  void fall() {
    y = y + speed;
    float gravity = map(z, 0, 20, 0, 0.1);
    speed = speed + gravity;
    
    if (y > height){
      y = random(-100, 0);
      speed = map(z, 0, 20, 4, 10);
    }
  }
  
  // For displaying the drop on the screen
  void show() {
    float thick = map(z, 0, 20, 1, 3);
    strokeWeight(thick);
    stroke(138, 43, 226);
    line(x, y, x, y + length);
  }
  
}
