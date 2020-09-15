int x = 20;

void setup() {
  size(100, 100);
  strokeWeight(4);
}

void draw() {
  background(204);
  if (keyPressed == true) {
    x++;
  }
  line(x, 20, x-60, 80);
}
