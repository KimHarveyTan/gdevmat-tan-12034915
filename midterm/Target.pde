public class Target
{
   public PVector position;
   public float scale = 50;
   public float r = 255, g = 255, b = 255, a = 255;
   
   Target()
   {
      position = new PVector(); 
   }
   
   Target(float x, float y)
   {
      position = new PVector(x, y);
   }
   
   
   Target(float x, float y, float scale)
   {
      position = new PVector(x, y);
      this.scale = scale;
   }
   
   Target(PVector position)
   {
      this.position = position; 
   }
   
   Target(PVector position, float scale)
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
   
   public void setColor(float r, float g, float b, float a)
   {
      this.r = r;
      this.g = g;
      this.b = b;
      this.a = a;
   }
}
