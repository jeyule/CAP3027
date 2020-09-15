// walker object

class Walker {
  int x, y;
  
  // constructor
  Walker() {
    x = width/2;
    y = height/2;
  }
  
  // draw the object
  void render() {
    stroke(0);
    point(x, y);
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
  }
}
