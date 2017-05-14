public class Ball{
   int radius = 20;
   int xcor = (int)(Math.random() * width);
   int ycor = (int)(Math.random() * height);
   boolean alive = true;
   int xmvmt;
   int ymvmt;
   color shade;
   
   Ball(){
       xmvmt = (int)(Math.random() * 10);
       ymvmt = (int)(Math.random() * 10);
       shade = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
   }
   
   void display(){
     fill(shade);
     ellipse(xcor,ycor,radius,radius);
   }
   
   void move(){
     xcor += xmvmt;
     ycor += ymvmt;
     if (xcor > width || xcor < 0){
       xcor -= xmvmt;
       xmvmt *= -1;
      }
     if (ycor > height || ycor < 0){
       ycor -= ymvmt;
       ymvmt *= -1;
     }
   }
   
   void grow(){
     while (radius < 100){
        radius += 10; 
     }
   }
   void shrink(){
     while (radius < 100){
        radius += 10; 
   }
   }
   
   void run(){
      move();
      display();
   }
  
}