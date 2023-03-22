/*
*Zum Lesen und Schreiben des Highscores, groesstenteils aus dem Internet uebernommen 
*/
class Reader{
  Reader(){
     try{
    File yourFile = new File("highscore.txt");
   
    yourFile.createNewFile();
   } catch (IOException e) {
     // e.printStackTrace();
    }
  }
int getHighscore() {
  BufferedReader reader = createReader("highscore.txt");
  String line = null;
  try {
    if ((line = reader.readLine()) != null) {
      return Integer.parseInt(line);
    }
    reader.close();
  } catch (IOException e) {
    e.printStackTrace();
  }
  return 0;
} 

  
PrintWriter output;

void updateScore(int score) {
  output = createWriter("highscore.txt"); 
  output.println(score); 
  output.flush(); 
  output.close(); 
}
}
