void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(255);
}

float time = 300;

void draw()
{
  //x
  float gaussian = randomGaussian();
  
  float standardDeviation = 300;
  float mean = 0;
  
  float x = standardDeviation * gaussian + mean;
  
  //y
  float rng = random(-360 , 360);
  
  //circle thickness
  float gaussian2 = randomGaussian();
  
  float standardDeviation2 = 50;
  float mean2 = 0;
  
  float randThickness = standardDeviation2 * gaussian2 + mean2;
  
  //rand color
  int randR = int(random(255));
  int randG = int(random(255));
  int randB = int(random(255));
  int randAl = int(random(10, 100));
  
  color randColor = color(randR, randG, randB, randAl);
  
  noStroke();
  fill(randColor);
  circle(x, rng, randThickness);
  
  //flush screen after 300 frames
  time--;
  
  if (time <= 0)
  {
    background(255);
    time = 300;
  }
} 
