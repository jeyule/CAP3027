int dragX, dragY, moveX, moveY;

void setup() {
  size(100, 100);
  noStroke();
}

void draw() {
  background(204);
  fill(0); 
  ellipse(dragX, dragY, 33, 33); // Black circle
  fill(153);
  ellipse(moveX, moveY, 33, 33); // Gray circle
}

void mouseMoved() { // Moves gray circle when mouse moves w/o pressing
  moveX = mouseX;
  moveY = mouseY;
}

void mouseDragged() { // Move black circle when mouse moves and button pressed
  dragX = mouseX;
  dragY = mouseY;
}
