Walker[] walkers = new Walker[10];

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  for (int i = 0; i < walkers.length; i++)
 {
  walkers[i] = new Walker();
  walkers[i].position = new PVector(random(Window.left, Window.right), random(Window.bottom, Window.top));
  walkers[i].mass = 10 - i;
  walkers[i].scale = walkers[i].mass * 10;
  walkers[i].r = random(1, 255);
  walkers[i].g = random(1, 255);
  walkers[i].b = random(1, 255);
  walkers[i].a = random(100, 255);
 }
}

void draw()
{
  background(255);
  
   for (int i = 0; i < walkers.length; i++)
   {
    noStroke();
    walkers[i].render();
    walkers[i].update();
    
    walkers[i].calculateAttraction(walkers[i]);
       
      for (int j = 0; j < walkers.length; j++)    
      {
         walkers[j].calculateAttraction(walkers[j]);
       
         if (walkers[i] != walkers[j])
         {
           walkers[i].applyForce(walkers[j].calculateAttraction(walkers[i]));
         }
      }
   }
}
