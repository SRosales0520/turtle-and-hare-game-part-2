//variables for moving the turtle left right , and down
int turtleY = 0;
int turtleRightAndLeft = 1500;
int hareY = 0;
int hareRightAndLeft = 500;

// variables for loaded images
PImage tortoiseimg;
PImage hareimg;
PImage checkerbanner;

// string for the go message
String message = "GO!";

//variable that tracks if the final message has been displayed
boolean messageDisplayed = false;

//variable to start timer
int startTimeMs;

//time until game starts in milliseconds
final int startDelayMs = 5000;
boolean atStartup = true;
//variable to start stage 2
boolean stage2 = false;

// sets the restart button to be off
boolean restartButton = false;

void setup()
{
  size(2000, 1500);
  
  //loads the images for the game
  tortoiseimg = loadImage("tortoise.png");
  hareimg = loadImage("hare.png");
  checkerbanner = loadImage("Checkerboard-banner.jpg");
  
  //sets the image and text mode to center
  imageMode(CENTER);
  textAlign(CENTER);
  
  //current time in milliseconds
  startTimeMs = millis();
}

void draw()
{
  //sets rectangle mode to center
  rectMode(CENTER);
  
  if( restartButton == false )
  {
    //if in startup time window, show countdown
    if (atStartup)
    {
      //current time in ms
      int curTimeMs = millis();
      
      //remaining time in startup period
      int startupTimeRemainingMs = startDelayMs - (curTimeMs - startTimeMs);
      startScreen(startupTimeRemainingMs);
      atStartup = startupTimeRemainingMs > 0;
      return;
    }
    
    background(0);
    text(message, width/2, height/2); 
    
    //place the image at a position on the screen
    image(checkerbanner, 1000, 1450, 2000, 100);
    image(tortoiseimg, turtleRightAndLeft, turtleY);
    image(hareimg, hareRightAndLeft, hareY, 300, 300); 
    
    if (messageDisplayed == false && hareY>1625)
    {
     //displays the win message if the hare wins
     fill(0);
     rect(width/2, height/2, 175, 100);
     textSize(100);
     fill(#28E5F5);
     text("Hare has won!\nTurtle is a slowpoke!\n\nclick to play lvl 2", 1000, 900);
     restartButton = true;
     messageDisplayed=true;
     
     //makes the reset button
     textSize(75);
     fill(255);
     rect(1000, 1000, 225, 78);   
     fill(0);
     text("RESET", 1000, 1000);
     
     //makes the stage 2 variable = true
     stage2 = true;
    }
    if (messageDisplayed == false && turtleY>1615)
    {
      
     //displays the win message if the turtle wins
     fill(0);
     rect(width/2, height/2, 175, 100);
     fill(#28E5F5);
     textSize(100);
     text(" Turtle has won!\nHare is a slow poke!\n\nclick to play lvl 2", 1000, 900);
     restartButton = true;
     messageDisplayed=true;
     
     //makes the reset button
     textSize(75);
     fill(#28F548);
     rect(1000, 1000, 225, 78);   
     fill(0);
     text("RESET", 1000, 1000);
     
     
     //makes the stage 2 variable = true
     stage2 = true;
    }
  }

}

void keyPressed()
{
  // sets the keys that are used to move around
  if (key == 's')
  {
    hareY += 15;
  }
  
  if (key == 'k')
  { 
    turtleY += 15; 
  }
  if (key == 'j')
  {
    turtleRightAndLeft = turtleRightAndLeft  -15; 
  }
  if (key == 'l')
  {
    turtleRightAndLeft = turtleRightAndLeft  +15; 
  }
  if (key == 'a')
  {
    hareRightAndLeft = hareRightAndLeft  -15; 
  }
  if (key == 'd')
  {
    hareRightAndLeft = hareRightAndLeft  +15; 
  }
}

void startScreen(int remainingTimeMs)
{
  background(50);
  textSize(100);
  fill(#46D8FF);
  textAlign(CENTER, CENTER);
  //show the countdown
  text("to play the game, \n tap s to move the hare down\n or tap k to move the turtle down", width/2, 450);
  fill(255, 0, 0);
  text(ceil(remainingTimeMs/1000.0), width/2, height/2);
}

void mousePressed()
{
  if(restartButton == true && mouseX > 888 && mouseX < 1112 && mouseY > 951 && mouseY <1049)
  {
    turtleY = 0;
    hareY = 0;
    turtleRightAndLeft = 1500;
    hareRightAndLeft = 500;
    restartButton = false;
    
  }
}


void mouseClicked()
{
  //Launches stage 2 if the screen is clicked and stage2 boolean==true
  if (stage2==true)
  {
    exec("\\\\sc-sh-file-1\\Users-sh\\Students\\sarosales\\My Documents\\Processing\\hare_and_tortoise_lvl_2\\hare_and_tortoise_lvl_2_pde\\application.windows32\\hare_and_tortoise_lvl_2_pde.exe");
    println("LAUNCH!");
  }
}
