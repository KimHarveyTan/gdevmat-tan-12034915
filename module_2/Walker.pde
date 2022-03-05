class Walker
{
 float x;
 float y;
 
 void render()
 {
  int randR = int(random(255));
  int randG = int(random(255));
  int randB = int(random(255));
  int randAl = int(random(50, 100));
  
  color randColor = color(randR, randG, randB, randAl);
  fill(randColor);
  noStroke();
  circle(x, y, 30); 
 }
 
 void randomWalk()
 {
  int rng = int(random(8));
  
  if (rng == 0)  x += 10;
  else if (rng == 1) x -= 10;
  else if (rng == 2) y += 10;
  else if (rng == 3) y -= 10;
  else if (rng == 4) 
  {
    x += 10;
    y += 10;
  }
  else if (rng == 5)
  {
    x -= 10;
    y -= 10;
  }
  else if (rng == 6)
  {
    x += 10;
    y -= 10;
  }
  else if (rng == 7)
  {
    x -= 10;
    y += 10;
  }
 }

void randomWalkBiased()
{
  int rng = int(random(4));
  
  if (rng == 0)  x += 10;
  else if (rng == 1) x -= 10;
  else if (rng == 2) y += 20;
  else if (rng == 3) y -= 20;
  else if (rng == 4) 
  {
    x += 10;
    y += 10;
  }
  else if (rng == 5)
  {
    x -= 10;
    y -= 10;
  }
  else if (rng == 6)
  {
    x += 10;
    y -= 10;
  }
  else if (rng == 7)
  {
    x -= 10;
    y += 10;
  }
 }


}
