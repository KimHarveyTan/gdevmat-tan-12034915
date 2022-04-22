PVector wind = new PVector(0.15, 0);

Walker[] walkers = new Walker[10];

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  //int posX = 0;
  int posY = 0;
 for (int i = 0; i < walkers.length; i++)
 {
   //posX = 2 * (Window.windowWidth / 10) * (i - 5);
   posY = 2 * (Window.windowHeight / 10) * (i - (10 / 2));
   walkers[i] = new Walker();
   walkers[i].position = new PVector(Window.left, posY);
   walkers[i].mass = 10 - i;
   walkers[i].scale = walkers[i].mass * 15;
   walkers[i].r = random(1, 255);
   walkers[i].g = random(1, 255); 
   walkers[i].b = random(1, 255);
   walkers[i].a = random(150, 255);
 }
 
}

void draw()
{
   background(80); 
   
   //line
   strokeWeight(2);
   color black = color(0);
   fill(black);
   stroke(black);
   line(0, Window.top, 0, Window.bottom);
   
   for (int i = 0; i < walkers.length; i++)
   {
     // Friction = -1 * mew * N * v
     float mew = 0.1f; // coefficient of friction
     float mew2 = 0.4f;
     float normal = 1;
     float frictionMagnitude = mew * normal;
     float frictionMagnitude2 = mew2 * normal;
     PVector friction =  walkers[i].velocity.copy(); //copy copies the current velocity of our walker
     PVector friction2 =  walkers[i].velocity.copy();
     friction.mult(-1);
     friction.normalize();
     friction.mult(frictionMagnitude);
     friction2.mult(-1);
     friction2.normalize();
     friction2.mult(frictionMagnitude2);
     walkers[i].applyForce(friction); 
     
     //PVector gravity = new PVector(0, -0.15 * walkers[i].mass);
     walkers[i].render();
     walkers[i].update();
     //walker[i].applyForce(wind);
     //walkers[i].applyForce(gravity);
     walkers[i].acceleration.add(new PVector(0.2, 0));
    
     if (walkers[i].position.y <= Window.bottom)
     {
      walkers[i].position.y = Window.bottom; // Safeguard our position to not overflow toward the farther end of the edge
      walkers[i].velocity.y *= -1; // Newton's Third Law of Motion
     }
     if (walkers[i].position.x >= Window.right - 100)
     {
      walkers[i].position.x = Window.right - 100;
      //walkers[i].velocity.x *= -1;
     }
     if (walkers[i].position.x >= (Window.right/2))
     {
      walkers[i].applyForce(friction2); 
     }
   }
   
   if (mousePressed) 
     {
     clear();
     setup();
     }
}
