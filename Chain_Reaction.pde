Ball[] arr;
boolean reactStart;

void setup() {
  size(600,600);
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
}

void mouseClicked(){
   reactStart = true;

}