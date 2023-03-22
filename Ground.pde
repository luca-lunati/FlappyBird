/*
 *Bewegung des Bodens
*/
class Ground{
 PImage img;
private float x1 = 0;

float speed = displayWidth/75;
  Ground(){
       img  = loadImage("ground.png");
  }
  void paint(){
    image(img,x1,groundY,displayWidth*2,displayHeight-groundY);

  }
  
    void move(){
      x1-=speed;
    if(x1<=0-displayWidth){
       x1=0;
    }  
  }
}
