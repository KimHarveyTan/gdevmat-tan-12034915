 Target target = new Target(); 
 Mover[] movers = new Mover[100];
 
void setup()
{
 size(1080, 720, P3D);
 camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
 
 //target rand position
 target.position.x = int(random(Window.left, Window.right));
 target.position.y = int(random(Window.bottom, Window.top));
 
 for (int i = 0; i < movers.length; i++)
 {
   movers[i] = new Mover();
   
 //mover rand x gaussian position
  float gaussian = randomGaussian();
  
  float standardDeviation = 300;
  float mean = 0;
  
  float x = standardDeviation * gaussian + mean;
  
 //mover rand y gaussian position
  float gaussian2 = randomGaussian();
  
  float standardDeviation2 = 300;
  float mean2 = 0;
  
  float y = standardDeviation2 * gaussian2 + mean2;
  
 //mover rand color
  int randR = int(random(255));
  int randG = int(random(255));
  int randB = int(random(255));
  int randAl = int(random(10, 100));
  
 movers[i].setColor(randR, randG, randB, randAl);
 movers[i].position.x = x;
 movers[i].position.y = y;
 }
}

void draw()
{ 
  background(130);
  
  for (int i = 0; i < movers.length; i++)
  {
  movers[i].render();
  target.render(); 
  
  //get direction of movers' position to target position
  PVector direction = PVector.sub(target.position, movers[i].position);
  //move to the direction 
  movers[i].position.add(direction.normalize().mult(10));
  }
}
