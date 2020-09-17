// program driver

import controlP5.*;

ControlP5 cp5;

// the main random walker object
Walker walker;

// initial states
boolean running = false;
boolean gradual = false;
boolean colors = false;

// counters to keep track of iterations and steps
int counter = 0;
int stepCount = 0;

// default number of iterations
int iterations = 1000;
//default step rate (steps per frame)
int stepRate = 1;

void setup() {
  
  // window size 800 x 800
  size(800, 800);

  background(138, 185, 207);
  
  cp5 = new ControlP5(this);
  
  PFont font = createFont("Arial Narrow Bold", 20);
  PFont font1 = createFont("Arial Narrow Bold", 10);
  
  // create start button
  cp5.addButton("START")
    .setPosition(30, 40)
    .setSize(80, 85)    
    .setFont(font);
    
  // create the gradual step toggle
  cp5.addToggle("gradual")
    .setPosition(120, 40)
    .setSize(55, 25)
    .setFont(font1);
    
  // create the color toggle
  cp5.addToggle("colors")
    .setPosition(120, 85)
    .setSize(55, 25)
    .setFont(font1);
    
  // the iteration number slider
  cp5.addSlider("iterations")
    .setPosition(180, 40)
    .setSize(500, 40)
    .setRange(1000, 500000)
    .setFont(font);
    
  // the ste count slider
  cp5.addSlider("stepRate")
    .setPosition(180, 85)
    .setSize(500, 40)
    .setRange(1, 1000)
    .setFont(font);
}

void draw() {  
  
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
