Ball[] arr;
boolean reactStart;

void setup() {
  size(600, 600);
  reactStart =false;
  arr = new Ball[20];
  for (int i = 0; i < arr.length; i++) {
    arr[i] = new Ball();
  }
}

void draw() {
  background(0);
  for (int i = 0; i < arr.length; i++) {
    arr[i].run();
  }
  checkForDead();
}

void checkForDead() {
  for (int i = arr.length-1; i >= 0; i--) {
    if (arr[i] != null) {
      if (arr[i].state == 3 ) {
        arr[i] = null;
      }
    }
  }
}

double distance( int ballx, int bally, int mousex, int mousey) {
  return (double)Math.sqrt((Math.pow(ballx, 2) - Math.pow(mousex, 2)) + (Math.pow(bally, 2) - Math.pow(mousey, 2)));
}

void mouseClicked() {
  reactStart = true;
  for (int i = 0; i < arr.length; i++) {
    if ((int)distance(arr[i].xcor, arr[i].ycor, mouseX, mouseY) <= arr[i].radius*2) {
      arr[i].state = 1;
    }
  }
}