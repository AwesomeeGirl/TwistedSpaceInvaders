/**
*Represents the rocket shooting
*@author Saumya Agawral, Veena Krishnan
*/
class Rocket{
  float xpos;
  float ypos;
  float xspeed;
  String rocketLink;
  
 /**
*Determines the initial position of the rocket and its lateral speed
*/
  Rocket() {
    xpos = 250;
    ypos = 400;
    xspeed = 10;
  }
  
/**
*Sets the rocket graphics
*@return rocketLink The link to the drawing for the rocket sprite
*/ 
  String display() {
    rocketLink = "rocket.png";
    return rocketLink;
  }
  
 /**
*Simulates the rocket moving right based on the initial speed and stops it from moving right of the frame
*/
  void moveRight() {
    xpos = xpos + xspeed;
    if (xpos > 500) {
      xpos = 500;
    }
  }

  /**
*Simulates the rocket moving left based on the initial speed and stops it from moving left of the frame
*/
 void moveLeft(){
   xpos = xpos - xspeed;
   if (xpos < 0) {
     xpos = 0;
   }
 }
}
