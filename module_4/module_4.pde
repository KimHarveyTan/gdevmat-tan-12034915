Walker[] myWalker = new Walker[100];

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  //myWalker.acceleration = new PVector(-0.01, 0.1);
  
  for (int i = 0; i < myWalker.length; i++)
 {
   myWalker[i] = new Walker();
 }
}

/* Vector Motion 101
  1. Add velocity to position
  2. Draw the object at position
*/

PVector mousePos()
{
  float x = mouseX - Window.widthPx / 2;
  float y = -(mouseY - Window.heightPx / 2); 
  return new PVector(x, y);
}

void draw()
{
 background(80);
 
 PVector mouse = mousePos();
 
 for (int i = 0; i < myWalker.length; i++)
  {
 myWalker[i].update();
 myWalker[i].render();
 //myWalker[i].checkEdges();
 
 PVector direction = PVector.sub(mouse, myWalker[i].position);
 
 myWalker[i].position.add(direction.normalize().mult(11));
 myWalker[i].acceleration.add(direction.normalize());
  }
 
}
