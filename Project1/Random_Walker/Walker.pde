// walker object

public class Walker {
  int x, y;

  //store the x and y coordinates of this frame update
  IntList pointsX = new IntList();
  IntList pointsY = new IntList();
  
  // constructor
  Walker() {
    x = width/2;
    y = height/2;
  }
  
  // draw the object
  void render() {
    //stroke(0);
    //point(x, y);
    
    for(int i = 0; i < pointsX.size(); i++) {
      stroke(0);
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
  }
}
