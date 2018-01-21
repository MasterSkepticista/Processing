PImage kitten;
void setup() {
  size(1024, 512);
  kitten = loadImage("image.jpg");
  kitten.filter(GRAY);
  image(kitten, 0, 0);
}
int index(int x, int y) {
  return x + y * kitten.width;
}
void draw() {
  kitten.loadPixels();
  for (int x= 1; x<kitten.width-1; x++) {
    for ( int y=0; y<kitten.height-1; y++) {

      //organize all pix into array
      color pix = kitten.pixels[index(x, y)];
      //take a pix reading
      float factor = 4;
      float oldr = red(pix);
      float oldg = green(pix);
      float oldb = blue(pix);

      float newR= round(factor*oldr/255) * (255/factor); //Quantize 0-255 two vals only
      float newG= round(factor*oldg/255) * (255/factor);
      float newB= round(factor*oldb/255) * (255/factor);
      //apply new color scheme
      kitten.pixels[index(x, y)] = color(newR, newG, newB);
      float errR = oldr - newR;
      float errG = oldg - newG;
      float errB = oldb - newB;


      int index = index(x+1, y);
      color c = kitten.pixels[index];
      float r = red(c);
      float g = green(c);
      float b = blue(c);
      r += errR * 7/16.0;
      g += errG * 7/16.0;
      b += errB * 7/16.0;
      kitten.pixels[index]=color(r, g, b);

      index = index(x-1, y+1);
      c = kitten.pixels[index];
      r = red(c);
      g = green(c);
      b = blue(c);
      r += errR * 3/16.0;
      g += errG * 3/16.0;
      b += errB * 3/16.0;
      kitten.pixels[index]=color(r, g, b);
      index = index(x, y+1);
      c = kitten.pixels[index];
      r = red(c);
      g = green(c);
      b = blue(c);
      r += errR * 5/16.0;
      g += errG * 5/16.0;
      b += errB * 5/16.0;
      kitten.pixels[index]=color(r, g, b);
      index = index(x+1, y+1);
      c = kitten.pixels[index];
      r = red(c);
      g = green(c);
      b = blue(c);
      r += errR * 1/16.0;
      g += errG * 1/16.0;
      b += errB * 1/16.0;
      kitten.pixels[index]=color(r, g, b);
    }
  }
  kitten.updatePixels();
  image(kitten, 512, 0);
}