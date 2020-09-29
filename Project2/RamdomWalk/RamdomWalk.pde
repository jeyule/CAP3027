// program driver

import controlP5.*;

ControlP5 cp5;

// the main random walker object
Walker walker;

// initial states
boolean running = false;
boolean gradual = false;
boolean colors = false;
boolean constrain = true;
boolean terrain = true;
boolean stroke = false;
boolean seed = false;
int seedValue = 0;

// the shape menu
DropdownList shapeMenu;

// seed value textfield
Textfield seed_value;

// counters to keep track of iterations and steps
int counter = 0;
int stepCount = 0;

// default number of iterations
int iterations = 1000;
//default step rate (steps per frame)
int stepRate = 1;

// the size of a step (shape size)
int stepSize = 10;
// modifier for the size of a step
float stepScale = 1.0;

void setup() {
  
  // window size 800 x 800
  size(1200, 800);

  background(138, 185, 207);
  
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
  cp5.addSlider("iterations")
    .setPosition(20, 225)
    .setSize(160, 30)
    .setRange(100, 50000)
    .getCaptionLabel().setVisible(false);
  cp5.addTextlabel("Maximum Steps")
    .setText("Maximum Steps")
    .setPosition(20, 213);
    
  // the step count slider
  cp5.addSlider("stepRate")
    .setPosition(20, 275)
    .setSize(160, 30)
    .setRange(1, 1000)
    .getCaptionLabel().setVisible(false);
  cp5.addTextlabel("Step Rate")
    .setText("Step Rate")
    .setPosition(20, 263);
    
  // step size slider
  cp5.addSlider("stepSize")
    .setPosition(20, 335)
    .setSize(160, 30)
    .setRange(10, 30)
    .getCaptionLabel().setVisible(false);
  cp5.addTextlabel("Step Size")
    .setText("Step Size")
    .setPosition(20, 323);
    
  // step scale slider
  cp5.addSlider("stepScale")
    .setPosition(20, 385)
    .setSize(160, 30)
    .setRange(1.0, 1.5)
    .getCaptionLabel().setVisible(false);
  cp5.addTextlabel("Step Scale")
    .setText("Step Scale")
    .setPosition(20, 373);    
    
  // toggle to constrain to viewable area
  cp5.addToggle("constrain")
    .setPosition(20, 440)
    .setSize(30, 30);
    
  // toggle to use terrain 
  cp5.addToggle("terrain")
    .setPosition(20, 490)
    .setSize(30, 30);
    
  // toggle to use stroke
  cp5.addToggle("stroke")
    .setPosition(20, 540)
    .setSize(30, 30);
    
  // toggle to use random seed
  cp5.addToggle("seed")
    .setPosition(20, 590)
    .setSize(30, 30);
    
  // text field for the seed value
  seed_value = cp5.addTextfield("seed_value")
    .setPosition(80, 590)
    .setSize(100, 30)
    .setFocus(true)
    .setInputFilter(ControlP5.INTEGER);
}

void draw() {  
  
  // draw the UI background
  fill(128);
  rect(0, 0, 200, 800);
  
  if (seed && !seed_value.getText().trim().isEmpty()) {
    seedValue = Integer.parseInt(seed_value.getText());
  }
  
  // loop for the random walk
  if (running) {

    // if gradual option selected, updates at the set step count
    if (gradual) {
      stepCount = stepRate;
    } else { // otherwise updates all at once at the end
      stepCount = iterations - counter; // substract to get how many iterations are left
    }
    
    // take the set number of steps for this update
    int i = 0;
    while (i < stepCount) {
      walker.step();
      i++;
      
      counter++;
  
      // set number of iterations reached, so stop
      if (counter > iterations-1) {
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
}

// start walk once START button clicked
public void START() {
  walker = new Walker(iterations);
  background(138, 185, 207);
  running = true;
}
