// The main two functions you need to have are setup() and draw()
// The setup function is used to set up the program, and the draw 
// function is the "iterative" function of the program

Star[] stars = new Star[1000];

float speed;

void setup(){
  size(600, 600);
  for(int i = 0; i < stars.length; i++){
    stars[i] = new Star();
  }
}

void draw(){
  speed = map(mouseX, 0, width, 0, 30);
  background(0, 0, 0);
  translate(width/2, height/2);
  for(int i = 0; i < stars.length; i++){
    stars[i].move();
    stars[i].show();
  }
}
