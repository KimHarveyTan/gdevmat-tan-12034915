public class Mover
{
   public PVector position;
   public float scale = int(random(45));
   public float r = 255, g = 255, b = 255, a = 255;
   
   Mover()
   {
      position = new PVector(); 
   }
   
   Mover(float x, float y)
   {
      position = new PVector(x, y);
   }
   
   
   Mover(float x, float y, float scale)
   {
      position = new PVector(x, y);
      this.scale = scale;
   }
   
   Mover(PVector position)
   {
      this.position = position; 
   }
   
   Mover(PVector position, float scale)
   {
      this.position = position; 
      this.scale = scale;
   }
   
   
   public void render()
   {
      noStroke();
      fill(r,g,b,a);
      circle(position.x, position.y, scale); 
   }
   
   public void setColor(int r, int g, int b, int a)
   {
      this.r = r;
      this.g = g;
      this.b = b;
      this.a = a;
   }
}
