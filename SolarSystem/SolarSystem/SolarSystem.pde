Planet sun;

void setup(){
   size(800, 600, P3D); 
   sun = new Planet(40, 0, 0);
   sun.spawnMoons(5);
}

void draw(){
  background(0);
  translate(width/2, height/2);
  rotateX(PI/3);
  sun.show();
  sun.orbit();
}
