public class ShapeController {
  
  public final static int N_SHAPES = 25;
  private Shape[][] shapes;
  private color[] palette;
  private LinkedList<String> modesList;
  private String[] modes = {"STAR","SQUARE"};
  private color columnColor;
  private String mode;
  private LinkedList<String> colorModesList;
  private String[] colorModes = {"MULTIPLE","SINGLE"};
  private String colorMode;
  
  public ShapeController(color[] palette){
    modesList = new LinkedList<String>(Arrays.asList(modes));
    mode = modesList.peek();
    colorModesList = new LinkedList<String>(Arrays.asList(colorModes));
    colorMode = colorModesList.peek();
    this.palette = palette;
    this.chooseColumnColor();
    shapes = new Shape[N_SHAPES][N_SHAPES];
    for(int i = 0; i < shapes.length; i++){
      for(int j = 0; j < shapes.length; j++){
        shapes[i][j] = new Shape(width/N_SHAPES, width/N_SHAPES);
      }
    }
  }
  
  public void setPalette(color[] palette){
    this.palette = palette;
  }
  
  public void switchMode(){
    this.mode = modesList.remove();
    modesList.add(this.mode);
  }
  
  public void switchColorMode(){
    this.colorMode = colorModesList.remove();
    colorModesList.add(this.colorMode);
  }
  
  public void display(){
    for(int i = 0; i < shapes.length; i++){
      for(int j = 0; j < shapes.length; j++){
        shapes[i][j].display(i * shapes[i][j].getShapeWidth(), j * shapes[i][j].getShapeHeight());
      }
    }
  }
  
  public void impulse(int posX, int posY, int impulseIntensity){
    if(mode == "STAR"){
      this.impulseStar(posX, posY, impulseIntensity);
    }
    if(mode == "SQUARE"){
      this.impulseSquare(posX, posY, impulseIntensity);
    }
  }
  
  public void chooseColumnColor(){
    columnColor = palette[floor(random(0, palette.length))];
  }
  
  public void columnImpulse(int posX, float impulseIntensity){
    int mappedImpulse = floor(map(impulseIntensity, 0, 20, 0, N_SHAPES));
    if(mappedImpulse > N_SHAPES){
      mappedImpulse = N_SHAPES;
    }
    for(int i = 0; i < mappedImpulse; i++){
      shapes[posX][N_SHAPES - 1 - i].setLight(columnColor, i);
    }
  }
  
  public void impulseStar(int posX, int posY, int impulseIntensity){
    color c = palette[floor(random(0, palette.length))];
    int xCord = floor(map(posX, 0, width, 0, N_SHAPES));
    int yCord = floor(map(posY, 0, height, 0, N_SHAPES));
    for(int i = xCord - impulseIntensity; i <= xCord + impulseIntensity; i++){
      for(int j = yCord - impulseIntensity; j <= yCord + impulseIntensity; j++){
        int distance = abs(xCord - i) + abs(yCord - j);
        if( distance <= impulseIntensity && i >= 0 && j >= 0 && i < N_SHAPES && j < N_SHAPES){
          if(colorMode == "MULTIPLE"){
            shapes[i][j].setLight(palette[floor(random(0, palette.length))], distance * 2);
          }else{
            shapes[i][j].setLight(c, distance * 2);
          }
        } 
      }
    }
  }
  
  public void impulseSquare(int posX, int posY, int impulseIntensity){
    color c = palette[floor(random(0, palette.length))];
    int xCord = floor(map(posX, 0, width, 0, N_SHAPES));
    int yCord = floor(map(posY, 0, height, 0, N_SHAPES));
    for(int i = 0; i <= (2*impulseIntensity); i++){
      for(int j = i; j <= (2*impulseIntensity) - i; j++){
        int xCord1 = i + (xCord - impulseIntensity);
        int yCord1 = j + (yCord - impulseIntensity);
        int xCord2 = j + (xCord - impulseIntensity);
        int yCord2 = i + (yCord - impulseIntensity);
        int xCord3 = (2*impulseIntensity) - i + (xCord - impulseIntensity);
        int yCord3 = j + (yCord - impulseIntensity);
        int xCord4 = j  + (xCord - impulseIntensity);
        int yCord4 = (2*impulseIntensity) - i + (yCord - impulseIntensity);
        if(xCord1 >= 0 && yCord1 >= 0 && xCord1 < N_SHAPES && yCord1 < N_SHAPES &&
           xCord2 >= 0 && yCord2 >= 0 && xCord2 < N_SHAPES && yCord2 < N_SHAPES &&
           xCord3 >= 0 && yCord3 >= 0 && xCord3 < N_SHAPES && yCord3 < N_SHAPES &&
           xCord4 >= 0 && yCord4 >= 0 && xCord4 < N_SHAPES && yCord4 < N_SHAPES){
            if(colorMode == "MULTIPLE"){
              shapes[xCord1][yCord1].setLight(palette[floor(random(0, palette.length))], 2 * ((2*impulseIntensity)-i));
              shapes[xCord2][yCord2].setLight(palette[floor(random(0, palette.length))], 2 * ((2*impulseIntensity)-i));
              shapes[xCord3][yCord3].setLight(palette[floor(random(0, palette.length))], 2 * ((2*impulseIntensity)-i));
              shapes[xCord4][yCord4].setLight(palette[floor(random(0, palette.length))], 2 * ((2*impulseIntensity)-i));
            }else{
              shapes[xCord1][yCord1].setLight(c, 2 * ((2*impulseIntensity)-i));
              shapes[xCord2][yCord2].setLight(c, 2 * ((2*impulseIntensity)-i));
              shapes[xCord3][yCord3].setLight(c, 2 * ((2*impulseIntensity)-i));
              shapes[xCord4][yCord4].setLight(c, 2 * ((2*impulseIntensity)-i));
            }
        }
      }
    }
  }
  
  public void waveImpulseRight(){
    color c = palette[floor(random(0, palette.length))];
    for(int i = 0; i < shapes.length; i++){
      for(int j = 0; j <= i; j++){
        shapes[i-j][j].setLight(c,i);
        shapes[N_SHAPES - 1 - i + j][N_SHAPES - 1 - j].setLight(c, ((N_SHAPES - 1) * 2) - i);
      }
    }
  }
  
  public void waveImpulseLeft(){
    color c = palette[floor(random(0, palette.length))];
    for(int i = shapes.length - 1; i >= 0; i--){
      for(int j = 0; j <= shapes.length - 1 - i; j++){
        shapes[i + j][j].setLight(c,N_SHAPES - i);
        shapes[N_SHAPES - 1 - i - j][N_SHAPES - 1 - j].setLight(c, (i * 2) + N_SHAPES);
      }
    }
  }
  
  public void waveImpulseRightCenter(){
    color c = palette[floor(random(0, palette.length))];
    for(int i = 0; i < shapes.length; i++){
      for(int j = 0; j <= i; j++){
        shapes[i-j][j].setLight(c,i);
        shapes[N_SHAPES - 1 - i + j][N_SHAPES - 1 - j].setLight(c, i);
      }
    }
  }
  
  public void waveImpulseLeftCenter(){
    color c = palette[floor(random(0, palette.length))];
    for(int i = shapes.length - 1; i >= 0; i--){
      for(int j = 0; j <= shapes.length - 1 - i; j++){
        shapes[i + j][j].setLight(c,(N_SHAPES - i));
        shapes[N_SHAPES - 1 - i - j][N_SHAPES - 1 - j].setLight(c, (N_SHAPES - i));
      }
    }
  }
}
