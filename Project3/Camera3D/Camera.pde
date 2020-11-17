public class Camera {
  
  float positionX = width/2; 
  float positionY = height/2;
  float positionZ = 0;
  
  float zoom = 50;
  
  int targetIndex = 0;
  
  public void Update() {
    float x = constrain(mouseX, 0, width-1);
    phi = map(x, 0, width - 1, 0, 360);
    float y = constrain(mouseY, 0, height-1);
    theta = map(y, 0, height - 1, 0, 179);
    
    phi = radians(phi);
    theta = radians(theta);
    
    float derivedX = 200 * cos(phi) * sin(theta);
    float derivedY = 200 * cos(theta);
    float derivedZ = 200 * sin(theta) * sin(phi);
    
    positionX = currTarget.position.x + derivedX;
    positionY = currTarget.position.y + derivedY;
    positionZ = currTarget.position.z + derivedZ;
  }
  
  public void AddLookAtTarget(PVector position) {
    Target newTarget = new Target(position);
    targets.add(newTarget);
  }
  
  public void CycleTarget() {
    if (targetIndex == 6) {
      targetIndex = 0;
    } else {
      targetIndex++;
    }
    
    currTarget = targets.get(targetIndex);
  }
  
  public void Zoom(float amount) {
    perspective(radians(amount), width/(float)height, 0.1, 1000);
  }
  
}
