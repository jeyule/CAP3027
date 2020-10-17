//int grid = 100;
//PVector bpos = new PVector();
//float bsize = grid;
//float bspeedX, bspeedY, bspeedZ;
//float cameraRotateX;
//float cameraRotateY;
//float cameraSpeed;
//int gridCount = 50;
//PVector pos, speed;
//float accelMag;
//PVector pressedDir = new PVector();

//void setup() {
//  size(1600, 1000, P3D);
//  cameraSpeed = TWO_PI / width;
//  cameraRotateY = -PI/6;
//  pos = new PVector();
//  speed = new PVector();
//  accelMag = 2;
//}

//void draw() {
//  print("X: " + pos.x);
//  print("Y: " + pos.y);
//  print("Z: " + pos.z);
//  //camera(0, 0, 0, 0, 0, 0, 0, 1, 0);
  
//  lights();
//  translate(width/2, height/10);
//  rotateX(cameraRotateY);
//  rotateY(cameraRotateX);
//  background(125);
//  pushMatrix();
//  translate(bpos.x, height/2 + bpos.y, bpos.z);
//  stroke(255);
//  fill(0);
//  //rotateY(atan2(speed.x, speed.y));
//  box(bsize);
//  popMatrix();
  
//  PVector accel = getMovementDir().rotate(cameraRotateX).mult(accelMag);
//  speed.add(accel);
//  pos.add(speed);
//  speed.mult(0.9);
//  translate(0, height/2+bsize/2);
//  drawGrid(gridCount);
//}

//void drawGrid(int count) {
//  translate(-pos.x, 0, -pos.y);
//  stroke(255);
//  float size = (count - 1) * bsize * 2;
//  for (int i = 0; i < count; i++) {
//    float pos = map(i, 0, count - 1, -0.5 * size, 0.5 * size);
//    line (pos, 0, -size/2, pos, 0, size/2);
//    line (-size/2, 0, pos, size/2, 0, pos);
//  }
//}

//void mouseMoved() {
//  cameraRotateX += (mouseX - pmouseX) * cameraSpeed;
//  cameraRotateY += (pmouseY - mouseY) * cameraSpeed;
//  cameraRotateY = constrain(cameraRotateY, -HALF_PI, HALF_PI);
//}

//PVector getMovementDir() {
//  return pressedDir.copy().normalize();
//}
