ArrayList<Ball> balls;
boolean reactStart;

void setup() {
  size(600, 600);
  reactStart =false;
  balls = new ArrayList<Ball>();
  for (int i = 0; i < 20; i++) {
    balls.add(new Ball());
  }
}

void draw() {
  background(0);
  for (int i = 0; i <balls.size(); i++) {
    balls.get(i).run();
  }
  checkForDead();
}

void checkForDead() {
  for (int i = balls.size()-1; i >= 0; i--) {
    if (balls.get(i).state == 3 ) {
      balls.remove(i);
    }
  }
}

double distance( int ballx, int bally, int mousex, int mousey) {
  return (double)Math.sqrt((Math.pow(ballx, 2) - Math.pow(mousex, 2)) + (Math.pow(bally, 2) - Math.pow(mousey, 2)));
}

void mouseClicked() {
  reactStart = true;
  for (int i = 0; i < balls.size(); i++) {
    if ((int)distance(balls.get(i).xcor, balls.get(i).ycor, mouseX, mouseY) <= balls.get(i).radius*1.5) {
      balls.get(i).state = 1;
    }
  }
}