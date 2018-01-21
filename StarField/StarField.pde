
Star[] stars = new Star[2000];

void setup(){
  size(800,800);  //Square canvas
  for(int i = 0;i<stars.length;i++){
    stars[i] = new Star();
  }
}
float speed;
void draw(){
  speed = map(mouseX,0,width,0,60);
  background(0);
  translate(width/2,height/2);
  for(int i = 0;i<stars.length;i++){
    stars[i].update();
    stars[i].show();
  }
}