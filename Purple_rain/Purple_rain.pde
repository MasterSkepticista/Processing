Drop drops[] = new Drop[2000];
void setup()
{
  size(1360, 760);
  for(int i = 0;i<drops.length;i++)
  {
    drops[i] = new Drop();
  }
  
}
void draw(){
 background(230, 230, 250); 
  for(int i = 0;i<drops.length;i++)
  {
    drops[i].fall();
    drops[i].show();
  }
}