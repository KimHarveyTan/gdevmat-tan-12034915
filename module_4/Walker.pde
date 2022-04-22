public class Walker
{
   float randX = random(1280);
   float randY = random(720);
   float randScale = random(15);
   
   public PVector position = new PVector(randX, randY);
   public PVector velocity = new PVector();
   public PVector acceleration = new PVector();
     
   public float velocityLimit = 30;
   public float scale = randScale;
   
   public Walker()
   {
     
   }
   
   public void update()
   {
     //this.acceleration = PVector.random2D();
     this.velocity.add(this.acceleration);
     this.velocity.limit(velocityLimit);
     this.position.add(this.velocity);
   }
   
   public void render()
   {
      circle(position.x, position.y, scale); 
   }
   
   public void checkEdges()
   {
      if (this.position.x > Window.right)
      {
         this.position.x = Window.left; 
      }
      else if (this.position.x < Window.left)
      {
         this.position.x = Window.right; 
      }
      
      if (this.position.y > Window.top)
      {
         this.position.y = Window.bottom; 
      }
      else if (this.position.y < Window.bottom)
      {
         this.position.y = Window.top; 
      }
   }
}
