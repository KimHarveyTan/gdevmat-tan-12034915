class Walker
{
 public float x;
 public float y;
 public float tx = 0, ty = 10000;
 
 public float scale;
 public float tScale = 0;
 
 public float r;
 public float g;
 public float b;
 public float tR, tG = 10000, tB = 20000;
 
 void render()
 { 
  //perlin rand scale 
  scale = map(noise(tScale), 0, 1, 5, 150);
  tScale += 0.01f;
  
  //perlin rand color
  r = map(noise(tR), 0, 1, 0, 255);
  g = map(noise(tG), 0, 1, 0, 255);
  b = map(noise(tB), 0, 1, 0, 255);
  tR += 0.01f;
  tG += 0.01f;
  tB += 0.01f;
    
  color randColor = color(r, g, b);
  
  fill(randColor);
  noStroke();
  circle(x, y, scale); 
 }
 
 void perlinWalk()
 {
   x = map(noise(tx), 0, 1, -640, 640);
   y = map(noise(ty), 0, 1, -360, 360);
   
   tx += 0.01f;
   ty += 0.01f;
 }
}
