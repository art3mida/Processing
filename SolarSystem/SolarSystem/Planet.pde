// We will be using polar coordinates
class Planet {
  float radius;
  float angle;
  float distance;
  float orbitSpeed;
  
  // We want each planet to have also an array of children planets
  Planet[] planets;
  
  Planet(float r, float d, float o){
    radius = r;
    distance = d;
    angle = random(TWO_PI);
    orbitSpeed = o;
  }
  
  void spawnMoons(int total) {
    planets = new Planet[total];
    for(int i = 0; i < planets.length; i++) {
      float r = random(radius*0.2, radius*0.35);
      float d = random(200, 500);
      planets[i] = new Planet(r, d, random(0.02, 0.1));
    }
  }
  
  void orbit() {
    angle = angle + orbitSpeed;
    if (planets != null) {
      for (int i = 0; i < planets.length; i++) {
        planets[i].orbit();
      }
    }
  }
  
  void show(){
    // By putting pushMatrix and popMatrix, whatever tranformations happen
    // inside, they don't affect any other object, and kind of get restored
    pushMatrix(); 
    fill(255); // the other argument is transparency
    
    // If you reverse the rotate and the translate functions, all of the moons
    // will appear in the same line, because they are first being translated
    // on the Sun's angle (which is equal for all of them), and then rotated
    // in their own coo system, which doesn't make them move
    rotate(angle);
    translate(distance, 0);
    sphere(radius*2);
    
    if(planets != null){
      for (int i = 0; i < planets.length; i++) {
        planets[i].show();
      }
    }
    
    popMatrix();
  }
}
