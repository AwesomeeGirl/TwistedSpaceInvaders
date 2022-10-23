/**
*Represents the missile fired
*@author Saumya Agawral, Veena Krishnan
*/

class Missile{
  float xpos;
  float ypos;
  float yspeed;
  String missileLink;
  
/**
*Determines the initial position of the missile based on the position of the launcher
*/
  Missile() {
    xpos = myRocket.xpos;
    ypos = 400;
    yspeed = 10;
  }
  
/**
*Sets the missile graphics
*@return missileLink The link to the drawing for the missile sprite
*/
  String display() {
    missileLink = "missile.png";
    return missileLink;
  }
 
/**
*Simulates the missile firing upwards by decreasing the y coordinate
*/
  void shoot() {
     ypos = ypos - yspeed; 
  }

/**
*Returns the alien to the location of the launcher to restart firing process
*/
  void remove() {
    ypos = 400;
  }
}
