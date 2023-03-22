Bird bird;
/*
* Main Methode
*/
Ground ground;
Pipe[] pipes= new Pipe[2];
float groundY;
PImage bg;
Reader reader;
int highscore;
//Initialisieren der Bilder und Objekte
void setup(){
  reader = new Reader();
  frameRate(30);
  size(displayWidth,displayHeight);
  bg = loadImage("background.png");
  image(bg,0,0,width,height);
  bird = new Bird();
  groundY = displayHeight -displayHeight/7;
  ground = new Ground();
  resetPipes();
  highscore = reader.getHighscore();
}

//Animieren der Sprites und Anzeigen von Text
void draw(){
   image(bg,0,0,width,height);
   if(bird.flying){
       bird.fall();
      if(!bird.crashed ){    
        pipes[0].move();        
        pipes[1].move();
        ground.move();
      }
      
   }else{
     if(!bird.crashed ){ 
      bird.hover();
        ground.move();
     }
   }
   pipes[0].paint();
   pipes[1].paint();
   
   ground.paint();
   
   bird.paint();
   checkCollision(pipes[0]);
   checkCollision(pipes[1]);
   textSize(150);
   textAlign(CENTER,CENTER);
   text(bird.score, displayWidth/2,displayHeight/4);
   textAlign(BOTTOM,RIGHT);
   textSize(80);
   text("Highscore: "+highscore, 50,80);
   if(bird.crashed){
     textSize(100);
     textAlign(CENTER,CENTER);
     text("Restart", displayWidth/2,displayHeight/2);
     if(bird.score>highscore){
       reader.updateScore(bird.score);
       highscore = reader.getHighscore();
     }
   }
}

 //Prueft Kollision, *0.5 braucht es wegen der Drehung, sonst wird nicht mehr korrekt geprueft
  void checkCollision(Pipe p){
   if(bird.x+bird.sizeX*0.5>p.x && bird.x-bird.sizeX*0.5<p.x+p.w){
        if(!(bird.y-bird.sizeY*0.5>p.y+p.h && bird.y+bird.sizeY*0.5<p.bottomY)){
          bird.crashed =true;
        }
      
      if(!p.wasPassed&&bird.x>p.x){
        bird.score++;
        p.wasPassed = true;
      }
      }
 }
 //Zum Starten vom Spiel und Springen
void touchStarted(){
  if(!bird.crashed){
    bird.jump();
  } else {
    if(mouseX>displayWidth/3&&mouseX<displayWidth/3*2&& mouseY>displayHeight/5*2&&mouseY<displayHeight/5*3){
    bird = new Bird();
    resetPipes();
    }
  }
}

void resetPipes(){
  pipes[0] = new Pipe(displayWidth);
  pipes[1] = new Pipe(displayWidth*1.5+pipes[0].w);
}
