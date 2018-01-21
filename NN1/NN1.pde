Perceptron brain;
Point[] points = new Point[500];
void setup() {
  size(600, 600);
  brain = new Perceptron(3);
  //init points
  for (int i=0;i<points.length;i++)
  {
    points[i] = new Point();
  }

}
void draw()
{
  background(150,200,250);
  stroke(0);
  //line(0, height, width, 0);
  Point p1 = new Point(-1,f(-1));
  Point p2 = new Point(1,f(1));

  line(p1.PixelX(),p1.PixelY(),p2.PixelX(),p2.PixelY());
  
  //Visualizing the perceptron's line
  Point p3 = new Point(-1, brain.guessY(-1));
  Point p4 = new Point(1, brain.guessY(1));
  line(p3.PixelX(),p3.PixelY(),p4.PixelX(),p4.PixelY());
  //for all points
  for (Point pt:points) {
    pt.show();
  }

  for (Point pt:points) {
    float[] inputs = {pt.x, pt.y, pt.bias};
    int target = pt.label;
    brain.train(inputs, target);
    float guess = brain.guess(inputs);
    if (guess == target) {
      fill(0, 255, 0);
    }
    else
    {
      fill(255, 0, 0);
    }
    noStroke();
    ellipse(pt.PixelX(), pt.PixelY(), 4, 4);
   
  }
}

void mousePressed(){
    for (Point pt:points) {
      float[] inputs = {pt.x, pt.y};
      int target = pt.label;
      brain.train(inputs, target);
    }
}