Walker[] walkers = new Walker[10];

PVector wind = new PVector(0.15, 0);
PVector gravity = new PVector(0, -0.4);

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
   for (int i = 0; i < walkers.length; i++)
 {
   walkers[i] = new Walker();
  
  float rMass = random(10);
  int randR = int(random(255));
  int randG = int(random(255));
  int randB = int(random(255));
  int randAl = int(random(120, 255)); 
  
  walkers[i].setPosition(-500, 200);
  walkers[i].mass = rMass;
  walkers[i].scale = walkers[i].mass * 15;
  walkers[i].setColor(randR, randG, randB, randAl);
 }
}

void draw()
{
 background(80);  
 
   for (int i = 0; i < walkers.length; i++)
 {
 walkers[i].render();
 walkers[i].update();
 walkers[i].applyForce(wind);
 walkers[i].applyForce(gravity);
 
 if (walkers[i].position.y <= Window.bottom)
 {
  walkers[i].velocity.y *= -1; // Newton's Third Law of Motion
 }
 if (walkers[i].position.x >= Window.right)
 {
  walkers[i].velocity.x *= -1;
 }
 }
}
