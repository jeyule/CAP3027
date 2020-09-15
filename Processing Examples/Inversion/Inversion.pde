void setup() {
  size(100, 100);
  noStroke();
}

void draw() {
  float x = mouseX;
  float y = mouseY;
  float ix = width - mouseX; // inverse X
  float iy = height - mouseY; // inverse Y
  background(126);
  fill(255, 150);
  ellipse(x, height/2, y, y);
  fill(0, 159);
  ellipse(ix, height/2, iy, iy);
}
