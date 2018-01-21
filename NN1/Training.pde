float f(float x){
  return 2 * x + 0.1;  //y=mx+b
}

class Point {
  float x;
  float y;
  float bias=1;
  int label;
//Overloaded Constructor
  Point(float x_, float y_){
     x=x_;
     y=y_;

  }
//Normal Constructor
  Point() {
    x=random(-1,1);
    y=random(-1,1);

    float lineY = f(x);
    if (lineY<y)
      label = 1;
    else
      label = -1;
  }
  
  float PixelX(){
    return map(x,-1,1,0,width);
  }
  float PixelY(){
    return map(y,-1,1,height,0);
  }
  void show() {
    stroke(0);
    if (label==1)
      fill(255);
    else
      fill(0);
    
    float px = PixelX();
    float py = PixelY();
    ellipse(px, py, 8, 8);
  }
}