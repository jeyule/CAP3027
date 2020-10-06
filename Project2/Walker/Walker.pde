// the main driver program

import controlP5.*;

ControlP5 cp5;

// the shape menu
DropdownList shapeMenu;
// seed value textfield
Textfield seed_value;

boolean running = false;

int iterationsControl = 100;
int stepRateControl = 1;
int stepSizeControl = 10;
float stepScaleControl = 1.0;
boolean constrainControl = true;
boolean terrainControl = true;
boolean outlineControl = false;
boolean seedControl = false;
int seedValueControl = 0;
int counter = 0;

BaseWalker walker = null;

void setup() {
  
  // window size 800 x 800
  size(1200, 800);

  background(138, 185, 207);
  
  // draw the UI background
  fill(128);
  rect(0, 0, 200, 800);
  
  cp5 = new ControlP5(this);
  
  PFont font = createFont("Arial Narrow Bold", 20);
  PFont font1 = createFont("Arial Narrow Bold", 10);
  
  // create start button
  cp5.addButton("START")
    .setPosition(40, 40)
    .setSize(120, 40)    
    .setFont(font)
    .setColorBackground(0xff1BCD00);
   
  shapeMenu = cp5.addDropdownList("Shape Menu")
    .setPosition(20, 90)
    .setSize(160, 110)
    .setItemHeight(35)
    .setBarHeight(35)
    .addItem("SQUARES", 0)
    .addItem("HEXAGONS", 1);
    
  // the iteration number slider
  cp5.addSlider("iterationsControl")
    .setPosition(20, 225)
    .setSize(160, 30)
    .setRange(100, 50000)
    .getCaptionLabel().setVisible(false);
  cp5.addTextlabel("Maximum Steps")
    .setText("Maximum Steps")
    .setPosition(20, 213);
    
  // the step count slider
  cp5.addSlider("stepRateControl")
    .setPosition(20, 275)
    .setSize(160, 30)
    .setRange(1, 1000)
    .getCaptionLabel().setVisible(false);
  cp5.addTextlabel("Step Rate")
    .setText("Step Rate")
    .setPosition(20, 263);
    
  // step size slider
  cp5.addSlider("stepSizeControl")
    .setPosition(20, 335)
    .setSize(160, 30)
    .setRange(10, 30)
    .getCaptionLabel().setVisible(false);
  cp5.addTextlabel("Step Size")
    .setText("Step Size")
    .setPosition(20, 323);
    
  // step scale slider
  cp5.addSlider("stepScaleControl")
    .setPosition(20, 385)
    .setSize(160, 30)
    .setRange(1.0, 1.5)
    .getCaptionLabel().setVisible(false);
  cp5.addTextlabel("Step Scale")
    .setText("Step Scale")
    .setPosition(20, 373);    
    
  // toggle to constrain to viewable area
  cp5.addToggle("constrainControl")
    .setPosition(20, 440)
    .setSize(30, 30)
    .getCaptionLabel().setVisible(false);
  cp5.addTextlabel("Constrain Control")
    .setText("Constrain")
    .setPosition(16, 472);
    
  // toggle to use terrain
  cp5.addToggle("terrainControl")
    .setPosition(20, 490)
    .setSize(30, 30)
    .getCaptionLabel().setVisible(false);
  cp5.addTextlabel("Terrain Control")
    .setText("Terrain")
    .setPosition(16, 522);
    
  // toggle to use stroke
  cp5.addToggle("outlineControl")
    .setPosition(20, 540)
    .setSize(30, 30)
    .getCaptionLabel().setVisible(false);
  cp5.addTextlabel("Outline Control")
    .setText("Stroke")
    .setPosition(16, 572);
    
  // toggle to use random seed
  cp5.addToggle("seedControl")
    .setPosition(20, 590)
    .setSize(30, 30)
    .getCaptionLabel().setVisible(false);
  cp5.addTextlabel("Seed Control")
    .setText("Seed")
    .setPosition(16, 622);
    
  // text field for the seed value
  seed_value = cp5.addTextfield("seed_value")
    .setPosition(80, 590)
    .setSize(100, 30)
    .setInputFilter(ControlP5.INTEGER);
}

void draw() {  
  
  if (seedControl && !seed_value.getText().trim().isEmpty()) {
    seedValueControl = Integer.parseInt(seed_value.getText());
  }
  
  if (walker != null) {
    update();
  }
  
  // loop for the random walk
  if (running) {
    
    walker.stepCount = walker.stepRate;
    
    // take the set number of steps for this update
    int i = 0;
    while (i < walker.stepCount) {
      walker.step();
      i++;
      
      counter++;
  
      // set number of iterations reached, so stop
      if (counter > walker.iterations-1) {
        running = false;
        counter = 0;
        break;
      }
      
    }
    
    // render the new points
    walker.render();
    
    // reset for the next increment
    i = 0;
    walker.pointsX.clear();
    walker.pointsY.clear();
    walker.stepNumbers.clear();
  }
  
  fill(128);
  rect(0, 0, 200, 800);

}

// start walk once START button clicked
public void START() {
  
  if (shapeMenu.getValue() == 0) {
    walker = new SquareWalker(iterationsControl, stepRateControl);
  } else if (shapeMenu.getValue() == 1) {
    walker = new HexagonWalker(iterationsControl, stepRateControl);
  }
  
  update();
  
  if (walker.seed) {
    randomSeed(walker.seedValue);
  } else {
    randomSeed(millis());
  }
  
  background(138, 185, 207);
  fill(128);
  rect(0, 0, 200, 800);
  running = true;
}

void update() {
  walker.constrain = constrainControl;
  walker.terrain = terrainControl;
  walker.outline = outlineControl;
  walker.seed = seedControl;
  walker.seedValue = seedValueControl;
  walker.iterations = iterationsControl;
  walker.stepRate = stepRateControl;
  walker.stepSize = stepSizeControl;
  walker.stepScale = stepScaleControl;
}
