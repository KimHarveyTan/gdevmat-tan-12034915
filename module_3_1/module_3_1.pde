void setup()
{
 size(1080, 720, P3D);
 camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

PVector mousePos()
{
  float x = mouseX - Window.windowWidth / 2;
  float y = -(mouseY - Window.windowHeight / 2); 
  return new PVector(x, y);
}

void draw()
{ 
  background(130);
  
  PVector mouse = mousePos();
  
  mouse.normalize();
  mouse.mult(400);
  
  //Red light
  strokeWeight(10);
  stroke(255, 0, 0);
  
  line (0, 0, mouse.x, mouse.y);
  line (0, 0, -mouse.x, -mouse.y);
  
  println(mouse.mag());
  
  //White light
  strokeWeight(5);
  stroke(255, 255, 255);
  
  line (0, 0, mouse.x, mouse.y);
  line (0, 0, -mouse.x, -mouse.y);
  
  //Black handle
  strokeWeight(7);
  stroke(0);
  mouse.div(5);
  
  line (0, 0, mouse.x, mouse.y);
  line (0, 0, -mouse.x, -mouse.y);
}
