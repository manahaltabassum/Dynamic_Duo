public class Ball {
  int radius = 20;
  int xcor = (int)(Math.random() * width);
  int ycor = (int)(Math.random() * height);
  int state = 0;
  int xmvmt;
  int ymvmt;
  color shade;

  Ball() {
    xmvmt = (int)(Math.random() * 10);
    ymvmt = (int)(Math.random() * 10);
    shade = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
  }

  void display() {
    fill(shade);
    ellipse(xcor, ycor, radius, radius);
  }

  void move() {
    xcor += xmvmt;
    ycor += ymvmt;
    if (xcor > width || xcor < 0) {
      xcor -= xmvmt;
      xmvmt *= -1;
    }
    if (ycor > height || ycor < 0) {
      ycor -= ymvmt;
      ymvmt *= -1;
    }
    checkForCollision(balls);
  }

  void grow() {
    radius += 2; 
    if (radius >= 100) {
      state = 2;
    }
  }
  void shrink() {
    radius -= 2;
    if (radius <= 0) {
      state = 3;
    }
  }
  void checkForCollision( ArrayList<Ball> AL) {
    for (int i = 0; i < AL.size(); i++) {
      if (AL.get(i).state!= 0) {
        if (distance(xcor, ycor, AL.get(i).xcor, AL.get(i).ycor) <= radius+AL.get(i).radius) {
          state = 1;
        }
      }
    }
  }

  void run() {
    if (state == 0) {
      move();
    } else if (state ==1) {
      grow();
    } else if (state ==2) {
      shrink();
    }
    display();
  }
}