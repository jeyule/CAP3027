public class Camera {
    
  float positionX = 600;
  float positionY = 600;
  float positionZ = 800;
  
  public void Update() {
    
    float derivedX = 800 * cos(radians(phi)) * sin(radians(theta));
    float derivedY = 800 * cos(radians(theta));
    float derivedZ = 800 * sin(radians(theta)) * sin(radians(phi));
    
    positionX = width/2 + derivedX;
    positionY = height/2 + derivedY;
    positionZ = derivedZ;
  }
  
}
