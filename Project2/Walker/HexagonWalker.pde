// this is a subclass of the base walker class that random walks with squares

class HexagonWalker extends BaseWalker {

  float xOrigin = (width + 200) / 2;
  float yOrigin = height / 2;
  
  HexagonWalker(int iterations, int stepRate) {
    super(iterations, stepRate);
    x = (width + 200) / 2;
    y = height / 2;
  }
  
  void DrawHex(float x, float y, float radius) {
    //fill(255);
    beginShape();
    for (int i = 0; i <= 360; i+= 60)
    {
      float xPos = x + cos(radians(i)) * radius;
      float yPos = y + sin(radians(i)) * radius;
  
      vertex(xPos, yPos);
    }
    endShape();
    
  }

  // draw the object
  void render() {
    for (int i = 0; i < pointsX.size(); i++) {
      // add hexagon to the terrain map
      PVector pos = CartesianToHex(pointsX.get(i), pointsY.get(i), stepSize, stepScale, xOrigin, yOrigin);
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
      
      DrawHex(pointsX.get(i), pointsY.get(i), stepSize);
    }
  }
  
  // take a random step
  void step() {

    int random = int(random(6));
    
    float horiDist = 2 * stepSize * stepScale * 0.75;
    float vertDist = sqrt(3) * stepSize * stepScale;
    
    if (random == 0) { // move right
      x += horiDist;
      y -= vertDist/2;
    } else if (random == 1) { // move left
      y -= vertDist;
    } else if (random == 2) { // move up
      x -= horiDist;
      y -= vertDist/2;
    } else if (random == 3) { // move down
      x -= horiDist;
      y += vertDist/2;
    } else if (random == 4) {
      y += vertDist;
    } else if (random == 5) {
      x += horiDist;
      y += vertDist/2;
    }
    
    if (constrain) {
      if (x < 200 + stepSize) {
        x = x + 2 * stepSize * stepScale * 1.5;
      }
      if (x > 1200 - stepSize) {
        x = x - 2 * stepSize * stepScale * 1.5;
      }
      if (y < 0 + stepSize) {
        y = y + sqrt(3) * stepSize * stepScale;
      }
      if (y > 1200 - stepSize) {
        y = y - sqrt(3) * stepSize * stepScale;
      }
    }
    
    pointsX.append(x);
    pointsY.append(y);
    stepNumbers.append(step);
    
    step++;
  }
}

// converts cartesian coordinate to hexagon coordinate
PVector CartesianToHex(float xPos, float yPos, float hexRadius, float stepScale, float xOrigin, float yOrigin)
{
  float startX = xPos - xOrigin;
  float startY = yPos - yOrigin;

  float col = (2.0/3.0f * startX) / (hexRadius * stepScale);
  float row = (-1.0f/3.0f * startX + 1/sqrt(3.0f) * startY) / (hexRadius * stepScale);
  
  /*===== Convert to Cube Coordinates =====*/
  float x = col;
  float z = row;
  float y = -x - z; // x + y + z = 0 in this system
  
  float roundX = round(x);
  float roundY = round(y);
  float roundZ = round(z);
  
  float xDiff = abs(roundX - x);
  float yDiff = abs(roundY - y);
  float zDiff = abs(roundZ - z);
  
  if (xDiff > yDiff && xDiff > zDiff)
    roundX = -roundY - roundZ;
  else if (yDiff > zDiff)
    roundY = -roundX - roundZ;
  else
    roundZ = -roundX - roundY;
    
  /*===== Convert Cube to Axial Coordinates =====*/
  PVector result = new PVector(roundX, roundZ);
  
  return result;
}
