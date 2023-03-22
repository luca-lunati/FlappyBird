/*
*Enthaelt die zwei Haelften einer Roehre(oben und unten) mit Bewegung
*/
class Pipe{
  float w = displayWidth / 5;
  float h;
  float x,y;
  float bottomY;
  float speed = displayWidth/75;
  float minHeight=displayHeight/7;
  float holeSize = displayHeight/4;
  boolean wasPassed = false;
  Pipe(float x){
    this.x = x+displayWidth;
    
    setHeight();
  }
  void setHeight(){
    h = random(minHeight,groundY-minHeight*2);
  }
  void move(){
    if(x>0-w){
      x-=speed;
    } else {
      x=displayWidth+w;
      setHeight();
      wasPassed = false;
    }
  }
  
  void paint(){
    pushStyle();
    strokeWeight(10);
    stroke(0,0,0);
    fill(133,188,72);

    rect(x,y,w,h);
    rect(x-10,y+h-80,w+20,110);
    
    bottomY = y+h+holeSize;
    rect(x,bottomY,w,groundY-bottomY);
    rect(x-10,bottomY,w+20,110);
    popStyle();
  }
  
}
