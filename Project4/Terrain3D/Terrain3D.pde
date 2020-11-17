import controlP5.*;
import java.util.*;

ControlP5 cp5;

int numRows = 1;
int numCols = 1;
int terrainSize = 30;
boolean strokeControl = true;
boolean colorControl = false;
boolean blendControl = false;
float heightMod = 1;
float snowThres = 5;

Textfield fileName;

ArrayList<PVector> terrainVerts = new ArrayList<PVector>();
ArrayList<Integer> triangleIndices = new ArrayList<Integer>();
ArrayList<PVector> terrainVertsCopy = new ArrayList<PVector>();

//float phi = 90;
//float theta = 90;

float phi = 90;
float theta = 88;

Camera camera = new Camera();

void setup() {
  size(1200, 800, P3D);
  
  background(0);
  
  cp5 = new ControlP5(this);
  
  // the row number slider
  cp5.addSlider("numRows")
    .setPosition(20, 50)
    .setSize(100, 20)
    .setRange(1, 100)
    .getCaptionLabel().setVisible(false);
  cp5.addTextlabel("Rows")
    .setText("ROWS")
    .setPosition(125, 55);
    
  cp5.addSlider("numCols")
    .setPosition(20, 80)
    .setSize(100, 20)
    .setRange(1, 100)
    .getCaptionLabel().setVisible(false);
  cp5.addTextlabel("Columns")
    .setText("COLUMNS")
    .setPosition(125, 85);
    
  // the terrain size slider
  cp5.addSlider("terrainSize")
    .setPosition(20, 110)
    .setSize(100, 20)
    .setRange(20, 50)
    .getCaptionLabel().setVisible(false);
  cp5.addTextlabel("Terrain Size")
    .setText("TERRAIN SIZE")
    .setPosition(125, 115);
    
  // create start button
  cp5.addButton("GENERATE")
    .setPosition(20, 155)
    .setSize(50, 30);
    
  fileName = cp5.addTextfield("fileName")
    .setPosition(20, 190)
    .setSize(80, 20)
    .setValue("terrain1")
    .setAutoClear(false);
    
  // toggle to use stroke
  cp5.addToggle("strokeControl")
    .setPosition(230, 50)
    .setSize(40, 30)
    .getCaptionLabel().setVisible(false);
  cp5.addTextlabel("Stroke")
    .setText("STROKE")
    .setPosition(230, 85);
    
  // toggle to use color
  cp5.addToggle("colorControl")
    .setPosition(280, 50)
    .setSize(40, 30)
    .getCaptionLabel().setVisible(false);
  cp5.addTextlabel("Color")
    .setText("COLOR")
    .setPosition(280, 85);
    
  // toggle to use blend
  cp5.addToggle("blendControl")
    .setPosition(330, 50)
    .setSize(40, 30)
    .getCaptionLabel().setVisible(false);
  cp5.addTextlabel("Blend")
    .setText("BLEND")
    .setPosition(330, 85);
    
  // the height modifier slider
  cp5.addSlider("heightMod")
    .setPosition(230, 95)
    .setSize(100, 20)
    .setRange(-5, 5)
    .getCaptionLabel().setVisible(false);
  cp5.addTextlabel("Height Modifier")
    .setText("HEIGHT MODIFIER")
    .setPosition(335, 100);
    
  // the snow threshold slider
  cp5.addSlider("snowThres")
    .setPosition(230, 125)
    .setSize(100, 20)
    .setRange(1, 5)
    .getCaptionLabel().setVisible(false);
  cp5.addTextlabel("Snow Threshold")
    .setText("SNOW THRESHOLD")
    .setPosition(335, 130);
}

void draw() {
  
  background(0);
 
  pushMatrix();
  
  camera(camera.positionX, camera.positionY, camera.positionZ, width/2, height/2, 0, 0, 1, 0);
  
  // draw the triangles
  for (int i = 0; i < triangleIndices.size(); i++) {
    if (strokeControl) {
      stroke(0);
    } else {
      noStroke();
    }
    beginShape(TRIANGLES);
    
    int vertIndex1 = triangleIndices.get(i);
    PVector vert1 = terrainVerts.get(vertIndex1);
    if (colorControl) {
      color vertColor1 = pickColor(vert1.z);
      fill(vertColor1);
    }
    vertex(vert1.x, vert1.y, vert1.z * heightMod * 15);
    i++;
    
    int vertIndex2 = triangleIndices.get(i);
    PVector vert2 = terrainVerts.get(vertIndex2);
    if (colorControl) {
      color vertColor2 = pickColor(vert2.z);
      fill(vertColor2);
    }
    vertex(vert2.x, vert2.y, vert2.z * heightMod * 15);
    i++;
    
    int vertIndex3 = triangleIndices.get(i);
    PVector vert3 = terrainVerts.get(vertIndex3);
    if (colorControl) {
      color vertColor3 = pickColor(vert3.z);
      fill(vertColor3);
    }
    vertex(vert3.x, vert3.y, vert3.z * heightMod * 15);
    
    endShape();
  }
  
  popMatrix();
  
}

color pickColor(float z) {
  color snow = color(255, 255, 255);
  color rock = color(135, 135, 135);
  color grass = color(143, 170, 64);
  color dirt = color(160, 128, 84);
  color water = color(0, 75, 200);
  
  float relativeHeight = (abs(z*heightMod)) / snowThres;
  
  if (relativeHeight >= 0.8) {
    if (blendControl) {
      float ratio = (relativeHeight - 0.8)/0.2f;
      return lerpColor(rock, snow, ratio);
    } else {
      return snow;
    }
  } else if (relativeHeight >= 0.5 && relativeHeight < 0.8) {
    if (blendControl) {
      float ratio = (relativeHeight - 0.4)/0.4f;
      return lerpColor(grass, rock, ratio);
    } else {
      return rock;
    }
  } else if (relativeHeight >= 0.2 && relativeHeight < 0.5) {
    if (blendControl) {
      float ratio = (relativeHeight - 0.2)/0.2f;
      return lerpColor(dirt, grass, ratio);
    } else {
      return grass;
    }
  } else {
    if (blendControl) {
      float ratio = relativeHeight/0.2f;
      return lerpColor(water, dirt, ratio);
    } else {
      return water;
    }
  }
}

void mouseDragged() {

  if (!cp5.isMouseOver()) {
    //println("X: " + mouseX + " pX: " + pmouseX);
    float x = constrain(mouseX, 0, width-1);
    float px = constrain(pmouseX, 0, width-1);
    float deltaX = (x - px) * 0.15f;
    phi += deltaX;
    
    float y = constrain(mouseY, 0, height-1);
    float py = constrain(pmouseY, 0, height-1);
    float deltaY = (y - py) * 0.15f;
    theta += deltaY;
    theta = constrain(theta, 1, 179);
    camera.Update();
  }
  
}

public void GENERATE() {
  
  background(0);
  
  // clear the lists to regenerate
  terrainVerts.clear();
  triangleIndices.clear();
  
  pushMatrix();
  
  float x;
  float y;
  int startingIndex = 0;
  int stop = numCols;
  int verticesInARow = numCols + 1;
  
  // calculate the vertex positions and triangle indices
  for(int i = 0; i <= numRows; i++) {
    
    y = -(((float)terrainSize * 10)/2) + ((float)terrainSize/numRows) * i * 10;
    
    for (int j = 0; j <= numCols; j++) {
      x = -(((float)terrainSize * 10)/2) + ((float)terrainSize/numCols) * j * 10;
      
      PVector currPoint = new PVector(x + width/2, y + height/2, 0);
      terrainVerts.add(currPoint);
     
      startingIndex = i * verticesInARow + j;
      if (startingIndex <= verticesInARow * numRows - 2) {
      
        if (startingIndex < stop) {
          triangleIndices.add(startingIndex);
          triangleIndices.add(startingIndex + 1);
          triangleIndices.add(startingIndex + verticesInARow);
          
          triangleIndices.add(startingIndex + 1);
          triangleIndices.add(startingIndex + verticesInARow + 1);
          triangleIndices.add(startingIndex + verticesInARow);
        }
      }
    }
    stop += verticesInARow;
  }
  
  if (fileName.getText() != "") {
  
    // load the terrain image and modify the vertex heights
    PImage terrainImage = loadImage(fileName.getText() + ".png");
    
    for (int i = 0; i <= numRows; i++) {
        for (int j = 0; j <= numCols; j++) {
          int x_index = int(map(j, 0, numCols+1, 0, terrainImage.width));
          int y_index = int(map(i, 0, numRows+1, 0, terrainImage.height));
          int pointColor = terrainImage.get(x_index, y_index);
          
          float heightColor = map(red(pointColor), 0, 255, 0, 1.0f);
          
          int vertIndex = i * (numCols + 1) + j;
          (terrainVerts.get(vertIndex)).z = heightColor;
        }
    }
    
  }
  
  popMatrix();

}
