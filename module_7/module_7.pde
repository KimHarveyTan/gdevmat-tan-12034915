Liquid ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);
Walker[] walkers = new Walker[10];

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  int posX = 0;
 for (int i = 0; i < walkers.length; i++)
 {
  posX = 2 * (Window.windowWidth / 10) * (i - 5);
  walkers[i] = new Walker(); 
  walkers[i].position = new PVector(posX, 200);
  walkers[i].mass = 10 - i;
  walkers[i].scale = walkers[i].mass * 10;
  walkers[i].r = random(1, 255);
  walkers[i].g = random(1, 255);
  walkers[i].b = random(1, 255);;
 }
}

void draw()
{
  background(255); 
  ocean.render();
  
   for (int i = 0; i < walkers.length; i++)
 {
  noStroke();
  walkers[i].render();
  walkers[i].update();
  
  PVector gravity = new PVector(0, -0.15f * walkers[i].mass);
  walkers[i].applyForce(gravity); // applying gravity to our Walker
  
  PVector wind = new PVector(0.1, 0);
  walkers[i].applyForce(wind); // applying wind to our Walker
  
  float c = 0.1f;
  float normal = 1;
  float frictionMagnitude = c * normal;
  PVector friction = walkers[i].velocity.copy();
  // F = -uNv
  walkers[i].applyForce(friction.mult(-1).normalize().mult(frictionMagnitude)); // applying friction to Walker
  
  walkers[i].applyForce(wind);
  
     if (walkers[i].position.y <= Window.bottom)
     {
      walkers[i].position.y = Window.bottom; // Safeguard our position to not overflow toward the farther end of the edge
      walkers[i].velocity.y *= -1; // Newton's Third Law of Motion
     }
     if (walkers[i].position.x >= Window.right)
     {
      walkers[i].position.x = Window.right;
      walkers[i].velocity.x *= -1;
     }
     
     if (ocean.isCollidingWith(walkers[i]))
     {
      PVector dragForce = ocean.calculateDragForce(walkers[i]);
      walkers[i].applyForce(dragForce); 
     }
 }
}
