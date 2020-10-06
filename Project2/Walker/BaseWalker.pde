// the base walker abstract class from which squareWalker and hexagonWalker are derived

abstract class BaseWalker {
  
  // initial states
  boolean colors = false;
  boolean outline = true;
  boolean constrain = true;
  boolean terrain = true;
  boolean seed = false;
  
  // defaults
  float x, y, step;
  int iterations;
  int stepCount = 0;
  int stepRate = 1;
  int stepSize = 10;
  float stepScale = 1.0;
  int seedValue = 0;
  
  //store the x and y coordinates of this frame update
  FloatList pointsX = new FloatList();
  FloatList pointsY = new FloatList();
  FloatList stepNumbers = new FloatList();
  
  HashMap<PVector, Integer> terrainMap = new HashMap<PVector, Integer>();
  
  // constructor
  public BaseWalker() {}
  
  public BaseWalker(int iters, int steps) { 
    x = 0;
    y = 0;
    step = 0;
    iterations = iters;
    stepRate = steps;
  }
  
  public abstract void step();
  public abstract void render();
  
}
