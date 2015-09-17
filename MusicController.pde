import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

class MusicController {
  
  private Minim minim;
  private AudioPlayer track;
  private ShapeController shapes;
  private BeatDetect beat;
  private FFT fft;
  private LinkedList<String> modesList;
  private String[] modes = {"BEAT","FFT"};
  private String mode;
  
  public MusicController(Object sup, ShapeController shapes){
    modesList = new LinkedList<String>(Arrays.asList(modes));
    mode = modesList.peek();
    minim = new Minim(sup);
    track = minim.loadFile(dataPath("game-of-thrones-main-theme-80s-version.mp3"), 2048);
    beat = new BeatDetect(track.bufferSize(), track.sampleRate());
    this.shapes = shapes;
    fft = new FFT(track.bufferSize(), track.sampleRate());
  }
  
  public void start(){
    track.loop();
  }
  
  public void switchMode(){
    this.mode = modesList.remove();
    modesList.add(this.mode);
  }
  
  public void stop(){
    track.close();
    minim.stop();
  }
  
  public void influenceShapes(){
    if(mode == "BEAT") beatMode();
    if(mode == "FFT") fftMode();
  }
  
  public void beatMode(){
    beat.detect(track.mix);
    if(beat.isKick()) shapes.impulse(floor(random(width)), floor(random(height)), floor(map(track.mix.level(), 0, 1, 0, floor(shapes.N_SHAPES/3))));
    if(beat.isHat()) shapes.impulse(floor(random(width)), floor(random(height)), floor(map(track.mix.level(), 0, 1, 0, floor(shapes.N_SHAPES/3))));
    if(beat.isSnare()) shapes.impulse(floor(random(width)), floor(random(height)), floor(map(track.mix.level(), 0, 1, 0, floor(shapes.N_SHAPES/3))));
  }
  
  public void fftMode(){
    fft.linAverages(shapes.N_SHAPES);
    fft.forward(track.mix);
    for(int i = 0; i < fft.avgSize(); i++){
      shapes.columnImpulse(i, fft.getAvg(i));
    }
  }
  
}
  
