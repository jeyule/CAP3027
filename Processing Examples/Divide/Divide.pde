void setup() {
  size(100, 100);
  noStroke();
  fill(0);
}

void draw() {
  background(204);
  if (mouseX < 33) {
    rect(0, 0, 33, 100); // left
  } else if (mouseX < 66) {
    rect(33, 0, 33, 100); // middle
  } else {
    rect(66, 0, 33, 100); // right
  }
}
