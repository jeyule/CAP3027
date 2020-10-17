Camera camera = new Camera();

Target currTarget = new Target();
ArrayList<Target> targets = new ArrayList<Target>();

float phi;
float theta;

PShape cube;

void setup() {
  size(1600, 1000, P3D);
  
  perspective(radians(50.0f), width/(float)height, 0.1, 1000);
  
  // creating cube shape
  cube = createCube();
  PVector cube1Pos = new PVector(-100, 0, 0);
  Target cube1 = new Target(cube1Pos);
  targets.add(cube1);
  
  currTarget = targets.get(0);
  
}

PShape createCube() {
  PShape newCube = createShape(GROUP);
  PShape triangle1 = createShape();
  triangle1.beginShape();
  triangle1.vertex(0.5, -0.5, 0.5); // side 1 
  triangle1.vertex(0.5, 0.5, 0.5);
  triangle1.vertex(0.5, 0.5, -0.5);
  triangle1.endShape();
  triangle1.setFill(color(0, 255, 0));
  PShape triangle2 = createShape();
  triangle2.beginShape();
  triangle2.vertex(0.5, 0.5, -0.5);
  triangle2.vertex(0.5, -0.5, -0.5);
  triangle2.vertex(0.5, -0.5, 0.5); 
  triangle2.endShape();
  triangle2.setFill(color(255, 248, 54));
  PShape triangle3 = createShape();
  triangle3.beginShape();
  triangle3.vertex(0.5, -0.5, -0.5); // side 2
  triangle3.vertex(0.5, -0.5, 0.5);
  triangle3.vertex(-0.5, -0.5, 0.5);
  triangle3.endShape();
  triangle3.setFill(color(194, 194, 194));
  PShape triangle4 = createShape();
  triangle4.beginShape();
  triangle4.vertex(-0.5, -0.5, 0.5);
  triangle4.vertex(-0.5, -0.5, -0.5);
  triangle4.vertex(0.5, -0.5, -0.5);
  triangle4.endShape();
  triangle4.setFill(color(0, 0, 255));
  PShape triangle5 = createShape();
  triangle5.beginShape();
  triangle5.vertex(-0.5, -0.5, -0.5); // side 3
  triangle5.vertex(-0.5, -0.5, 0.5);
  triangle5.vertex(-0.5, 0.5, 0.5);
  triangle5.endShape();
  triangle5.setFill(color(50, 155, 255));
  PShape triangle6 = createShape();
  triangle6.beginShape();
  triangle6.vertex(-0.5, 0.5, 0.5);
  triangle6.vertex(-0.5, 0.5, -0.5);
  triangle6.vertex(-0.5, -0.5, -0.5);
  triangle6.endShape();
  triangle6.setFill(color(204, 86, 255));
  PShape triangle7 = createShape();
  triangle7.beginShape();
  triangle7.vertex(0.5, 0.5, 0.5); // side 4
  triangle7.vertex(-0.5, 0.5, 0.5);
  triangle7.vertex(-0.5, 0.5, -0.5);
  triangle7.endShape();
  triangle7.setFill(color(255, 59, 190));
  PShape triangle8 = createShape();
  triangle8.beginShape();
  triangle8.vertex(-0.5, 0.5, -0.5);
  triangle8.vertex(0.5, 0.5, -0.5);
  triangle8.vertex(0.5, 0.5, 0.5);
  triangle8.endShape();
  triangle8.setFill(color(255, 190, 57));
  PShape triangle9 = createShape();
  triangle9.beginShape();
  triangle9.vertex(0.5, -0.5, 0.5); // side 5
  triangle9.vertex(-0.5, -0.5, 0.5);
  triangle9.vertex(-0.5, 0.5, 0.5);
  triangle9.endShape();
  triangle9.setFill(color(196, 65, 0));
  PShape triangle10 = createShape();
  triangle10.beginShape();
  triangle10.vertex(-0.5, 0.5, 0.5);
  triangle10.vertex(0.5, 0.5, 0.5);
  triangle10.vertex(0.5, -0.5, 0.5);
  triangle10.endShape();
  triangle10.setFill(color(71, 191, 0));
  PShape triangle11 = createShape();
  triangle11.beginShape();
  triangle11.vertex(0.5, -0.5, -0.5); // side 6
  triangle11.vertex(-0.5, 0.5, -0.5);
  triangle11.vertex(0.5, 0.5, -0.5);
  triangle11.endShape();
  triangle11.setFill(color(196, 175, 255));
  PShape triangle12 = createShape();
  triangle12.beginShape();
  triangle12.vertex(0.5, -0.5, -0.5);
  triangle12.vertex(-0.5, -0.5, -0.5);
  triangle12.vertex(-0.5, 0.5, -0.5);
  triangle12.endShape();
  triangle12.setFill(color(61, 64, 255));
  newCube.addChild(triangle1);
  newCube.addChild(triangle2);
  newCube.addChild(triangle3);
  newCube.addChild(triangle4);
  newCube.addChild(triangle5);
  newCube.addChild(triangle6);
  newCube.addChild(triangle7);
  newCube.addChild(triangle8);
  newCube.addChild(triangle9);
  newCube.addChild(triangle10);
  newCube.addChild(triangle11);
  newCube.addChild(triangle12);
  
  return newCube;
}

void draw() {
  background(155);
  
  camera(camera.positionX, camera.positionY, camera.positionZ, currTarget.position.x, currTarget.position.y, currTarget.position.z, 0, 1, 0);
  
  pushMatrix();
  //translate(width/2, height/2);
  camera.Update();
  drawGrid(20);
  
  pushMatrix();
  translate(-110, 0, 0);
  shape(cube);
  popMatrix();
  
  translate(-100, 0, 0);
  pushMatrix();
  scale(5, 5, 5);
  shape(cube);
  popMatrix();
  
  pushMatrix();
  translate(10, 0, 0);
  scale(10, 20, 10);
  shape(cube);
  popMatrix();
  
  popMatrix();
}
  
void drawGrid(int count) {
  float size = count * 10;
  for (int i = 0; i <= count; i++) {
    stroke(255);
    float pos = map(i, 0, count, -0.5 * size, 0.5 * size);
    if (i == count / 2) {
      stroke(255, 0, 0);
    }
    line (pos, 0, -size/2, pos, 0, size/2);
    if (i == count / 2) {
      stroke(0, 0, 255);
    }
    line (-size/2, 0, pos, size/2, 0, pos);
  }
}

void mouseMoved() {
  //float rate = 0.01;
  //camera.rotX += (pmouseY-mouseY) * rate;
  //camera.rotY -= (mouseX-pmouseX) * rate;
  
  float x = constrain(mouseX, 0, width-1);
  phi = map(x, 0, width - 1, 0, 360);
  float y = constrain(mouseY, 0, height-1);
  theta = map(y, 0, height - 1, 0, 179);
  
  phi = radians(phi);
  theta = radians(theta);
  
  float derivedX = 200 * cos(phi) * sin(theta);
  float derivedY = 200 * cos(theta);
  float derivedZ = 200 * sin(theta) * sin(phi);
  
  camera.positionX = currTarget.position.x + derivedX;
  camera.positionY = currTarget.position.y + derivedY;
  camera.positionZ = currTarget.position.z + derivedZ;
}
