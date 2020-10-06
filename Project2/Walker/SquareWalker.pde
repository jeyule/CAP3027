// this is a subclass of the base walker class that random walks with squares

class SquareWalker extends BaseWalker {
  
  SquareWalker(int iterations, int stepRate) {
    super(iterations, stepRate);
    x = 0;
    y = 0;
  }

  // draw the object
  void render() {
    
    for(int i = 0; i < pointsX.size(); i++) {
      
      int xCoor = (width + 200)/2 + (int(pointsX.get(i)) * int(stepSize*stepScale));
      int yCoor = (height/2) + (int(pointsY.get(i)) * int(stepSize*stepScale));
      
      // add square to the terrain map
      PVector pos = new PVector(xCoor, yCoor);
      if (terrainMap.containsKey(pos)) {
        terrainMap.put(pos, terrainMap.get(pos) + 1);
      } else {
        terrainMap.put(pos, 1);
      }
      
      if (terrain) {
        if (terrainMap.get(pos) < 4) {
          fill(160, 126, 84);
        } else if (terrainMap.get(pos) >= 4 && terrainMap.get(pos) < 7) {
          fill(143, 170, 64);
        } else if (terrainMap.get(pos) >= 7 && terrainMap.get(pos) < 10) {
          fill(135, 135, 135);
        } else {
          int snow = terrainMap.get(pos) * 20;
          snow = constrain(snow, 0, 255);
          fill(snow);
        }
      } else {
        fill(240, 173, 255);
      }
      if (!outline) {
        noStroke();
      } else {
        stroke(1);
      }
      
      square(xCoor, yCoor, stepSize);
    }
  }
  
  // take a random step
  void step() {

    int random = int(random(4));
   
    if (random == 0) { // move right
      x += 1;
    } else if (random == 1) { // move left
      x -= 1;
    } else if (random == 2) { // move up
      y += 1;
    } else { // move down
      y -= 1;
    }
    
    if (constrain) {
      x = constrain(x, -500/int(stepSize * stepScale), (500 - int(stepSize * stepScale))/int(stepSize * stepScale));
      y = constrain(y, -400/int(stepSize * stepScale), (400 - int(stepSize * stepScale))/int(stepSize * stepScale));
    }
    
    pointsX.append(x);
    pointsY.append(y);
    stepNumbers.append(step);
    
    step++;
  }
  
}
