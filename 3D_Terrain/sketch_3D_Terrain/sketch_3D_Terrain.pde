// We are going to be making a procedurally generated terrain with Perlin noise
// Perlin noise is an algorithm that generates random numbers around those previously generated
// It makes things more "fluid"

int cols, rows;
int scale = 20;
int w = 2000;
int h = 1600;

float flying = 0;

float[][] terrain;
  
void setup(){
  size(600, 600, P3D);
  cols = w/scale;
  rows = h/scale;
  terrain = new float[cols][rows];
}

void draw(){
  
  flying -= 0.1;
  
  float yoff = flying;
  for(int y = 0; y < rows; y++){
    float xoff = 0;
    for(int x = 0; x < cols; x++){
      // the noise function is better when used with float numbers (small intervals)
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -100, 100);
      xoff += 0.2;
    }
    yoff += 0.2;
  }
  
  background(0);
  stroke(255);
  noFill();
  
  translate(width/2, height/2-50);
  rotateX(PI/3);
  
  translate(-w/2, -h/2);
  for(int y = 0; y < rows-1; y++){
    beginShape(TRIANGLE_STRIP);
    for(int x = 0; x < cols; x++){
      vertex(x*scale, y*scale, terrain[x][y]);
      vertex(x*scale, (y+1)*scale, terrain[x][y+1]);
      //rect(x*scale, y*scale, scale, scale);
    }
    endShape();
  }
}