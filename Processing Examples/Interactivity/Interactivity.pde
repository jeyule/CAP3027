//// prints mouse position
//void draw() {
//  frameRate(12);
//  println(mouseX + " : " + mouseY);
//}

// set the window and size
void setup() {
  size(100, 100);
  noStroke();
}

// draws three circles that follow mouse
void draw() {
  // set background color
  background(126);
  ellipse(mouseX, 16, 33, 33);   // Top circle
  ellipse(mouseX/2, 50, 33, 33); // Middle circle
  ellipse(mouseX*2, 84, 33, 33); // Bottom circle
}
