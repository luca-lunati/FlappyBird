/*
 *Enthaelt Animation und Bewegung des Vogels
*/
class Bird{
 PImage bird1;
 PImage bird2;
 PImage bird3;
 private float sizeX = 255;
  private float sizeY = 180;
  
  private float x = displayWidth/2-sizeX/2;
  private float y = displayHeight/2;
  
  private float speed = 0;
  private float g = 5.5;
  boolean crashed = false;
  boolean flying = false;
  private int score = 0;
  private float hoverV= 0;
  private int counterI=0;
  boolean up = true;
  Bird(){
    bird1 = loadImage("bird1.png");
    bird2 = loadImage("bird2.png");
    bird3 = loadImage("bird3.png"); 
  }
  void paint(){
      imageMode(CENTER);
      pushMatrix();
    pushStyle();
    translate(x, y);
      rotate(speed*0.6*TWO_PI/360);
         translate(-x, -y);
    fill(255,0,0);
    counterI++;
    float tmpX = x;
    float tmpY = y;
    if(counterI<5 || crashed){
      image(bird1,tmpX,tmpY,sizeX,sizeY);
    }else if(counterI<10){
       image(bird2,tmpX,tmpY,sizeX,sizeY);
    }else if(counterI<15){
       image(bird3,tmpX,tmpY,sizeX,sizeY);
    }else {
       image(bird2,tmpX,tmpY,sizeX,sizeY);
    }
    if(counterI>19){
      counterI = 0;
    }

    popStyle();
    popMatrix();
    imageMode(CORNER);
  }
  
  void hover(){
    if(!crashed){
     if(up){
       y+=2;
       hoverV++;
     } else{
        y-=2;
       hoverV--;
     }
     if(hoverV == 30 ||hoverV == -30){
       up = !up;
     }
    }
  }
  void fall(){
    if(flying){
      if(y<groundY-sizeY){
        y += speed;
      } else{
        crashed = true;
        flying = false;
      }
     speed +=  g;
    }
  }

  void jump(){
   if(y>sizeY/2){
    //  time = 1;
      speed = -50;
   }
   flying = true;

  }
}
