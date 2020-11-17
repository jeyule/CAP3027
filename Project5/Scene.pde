class Scene
{
  // TODO: Write this class!
  /*
    Things you'll need:
    Some way to store PShapes and their positions
    Some way to store lights--position plus color for the pointLight() function
    Other classes may be helpful here
    A background color for the scene
  */
  
  color backgroundColor;
  int numMeshes;
  HashMap<String, PVector> objPositions = new HashMap<String, PVector>();
  HashMap<String, Integer> objColors = new HashMap<String, Integer>();
  int numLights;
  ArrayList<PVector> lightPositions = new ArrayList<PVector>();
  ArrayList<Integer> lightColors = new ArrayList<Integer>();
  
  Scene(String file) {
    BufferedReader reader = createReader(file);
    
    try {
      // read the first line to get bg color
      
    }
  }
  
  void DrawScene()
  {
    // TODO: Draw all the information in this scene
    /*
      Just like using draw() with a regular sketch, things you would need to do
      Clear the screen with background()
      Set up any lights in this scene
      Draw each object in the correct location
    */
  }
}
