MusicController music;
ShapeController shapes;
color[] p1 = {#0BFFDB, #6522F1, #FF2A05, #FFD80E, #03FF4D};
color[] p3 = {#7F0300, #FF514C, #FF0600, #D94F4C, #CC0500};
color[] p4 = {#7F6C00, #FFE34C, #FFD700, #D9C34C, #CCAC00};
color[] p5 = {#127F00, #65FF4C, #23FF00, #60D94C, #1CCC00};
color[] p6 = {#00277F, #4C83FF, #004EFF, #4C77D9, #003FCC};
color[] p7 = {#7F006B, #FF4CE3, #FF00D6, #7F2671, #CC00AB};
color[][] palettesList = {p1, p3, p4, p5, p6, p7};
LinkedList<color[]> palettes;

void setup(){
  colorMode(HSB, 360);
  background(0);
  size(800, 800);
  
  palettes = new LinkedList<color[]>(Arrays.asList(palettesList));
  
  shapes = new ShapeController(palettes.peek());
  music = new MusicController(this, shapes);
  music.start();
}

void draw(){
  fill(0, 25);
  rect(0, 0, width, height);
  music.influenceShapes();
  shapes.display();
}

void mousePressed(){
  shapes.chooseColumnColor();
  if(mouseY < height/2){
    if(mouseX < width/2){
      shapes.waveImpulseRight();
    }else{
      shapes.waveImpulseLeft();
    }
  }else{
    if(mouseX >= width/2){
      shapes.waveImpulseRightCenter();
    }else{
      shapes.waveImpulseLeftCenter();
    }
  }
}

void switchPalette(){
  palettes.add(palettes.remove());
  shapes.setPalette(palettes.peek());
}

void keyReleased(){
  if(key == 'f') shapes.switchMode();
  if(key == 'c') shapes.switchColorMode();
  if(key == 'p') switchPalette();
  if(key == 's') music.switchMode();
}

void stop(){
  music.stop();
  super.stop();
}
