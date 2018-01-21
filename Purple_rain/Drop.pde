class Drop {

  float x = random(width);
  float y = random(-500, -50);
  float yspeed = random(4, 10);

  float z = random(0, 20);
  float len = map(z, 0, 20, 0, 10);
  void fall() {
    y = y + yspeed;
    
    float grav = map(z, 0, 20, 0, 0.9);
    yspeed += grav;
    if (y>height) {
      y = random(-200, -100);
      yspeed = map(z, 0, 20, 0, 10);
    }
  }

  void show() {
    
    float thickness = map(z, 0, 20, 1, 3);
    strokeWeight(thickness);
    stroke(138, 43, 226);
    line(x, y, x, y+len);
  }
}