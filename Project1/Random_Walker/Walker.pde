// walker object

public class Walker {
  int x, y, step, iters;

  //store the x and y coordinates of this frame update
  IntList pointsX = new IntList();
  IntList pointsY = new IntList();
  IntList stepNumbers = new IntList();
  
  // constructor
  Walker(int iterations) {
    x = width/2;
    y = height/2;
    step = 0;
    iters = iterations;
  }
  
  // draw the object
  void render() {
    //stroke(0);
    //point(x, y);
    
    for(int i = 0; i < pointsX.size(); i++) {
      if (colors) { // map step number to the range 0-255 to get the color if option is selected
        int currStep = stepNumbers.get(i);
        float stepColor = map(currStep, 0, iters, 0, 255);
        stroke(stepColor);
      } else { // else everything is black
        stroke(0);
      }
      point(pointsX.get(i), pointsY.get(i));
    }
  }
  
  // take a random step
  void step() {
    
    int random = int(random(4));
   
    if (random == 0) { // move right
      x++;
    } else if (random == 1) { // move left
      x--;
    } else if (random == 2) { // move up
      y++;
    } else { // move down
      y--;
    }
    
    // clamp values
    x = constrain(x, 0, 800);
    y = constrain(y, 0, 800);
    
    pointsX.append(x);
    pointsY.append(y);
    stepNumbers.append(step);
    
    step++;
  }
}
