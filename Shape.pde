import java.util.*;

public class Shape {
  
  private int shapeWidth, shapeHeight;
  private color shapeColor;
  private int alpha;
  private LinkedList<Integer> impulseOrder;
  private LinkedList<Integer> impulseColor;
  
  public Shape(int shapeWidth, int shapeHeight){
    impulseOrder = new LinkedList<Integer>();
    impulseColor = new LinkedList<Integer>();
    this.shapeWidth = shapeWidth;
    this.shapeHeight = shapeHeight;
    this.alpha = 0;
    shapeColor = color(120, 120, 120, 125);
  }
  
  public void display(int posX, int posY){
    strokeWeight(3);
    stroke(0);
    this.impulseControl();
    fill(shapeColor, alpha);
    rect(posX, posY, shapeWidth, shapeHeight);
    this.alpha = 0;
  }
  
  public int getShapeWidth(){
    return this.shapeWidth;
  }
  
  public int getShapeHeight(){
    return this.shapeHeight;
  }
  
  public void setLight(color c, int impulse){
    this.impulseColor.add(c);
    this.impulseOrder.add(impulse);
  }
  
  private void impulseControl(){
    if(!impulseOrder.isEmpty()){
      if(impulseOrder.peek() <= 0){
        int c = impulseColor.poll();
        alpha = 360;
        this.shapeColor = color(hue(c), saturation(c), brightness(c));
        impulseOrder.poll();
      }
      for(int i = 0; i < impulseOrder.size(); i++){
        impulseOrder.set(i, impulseOrder.get(i) - 1);
      }
    }
  }
}
