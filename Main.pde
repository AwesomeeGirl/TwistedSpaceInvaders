import java.util.*;
List<Alien> invaders;
Rocket myRocket;
Missile myMissile;
PImage[] bgimgs = new PImage[18];
int bgnum;
int delay;
/**
*@author Saumya Agawral, Veena Krishnan
*@version Processing 4.0.1
*/
int rocketChoice = 0;
PImage rimg;
PImage mimg;
boolean shoot = false;
boolean gameOver = true;
int highScore = 0;
int score;

/**
*Initializes Rocket, Missile, and Alien objects. 
*Initializes background images and score count
*Loads sprite avatars
*/
void setup() {
  size(500, 500);
  myRocket = new Rocket();
  myMissile = new Missile();
  invaders = new ArrayList<Alien>();
  for (int i=0;i<5;i++){
    invaders.add(new Alien());
  }
  for (int i = 0; i< bgimgs.length; i++) {
    String imageName = "background" + nf(i + 1, 2) + ".png";
    bgimgs[i] = loadImage(imageName);
  }
  bgnum = 0;
  delay = 0;
  score = 0;
  rimg = loadImage(myRocket.display());
  mimg = loadImage(myMissile.display());
}

/**
*Iterates through background images 
*Calls invasion for each alien, calls removal for alien and missile when position of missile matches the position of the alien
*Displays game over screen when alien hits the ground
*/
void draw() {
  background(bgimgs[bgnum]);
  if (delay % 50 == 0) {
    if (bgnum == bgimgs.length - 1) {
      bgnum = 0;
    }
    bgnum++;
  }
  textAlign(CENTER);
  textFont(createFont("PartyLetPlain", 25, true));
  text("Move left and right using arrow keys. Fire using space bar or up button.", width/2, 50);
  text("Score: " + score, width/2, 65);
  if (delay % 200 == 0) {
    int oldRocketChoice = rocketChoice;
    rocketChoice = (int) random(2);
    if (oldRocketChoice != rocketChoice) {
      
    }
  }
  for (Alien invader: invaders) {
    PImage img = loadImage(invader.display());
    invader.invade();
    invader.changeColor();
    image(img, invader.xpos, invader.ypos, img.width/5, img.height/5);
    delay++;
    if ((myMissile.xpos < invader.xpos+ 25 && (myMissile.xpos) > invader.xpos-25) &&
      (myMissile.ypos < invader.ypos+25 && myMissile.ypos > invader.ypos-25)) {
        invader.remove();
        myMissile.xpos = myRocket.xpos;
        myMissile.remove();
        shoot = false;
        score++;
      }
      if (invader.ypos > 450) {
        gameOver = true;
      }
  }
    image(mimg, myMissile.xpos, myMissile.ypos, 75, 90);
    image(rimg, myRocket.xpos, myRocket.ypos, 75, 90);
    if (myMissile.ypos != 0 && shoot) {
      myMissile.shoot();
    } else if (myMissile.ypos == 0) {
      myMissile.xpos = myRocket.xpos;
      myMissile.remove();
      shoot = false;
    }
    if (gameOver) {
      for (Alien alien: invaders) {
        alien.endScreen();
      }
      if (score > highScore) { highScore = score; }
      clear();
      textFont(createFont("PartyLetPlain", 45, true));
      fill(#C6C2EA);
      textAlign(CENTER);
      text("Flashing Screen", width/2, height/2-75);
      textFont(createFont("PartyLetPlain", 45, true));
      text("Game Over", width/2, height/2-25);
      textFont(createFont("PartyLetPlain", 45, true));
      text("Your Score: " + score, width/2, height/2+20);
      textFont(createFont("PartyLetPlain", 45, true));
      noFill();
      stroke(#C6C2EA);
      rectMode(CENTER);
      rect(width/2, height/2+60, 100, 50);
      fill(#C6C2EA);
      textFont(createFont("PartyLetPlain", 30, true));
      text("Replay", width/2, height/2+70);
      textFont(createFont("PartyLetPlain", 45, true));
      text("HIGH SCORE: " + highScore, width/2, height/2+125);
      noLoop();
  }
}

/**
*User input through keyboard to move rocket launcher and to shoot missile 
*/
void keyPressed(){
  if (keyCode == LEFT) {
    myRocket.moveLeft();
    image(rimg, myRocket.xpos, myRocket.ypos, 75, 90);
    myMissile.xpos = myRocket.xpos;
  }
  if (keyCode == RIGHT) {
    myRocket.moveRight();
    image(rimg, myRocket.xpos, myRocket.ypos, 75, 90);
    myMissile.xpos = myRocket.xpos;
  }
  
  if (keyCode == UP || key == ' ') {
      myMissile.shoot();
      shoot = true;
    image(mimg, myMissile.xpos, myMissile.ypos, 75, 90);
  }
}

/**
*User input through mouse to restart game when a point in the restart box is clicked 
*/
void mousePressed() {
  if ((mouseX > (width/2)-50) && (mouseX < (width/2) + 50) && gameOver && 
  (mouseY > (height/2+60)-25) && (mouseY < (height/2+60)+25)){
    setup();
    loop();
    gameOver = false;
  }
}
