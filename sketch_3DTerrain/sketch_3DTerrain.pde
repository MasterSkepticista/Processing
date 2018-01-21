int rows, cols, scl=20;
float x_, y_;
float[][] terrain;
float flying = 0;
void setup() {
  x_ = 0;
  y_ = 0;
  size(600, 600, P3D);
  int w  = 2000;
  int h=1000;
  rows=w/scl;
  cols=h/scl;
  terrain = new float[rows][cols];
 
}

void draw() {
  background(51); 
  stroke(255);
  noFill();
  translate(-width/2, height/3);
  rotateX(PI/2.5);
  flying-=0.1;

  for (int x = 0; x<rows-1; x++)
  {  
    x_+=0.1;
    beginShape(TRIANGLE_STRIP);
    for (int y=0; y<cols; y++) {
      vertex(x*scl, y*scl, terrain[x][y]);
      vertex((x+1)*scl, y*scl, terrain[x+1][y]);
    }
    y_+=0.1;
    endShape();
  }
   float xoff = 0;
  for (int x = 0; x<rows; x++)
  {  
    float yoff = flying;
    for (int y=0; y<cols; y++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -100, 100);
      yoff+=0.1;
    }
    xoff+=0.1;
  }
}