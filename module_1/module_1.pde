float time = 0;

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

void draw()
{
  drawCartesianPlane();
  //drawLinearFunction();
  //drawQuadraticFunction();
  //drawCircle();
  drawOne();
  drawTwo();
  drawSine();
}

void drawCartesianPlane()
{
 background(0);
  
  strokeWeight(1);
  color white = color(255, 255, 255);
  fill(white);
  stroke(white);
  line(300,0, -300, 0);
  line (0, -300, 0, 300);
  
  for (int i = -300; i <= 300; i+= 10)
  {
    line(i, -2, i, 2);
    line(-2, i, 2, i);
  } 
}

void drawLinearFunction()
{
  //f(x) = x + 2 
  //Let x be 4, then y = 6    (4,6);
  //Let x be -5, then y = -3   (-5, -3);
  
 color red = color(255, 0, 0);
 fill(red);
 noStroke();
 
 for (int x = -200; x <= 200; x++)
 {
   circle(x, x + 2, 5);
 }
}

void drawQuadraticFunction()
{

   //f(x) = x^2 + 2x - 5;
   //Let x be 2, then y = 3
   //Let x be -1, then y = -6
   
  color green = color (0, 255, 0);
  fill(green);
  stroke(green);
  noStroke();
  for (float x = -300; x <= 300; x += .1f)
  {
   circle(x * 10, (float)Math.pow(x, 2) + (2 * x) - 5, 5); 
  }
}

void drawCircle()
{
 color blue = color (0, 0, 255);
 fill (blue);
 stroke (blue);
 float radius = 50;
 
 for (int x = 0; x <= 360; x++)
 {
  circle((float)Math.cos(x) * radius, (float)Math.sin(x) * radius, 5); 
 }
}

void drawOne()
{
  //f(x) = x^2 − 15x − 3  (yellow color)
  
  color yellow = color (255, 255, 0);
  fill(yellow);
  stroke(yellow);
  noStroke();
  for (float x = -300; x <= 300; x += 0.1f)
  {
   circle(x * 5, (float)Math.pow(x, 2) - (15 * x) - 3, 5); 
  }
}

void drawTwo()
{
  //f(x) = −5x + 30 (purple color)
  
  color purple = color (128,0,128);
  fill(purple);
  stroke(purple);
  noStroke();
  for (float x = -300; x <= 300; x += 0.1f)
  {
   circle(x * 5, (-5 * x) + 30, 5); 
  }
}

void drawSine()
{
  color teal = color (0,128,128);
  fill(teal);
  stroke(teal);
  noStroke();
  
float frequency = 10;
float amplitude = 50;

if (keyPressed) {
     if (key == 'a') frequency -= 40;
     if (key == 'd') frequency += 40;
     if (key == 's') amplitude -= 40;
     if (key == 'w') amplitude += 40;
   }
   
  for (float x = -300; x <= 300; x += .01f)
  {
   circle(x, (float)Math.sin((x / frequency) + time) * amplitude, 5); 
   time += .001f;
  }
}
